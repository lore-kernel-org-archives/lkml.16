Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCEF5479B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282853; cv=fail; b=EE18sz3kIVk8ZQFUyVdxBdXmyIjQtr55L1CnqIQwdHP03/EK0+ILV8GJxKF5UVmsokOcFhdmSubujHOhNB9hisokoHIodivl3EF8py/AA7AIeGfxh+NB5QxIN5kwDnXIYgbRWo8gfjkQC8RxCl++LJZH2W8Mzmip05+1kOjjSKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282853; c=relaxed/simple;
	bh=7c1bKEMrkH/+sf0fkCeJhBbP239Kq4mJ5CSlTNLRtXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WiNQ2DX4WTwnsVMkrlNAWVjb5opXOdO+xpqQaic79dNeZ0q9O2h9ELoFxmls8b5kBIn3VhRG0lRzTYlUA0pITIOdmQYrc7sVl9/CsEab9wiw9DlYEl50Sb2btPvRM1QgYVU7CiTPiaPcCRz8uruubT3B/TFzmHwoLwOkMogA16I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqiIxyMN; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqiIxyMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751282852; x=1782818852;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7c1bKEMrkH/+sf0fkCeJhBbP239Kq4mJ5CSlTNLRtXI=;
  b=bqiIxyMN10OPsw/dlzH9F2+x8SlECLlQHPvbSAjzMSvA31G5lQi3Bkyk
   cT8P3xd/7LAb9HDJf7UqRmlFoZXG3zam9clwOQcalHPn+zuQNru3EIqyK
   ih5AXk1DsVcn88uVRSDI0WI3LWjmXjZXt5iUFSs/VcJYYrVzOsdaOG0Dv
   kvbz0snODgGSH3bDtt7JWFMqCKgNJjduaHryWkPLFXg3QEdbdsc9jRHcn
   O4PHAYUXZrpeY6OAX7T9O+d/+6SnwvFWlAwNHxnP1HUUx70Z4UZbR8lJK
   7mBspE5Fi6kMsOPvODUNgZVvcnCwWAG+7aSSinnMpDk29NLARlZf/H6hH
   g==;
X-CSE-ConnectionGUID: z+OBXEVMRV6kZUAxfzJ7Vw==
X-CSE-MsgGUID: OMMSLvKGRcelEq9gKRRy1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64100459"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64100459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:27:31 -0700
X-CSE-ConnectionGUID: /P/NYw+ASomlkY5wx936/w==
X-CSE-MsgGUID: 8m5a74sjT4yTeiyqFHyEKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="184455673"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:27:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 04:27:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 04:27:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 04:27:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ggp65feIHaLLi6cjI27Kj7FmJlfqR8oUgK2UxSqY+RO3gRJCcRaP+EpPy6Pkxt+KT8SGmTY15CJMN+r1BcImSTYpdFoQgOEzIiTgNcmksX49Ncs2QX7JXuLPBT8itKZiSyIMOlKYF9d9PLQVdfGM4ES3ZRoLDuDfjn6ANkVJ980BoUZmqN55DSPuXLPsNluMq1J/1lQfKFiznMWP+mq9n224hLyIPFXECn/9vNFNwihhB/sCHO5Ijha0i5xpgn7DbPQrpTQwylrC2lAtTiIffQW49mI7m68n/EZDMKuUftuWYVoqZ6g6K1OBAiFw+3rrNmX2EgoGOYB7LLZ8vQVuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c1bKEMrkH/+sf0fkCeJhBbP239Kq4mJ5CSlTNLRtXI=;
 b=yEOyDMu+ewSQu1tBDuL/yBSwZvF2a4rZVOVcbZ41rlQkcSBkKgbv7EiD4wtNRnzORJCnaHIPpD0jRcOnC+5rL8wDjVq9k4MQlXPE4sEBB3Y72wH6DVj4ehfoNm+MOOMAD28+8dD4snXSNcQPdAf8MPFpY8G1zyHwqdsvUPGGFoRHnylPO/flzCEkDG9RZTUymBddOoMhweSxg1aefgDIU4p9A7eQbL9NLpd0o3KTNC81GL6txmcI/rcpUCp5M7ceDajtjHDcL0Fk1lefd6gzfT57AcCDRMf5bMIpklbpJoQU20h4xAhiGx4RlBnF2E7Xmel+0ihMPcOuedXT4BMejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS4PPF641CF4859.namprd11.prod.outlook.com (2603:10b6:f:fc02::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 30 Jun
 2025 11:27:14 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 11:27:14 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next v2] mei: bus: fix device leak
Thread-Topic: [char-misc-next v2] mei: bus: fix device leak
Thread-Index: AQHb5PnBD41lwh8Xa0K5qwLV+EJSerQYgVYAgAMMHgCAAAnvAIAAAS9g
Date: Mon, 30 Jun 2025 11:27:14 +0000
Message-ID: <CY5PR11MB6366BBFF44C7F21C24292590ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
 <2025062836-twentieth-kudos-1148@gregkh>
 <CY5PR11MB63664DE1B93F480CCC199D8FED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025063022-riverbed-country-5c2b@gregkh>
In-Reply-To: <2025063022-riverbed-country-5c2b@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DS4PPF641CF4859:EE_
x-ms-office365-filtering-correlation-id: ffb4bc2a-3ca2-4aef-7a98-08ddb7c9100c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZFNFNGtNU016SVNMc3ZiWnJpenBOaHpsbUd2UXhLeHE1enlaVzF3dXlBQlNC?=
 =?utf-8?B?aU1iMVVTbk9KbndPYjRFRFh2MzZOc1lDbFk5Z3NNT0thazhLRnNOUVJpZmE3?=
 =?utf-8?B?emkyWUdYQ2pkRGlqVkgxNzVWL2J0d212ZkUwYzRZMUdTWE5BNFc5Y1JId2R4?=
 =?utf-8?B?ODgrTjBiK1VjUkp2Y1VmYU1rTW1BMmR2Ui9wdzl1ZUI1WWpUTXMxZEVrekNw?=
 =?utf-8?B?WllQbFlCb0dqb3hRYWF6TzVRRkpRUnM5ZENXQWtRNVMxemxNa2QzRFlRSEpn?=
 =?utf-8?B?a3dSZGM0czdnNTNzS1B5S2hXNFFIUFkzWnR2c3pVSzMxRXdrR0NLaEpINTJt?=
 =?utf-8?B?U0ZFYTJEcnJoNXpRSmVnTnF2c0hmVEZzZStPWGNyc0p3M0piK0g0V3E1ZjlR?=
 =?utf-8?B?aGcweUZCNTZlbGNmZk5UVkx5aW94Q3dGSm9Ud3FJbGdNSUNCTXdtNGJvMnVu?=
 =?utf-8?B?SENKSHduTldRWC9IQzhqSHd6WEszbE5tVVFXV3B5YlVqTVpEbWt1Y1d6ay9i?=
 =?utf-8?B?UWFPTzNyRDg4UG5OYktMRkFlVHlONkNRWWcrTFlDVU4xaE4xY3FvbE90SHYx?=
 =?utf-8?B?d2ZhZjdkenFxcW90YzFSNlpYdE1uVVZaNDRxbHNOY0gzRGVkR2tqcUNEWnpE?=
 =?utf-8?B?RTl4R2lKVGI4QjlPQ09SM2JNUk1ENm5ZU3J4UUlJZHViaDlkRVo0eDNuOEdE?=
 =?utf-8?B?Z2Z4MzVwWENJWlUvbXRldnlQbzVFQWxNa091SlRlNzhnQ0N3RGNYcUtjRFBl?=
 =?utf-8?B?WnR3TGxOTS8rVFo3WXM4dCt6TUVaYVozVjFPa3ZjZXlpL0JPYnBnMDVvaUJj?=
 =?utf-8?B?VWtEOXJpQXBBQVBHQkxOYXBsTE82SzR0RVpWTUdONi9IWGVJRXJ5VEpncjVB?=
 =?utf-8?B?RlZ6T0ZiMkR4dlNFQWp4S1VUek1say9pdW9XWmRqMzZTZlFzK0pOTjJjdzlM?=
 =?utf-8?B?ZFZyci9hU2tVeHUvUTNvSENwdlZ1MllyaGxwMlg2SlhYcVQvNU5WaktjMHk1?=
 =?utf-8?B?NDVuNHkrQmRhSEZ0RWNrWWJKMzZBbEl0akpZTEgxYTNGcUdadFIvOHExU1Av?=
 =?utf-8?B?Q1VmU3BObXduL29PSEZzUW5kV3k2K29ENllyNHNTK0Q5bG5Dc0U0bXFQb3BW?=
 =?utf-8?B?bDBRNnUvZGhOQ290eU5iM0ZBZm5kTmp2T3VzNWdKVkRHV1N6dzlVUkZpRGN4?=
 =?utf-8?B?NHdwNFA4NmgxdllmRUMvRTVSZTkrZHJPbVlFdnAzMWxEV0o1SUpXVHNTNTh3?=
 =?utf-8?B?MGNUVms5bnhXWlpDM21yS3dEUndQREgxL0IvTFlzdWdMVDUvcjJwbnpEcDls?=
 =?utf-8?B?b085U1k0eWI5WjNVa1dkSUJlU1h1SEREamJGQndta2RkZVgxNWtIRkExY1Rz?=
 =?utf-8?B?MTUzUjZTbkRvVGUxUVA0VWREWERBdnBJdjgybDFUNlR5ZWR1OVoybk90czZj?=
 =?utf-8?B?OVp3eGtqQmtkMkNJeHdaYTVZaS9wZWpzSEJFTjJQbjZDTjl6NHc4dE4yNmE5?=
 =?utf-8?B?SDJaL1NFY0ZCc1RlRVN3ZXo1OTFkZldXMmhtamVlZC9wSk5DT3lBMzlmOHJ2?=
 =?utf-8?B?WURXMDBDc0pmelN2WjBPTDZqeDhuWVluMzVxclJmVmkrcENISGU4ZlJRNG94?=
 =?utf-8?B?akwwaDVBOVJTNnRvcVc4YTdhdDB4WkdUV1ZEaTY4NjM5eTB5djlGajF2SlF5?=
 =?utf-8?B?SjVuL1psOGZMWnQyd2o2eERPVWV6YTFRWmRnL0hEZGw5NlpWQ0JsRmFFaTAr?=
 =?utf-8?B?OXZnL3RMek5ENmtMeG10MkpQNDR2OVdZWFo2QjhxbmRBRld1ZDUzcVNzZ2pC?=
 =?utf-8?B?cFA1NVVIaDhJMTFHTC9VdnZNVHgwN2lvaVk4NFQrbjg1R1hGaDRQbUZEQ0RV?=
 =?utf-8?B?VFlJT0dYMWYwQnl5U2tBSVNiT2RxR2JHbzdqQlVyRkkxNkRqQStDRnhYZW80?=
 =?utf-8?B?SHF2Sm1aSEdLZWFSS05HZWxrMkFiQkMvNjQrc3M1YitSR254UXl2eXRBaW1I?=
 =?utf-8?Q?vI6bCEY4tXSoJtwUx2KTIIHcwvMZLo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1d6R2dOZEhCWGdRWFNXUHJTUHhnTzRUZVJkdGRsMWhnbDY2dEZTZklxVU44?=
 =?utf-8?B?T0orTlNNenhGYSt6TEd6Z3hQU2JMUEptNnkxMzhmby9yMEVCbi8vbXgrbnBV?=
 =?utf-8?B?TmZUVU5wSVhaWDBsQnphRzhIWnFBSHp2VFNzdjVpdzlyRzVpMGYwenZ6aWdq?=
 =?utf-8?B?U05xY2JIQW9jV3AzYkhDMFdhZlE0TTloSTNreDdSN0p2Z09FSlViQ1A0L2Ji?=
 =?utf-8?B?Q1VESjU3bWZFcFQ5ZUVobFk0anBKT2p2T1ZuTnpwcGxjcVI5SjR2ajFqT2d1?=
 =?utf-8?B?Qk9CelNSTUVtZ2dCTGJFdGYxa1V2KzR6bThCQWI0NzBvVEpDVHI3R3NyQzcz?=
 =?utf-8?B?dVc3UkpvR0tiQWtGc0o4a0tpYjAycXV3ZWVXemEwWWlNRkZSd0JFR3R6MXBP?=
 =?utf-8?B?cS8yYWg4M0VqeWVhS0Qvb1c2ZlF3VG80dlIxRVNHZllqcUdvbGxqYXVoVTBo?=
 =?utf-8?B?WE9tM1UvamdObkgvQVVsZk5rN0ZXbEZzS28rMnEzWHdLOGEzNWxMdExDS2lE?=
 =?utf-8?B?UDhtdHJCSmNQTlk1a0JKMFpCNjNDbk4wdHB6dk1ZREI5ME9uVTdtUmZ5OTQ4?=
 =?utf-8?B?K1VpSGlHSXE1d0pNMm1OVE0yc2VuTUk2aTNTYUYxNVpKd3VISXA4T1MwOHVs?=
 =?utf-8?B?T0JtL0hoTGs0RW1uVjNtTS8vcmRQcCtEODhnczd4eGNVclhHVGZlN3NCeGNE?=
 =?utf-8?B?RElRc21kcWVMN09MN081MXZ5V3d4SVdFWjR2UVJ5ekhIQVJqK2dJUE5XK2Zs?=
 =?utf-8?B?M2l0UkJZTk9adDMvSXoxMHl5WlhUOURZQ3E5enlxQXJqclltTktYMWM5ZGlp?=
 =?utf-8?B?Ri9uNEFyREhrcEJlSWNHT1dsTzhqTE8weGw1bEZXLzJLa0hqMGVaTGJBdTZY?=
 =?utf-8?B?N25lTUZTdE0wNEZySXozRG1UMXZxbkRUUC9mOG9LZUs1UHdlSmZHWko4Vm11?=
 =?utf-8?B?ZUlLNVpYY0dFY0JhUVprV1VHdHVENEdzQ01nRjNHWlJUWm9WZ2h6ZXZPWVNF?=
 =?utf-8?B?TS92M29JelZ2RUNndkdFcG9tQUVUcyt3TzhGNWVWR3lQUEFtWVU1TStqQzlI?=
 =?utf-8?B?dW0yem9KVHp4WHpGZGllVHRrQlBuNlhyRzk4K2FFL0Z2ZEdCVUFOSU01YndB?=
 =?utf-8?B?Mlp6aTVQNXUxbmJGb0hTTWd2TGIxY3g2UThobkUrQ1hhbW1vYTFqNldEVG0w?=
 =?utf-8?B?aUpkNndWU2NrNjZZOG1QbkZGQm1YbHh0U2pPQnA1a3RicHVBZXFZRlk3Q0lo?=
 =?utf-8?B?aE1WR1VKN3hQSmxUSSsrejRlVnZhU0lzV1ZvYWNxUG4zaHk4bnVOQjlsSDRO?=
 =?utf-8?B?Z3V0cllYem4xdnhwNDljdEFuWEorYjRkdTlPWnR5Wm9DR2VPM3U0dnB2SWlR?=
 =?utf-8?B?YTdRUkRMa2RKVDNYMzI2V2hiVm4zMjR5U01nUjI2b3FGZXM1bmZUeVhBd3Fr?=
 =?utf-8?B?T2hUTU54ZTNaTXVqYTNXaTQ4dnRlSU5XTGkzN2NINWFFRHQ3K1BnZm90a3F4?=
 =?utf-8?B?RXFlSXNsNytIYzZCdmRlc213UEJUS0RjNWdROHBiZERNM1NXQS90VGtrRnlP?=
 =?utf-8?B?bVlBK2hoR0FDK2lTSC8wNjRrd1Q2dkozbWpQZ0tZcFVPMjk1c1pqMGxIU2Fh?=
 =?utf-8?B?Zm9OdDFPc3VSWS9lVTUyZ0IwMmlXaWxPR3llUHhkYXFhYWpFZ2FmMld5cHYx?=
 =?utf-8?B?Q1ZNcmJFMU1ERS9hK0lUekIzMkg5QWRrbFdyVGh0STFsaUV5eU5vcDV3aHFM?=
 =?utf-8?B?UmlxcjZmV2NKMnoxZytqQ0hLWXNmWDhqRDBTaktBM0V0dkZYdVliQm96TzZY?=
 =?utf-8?B?R3MrcG5uTEJxUi9HSzNqVW1seVRMVTRDYnNhZzg5UjQwcVp1MUhtQS82elRK?=
 =?utf-8?B?MFlpZDdXTEpQUHNXZ3VwQkl6S2dzS1IrQS9jUnNNQy9VQXFrL3hFU3h4R05J?=
 =?utf-8?B?T2VTZGpXUHkybEdBTjM5VXNGZGNKZmkrTGVGYlg4Z3BSNGJPY3R2NmhTU0hw?=
 =?utf-8?B?VDNqSkVGbllxNEhnbFNOMTNrTWdpVGJYWUlQV3kveXA3L3J0OGFrcnNVM2kx?=
 =?utf-8?B?OUxSUzdOTHdxSHNZMEZ5WE9mOENXYmR1a3VXSE5CaC9FMUpVdmh1UmRhZUxn?=
 =?utf-8?Q?f6FvS7anR0TRpc+xpWtCyX4Xk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb4bc2a-3ca2-4aef-7a98-08ddb7c9100c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 11:27:14.1462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPo5sfm3ZisZSPVSo9C4Undza6lbVIfNJMxJIKvxL/WF8VZ/9mQFqw2vaxBR9H8wzcZ3QxPcgDcdxCYed6ecMwMUIem/W+23IsUevyDQJk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF641CF4859
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0IHYyXSBtZWk6IGJ1czogZml4IGRldmljZSBs
ZWFrDQo+IA0KPiBPbiBNb24sIEp1biAzMCwgMjAyNSBhdCAxMDo1MjowOEFNICswMDAwLCBVc3lz
a2luLCBBbGV4YW5kZXIgd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0
IHYyXSBtZWk6IGJ1czogZml4IGRldmljZSBsZWFrDQo+ID4gPg0KPiA+ID4gT24gVHVlLCBKdW4g
MjQsIDIwMjUgYXQgMDI6MDU6MjBQTSArMDMwMCwgQWxleGFuZGVyIFVzeXNraW4gd3JvdGU6DQo+
ID4gPiA+IFRoZSBidXMgcmVzY2FuIGZ1bmN0aW9uIGNyZWF0ZXMgYnVzIGRldmljZXMgZm9yIGFs
bCBjbGllbnRzLg0KPiA+ID4gPiBUaGUgZml4dXAgcm91dGluZSBpcyBleGVjdXRlZCBvbiBhbGwg
ZGV2aWNlcywgdW5uZWVkZWQNCj4gPiA+ID4gZGV2aWNlcyBhcmUgcmVtb3ZlZCBhbmQgZnVsbHkg
aW5pdGlhbGl6ZWQgb25jZSBzZXQNCj4gPiA+ID4gaXNfYWRkZWQgZmxhZyB0byAxLg0KPiA+ID4N
Cj4gPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlIG1laSBidXMgaXMgc28gc3BlY2lhbCB0
aGF0IGl0IGhhcyB0byBoYXZlDQo+ID4gPiB0aGlzIHR5cGUgb2YgZmxhZywgd2hlbiBubyBvdGhl
ciBidXMgaGFzIHRoYXQgZm9yIGl0cyBkZXZpY2VzLiAgVGhlIGJ1cw0KPiA+ID4gY29kZSBzaG91
bGQga25vdyBpZiB0aGUgZGV2aWNlIGhhcyBiZWVuIHByb3Blcmx5IGFkZGVkIG9yIG5vdCwgaWYg
bm90LA0KPiA+ID4gdGhlbiBubyByZWxlYXNlIGZ1bmN0aW9uIGNhbiBiZSBjYWxsZWQgYW5kIHRo
ZSBzdHJ1Y3R1cmUgaXNuJ3QgZXZlbg0KPiA+ID4gdmlhYmxlIHRvIGJlIHVzZWQgb3IgdG91Y2hl
ZCBhdCBhbGwuDQo+ID4gPg0KPiA+ID4gU28gd2h5IGlzIHRoaXMgbmVlZGVkPw0KPiA+DQo+ID4g
SXQgc2VlbXMgdGhhdCBpc19hZGRlZCBjYW4gYmUgcmVwbGFjZWQgYnkgZGV2aWNlX2lzX3JlZ2lz
dGVyZWQoKS4NCj4gDQo+IEFnYWluLCB3aHkgZG8geW91IG5lZWQgdG8gdHJhY2sgdGhhdD8NCj4g
DQo+IEJ1dCB5ZXMsIHRoYXQgc2hvdWxkIHdvcmssIGFsdGhvdWdoIHVzaW5nIGl0IGlzIHVzdWFs
bHkgYSBzaWduIHRoYXQNCj4gc29tZXRoaW5nIGlzIGEgYml0IGJyb2tlbiBpbiB0aGUgZGVzaWdu
Lg0KPiANCg0KTWVpIGJ1cyB1c2VzIGRldmljZV9pbml0aWFsaXplKCkgYW5kIGRldmljZV9hZGQo
KSBwYWlyLg0KQWZ0ZXIgZGV2aWNlX2luaXRpYWxpemUoKSB0aGVyZSBhcmUgZGlmZmVyZW50IGhv
b2tzIGFuZCBmaWx0ZXJzIGNhbGxlZCwNCnRoYXQgbWF5IGxlYWQgdG8gZHJvcHBpbmcgdGhlIGRl
dmljZSBvciBhZGRpbmcgd2l0aCBkZXZpY2VfYWRkKCkuDQpUaHVzLCB3ZSBzaG91bGQgdHJhY2sg
aWYgZGV2aWNlX2FkZCgpIGlzIGNhbGxlZCB3aGVuIGRlc3Ryb3lpbmcgdGhlIGRldmljZS4NCk5v
dCBzdXJlIGlmIHRoaXMgY2FuIGJlIHJlLWFyY2hpdGVjdGVkIHRvIHVzZSBkZXZpY2VfcmVnaXN0
ZXIoKS4NCg0KPiB0aGFua3MNCj4gDQo+IGdyZWcgay1oDQoNCg0KLSAtIA0KVGhhbmtzLA0KU2Fz
aGENCg0KDQo=
