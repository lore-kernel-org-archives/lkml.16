Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88127AC3C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757998; cv=fail; b=AzSJf7jbxOcBZ93StE4CLP/65qzaK/z97AT3QHge6QMBI0sexYQ69TXnYBkGURE3PvyQbqoS3ncqanxUHjvSDG6rnZeIn2g78zvU0zTFEs33WM/BpBhY4kmDtpQpkGN4Y64AIUGIZgPup2t6ACzJoz0bGFmVoqjJqawpv8GipTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757998; c=relaxed/simple;
	bh=OaQ4BZfKgpLHwItUiQXeMJmqrEYpRgmQrU2FPowr1dQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=do+6NTkp2QVgc2v2Mjdomp+SADXOFLGbIixPQTwPw6xDZ1Y2MP1Q5S5eSFcKHpwDBJ61qYJPPFFNG2zSXEFo1pXM9Sr2I8FOfeSTRPod2jm2BNvQWk+XSHALqZq5Z7m6cSoZSWzn0xUFQbWq+vU2b8w1qSSfzYbyQH189shRjb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P59nx+MG; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P59nx+MG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750757998; x=1782293998;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OaQ4BZfKgpLHwItUiQXeMJmqrEYpRgmQrU2FPowr1dQ=;
  b=P59nx+MGqqo7NolwqXJl8cBKVQk5AEI7Dnf/jVN5YOkYGLIXrjz/MsXC
   g/Ju/+DoqzWMuCxkUB1hxkWF5JK3xoQNKyf7AQO7r4IkpnL5GAy7WZBbZ
   HL0K2EVxXrIAlqwR3Zl9NXL4SLL/J+6h9m6FPLaTjocgbrXrQQD9rhgkL
   pUWAFj9CG2ljJ5mimzJ6+J8xZJnqDGNk1yQCDotSKbhv+dCuAyhXYvBg7
   HNlg/mvyhfX2VE4CKSuyiErT0dLP7AkNBGezwyrE5tr2vE5CtQyO/4vLG
   9GvsjMxIX6aFNeINctp05c/CGN9Ov0elNsQyU4TluLo1/VkKY5OoPN1c7
   w==;
X-CSE-ConnectionGUID: SWO9WkVqQoWwRsoIwNws1Q==
X-CSE-MsgGUID: IBuRKWnFSLGr9womhUZtCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52858693"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52858693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:39:57 -0700
X-CSE-ConnectionGUID: VdYgEdC0QQykUNZDfOFDqA==
X-CSE-MsgGUID: wspppu/mSK+jq4sdc6N2Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="156254081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:39:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:39:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:39:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boypu84onUE8aiOBWftpvNzgF3txMK2JCBwwSLxaw+Dh5slJ7hbrXgSkn9TxGIBaaD0AWurZ50v5GfoztblLpI9ZKdYLMJf1/ZTLQ/UoAGWjKNeZ4SyO72PdJViLfsCfh+4D+Y2Hse+0KO2/XydFl7WWX4QgXupPquEUHwvXmqMPicKrKbsSjaX+voPQqk0UnVr5Q11dGNBGWWTWchDiMoGhEdRY13AkoZAavijaqXVr0dAUEFJ16Y8QiljmFjzbOnvr2XHCs/py0z58trCLsPCGUUyLkVR04PAN/kyLAJdxytsMmLd97rqy5YIQSvJUj/AIn6KrAtkzS8Y06mPwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaQ4BZfKgpLHwItUiQXeMJmqrEYpRgmQrU2FPowr1dQ=;
 b=e9D/TbiYg/V0AjgKA3ZocmXHH36gOOCnDDkKVBYZLriwtQLn57sqFoNP+gySjOXAv31/mafJ6MMJrNRQmUcsi+vGS6WANgvFTdX1r0PJe6h6BeTsVHNf8hS+fA2ikYz4/PQmXEnRWPaOJblNAAZbkSV3ifUXUERzQA0SziDl6rLMY8r9UIII2JmNx0olPs2d7SKavKWuFVnmAqNKT5Tex3pokFIh0hn4ySjVIEfogy6S1+7nBw4kWeEjO4HblqdTISjahwJxuXyRZloEXDHPwFP7rPJHM/xg7yBIyfOUvCe63JUgtbSM2pe3mJ+9pEDZ0qVlW42husD82aJN4S04Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 09:39:52 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 09:39:52 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next] mei: bus: fix device leak
Thread-Topic: [char-misc-next] mei: bus: fix device leak
Thread-Index: AQHb5NmfZpUMIMYoFUSjufyer1ZpNbQSBM8AgAAEquA=
Date: Tue, 24 Jun 2025 09:39:52 +0000
Message-ID: <CY5PR11MB63668002881229DE234FE345ED78A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250624071521.1281436-1-alexander.usyskin@intel.com>
 <2025062423-flavored-dwelling-070d@gregkh>
In-Reply-To: <2025062423-flavored-dwelling-070d@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MW3PR11MB4634:EE_
x-ms-office365-filtering-correlation-id: 6689f03c-031b-440a-16bc-08ddb30311d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S1ZvdHZkV0tBWU9mMGY1ZlRtQlRLOEc3TTMyaWFpMWpMSUp1ZXh0RU0zQzdm?=
 =?utf-8?B?aDVyUXBYVC9rcWNWUkFXeXZ2bUFEQ2cxR3RYczZaUFYxbnM3UngrSERLVVRE?=
 =?utf-8?B?QXp2MDZIdWFZQkVldVRCSVdtb0ViZFlJTFhHVGswcGpJRmNFMjJsbWVqSUcz?=
 =?utf-8?B?T1JyTWRRemo3aFl5OENUMHdIZmZ4OGdlNkpMZnZ4TE1XTGVnbXEzdHJuUlk0?=
 =?utf-8?B?SVVJTEFvNXNSc2dNYWhtY1pub0JxR2xmT3NUMUhJUmZJS0hXS3UzenF1R3cx?=
 =?utf-8?B?ZTUxY1FnZFo5SWpSSTZCeVdvM05VbUF2K2NraE9pcWZGR3g2OEJUSlVmWjZw?=
 =?utf-8?B?bUJoV09CdWZKYXFrQXI2aTZVa0NyNDFGblJxd2VDV1hHcmhIcmIwVUtWL09t?=
 =?utf-8?B?cW1IYXZaREtUdmwySkVaWm01VmpDbkhDRFpQcEVpdlNTQTdzQU5ZYVBsRE9H?=
 =?utf-8?B?VktPZ2MvMnhBaHZQMHNwMGtOQklyVTNPdHdlYkVqRWIxS202Wmt2d2tUdHRs?=
 =?utf-8?B?TkdKeFZKYXBGbklmU3FFQi85eEZDb0N2RnJpNEQ1dFIvN0ozOFFoUGU1TDFX?=
 =?utf-8?B?LzRmVXpaeWROQ3BqRkQ5VkJDL1ZCa3Y0cGVna1JMTkNydUlrNEdlYlBzREJU?=
 =?utf-8?B?eTA1dFB4aVRKNXg4alJtckQ3UlVLM3ZwbDZEa1gxQ2JiQ0FLRmlLbGZKWkkv?=
 =?utf-8?B?bGNteCtZd3J3U25FTUlkTmlVNUZRdTNyVlRkdWpYSjV2NndaQWhEeCt4dE5F?=
 =?utf-8?B?K2FBZWpLQkZoTUVTMjk5bS9RQUluVXo1RElJNU5IeEMxNGlZb3EwRjBqWTh1?=
 =?utf-8?B?V3NsV1pCQlR5QUZBOEhqcWxCRXV1Sm84aWorZnpzMitDYlc3cWtOekk4cHNq?=
 =?utf-8?B?dUlHVlJIL2JCd0g4S1NUVC96VW5jR1I3U2FtbVQzVUpaa294UStaREhsVUxj?=
 =?utf-8?B?ZHJITWp0VVRwVUJ5Y3E1R0dGWFNLMXBGeWpzWTcyYVE1Mm43eUUyUUdsMVZr?=
 =?utf-8?B?OW9GV2FJTmN2aDFQVWJ6S3dONkhhVXFzdUpSYXVSTVZHNTY4STFBdEpWSWRU?=
 =?utf-8?B?WmZTSW50NitpUUkxTFZMQUtWSzRQb3FOY1crcVZrVnZKVkZaUjBMYk1PeS8r?=
 =?utf-8?B?a0s2c0dRem1wZ1VzQmI1dUpBNVp4YWhYNmZHc0FscCszUXBvQ0d6T0EwN3U2?=
 =?utf-8?B?dHY4aWVXY2ZQckZZQmNUQnErRHM5eGVpcWt6Tlg3T3lZYXNTOGFoMitvbXB4?=
 =?utf-8?B?dWJibWdnM2QyQnVJZ1MxVy8vanR5aW0vSUhyVGM0MWptd0J6N3NKSHloeHhI?=
 =?utf-8?B?VWFPSUluWlhJK2RsLzlRUk8wTkRqalVISmNMdkRta2hGMm9tMVp0eWlQTHFn?=
 =?utf-8?B?bzlmSjdNMWQ2WG0rOWdBT2liYmpWODlrVXJIeE9uSGx6bUJVeUxvdGpoT0dV?=
 =?utf-8?B?dFB4ZzIrdDhxZmxJQVVNZ2gxQS8vOE00STFRMmVRYThBT05yb2dhaHpxMmE0?=
 =?utf-8?B?OGhmV0JwNSt6RWtnbjVuV0gwSENwT3c5emVlQ1lLeGRsRXNSOHdyS1NnazNX?=
 =?utf-8?B?ejhCMkIxTW5SYzFzYUVEUnpTS05mZ0xDcms4MmxQdjJ2WlhLb0N0V0R3ZjBu?=
 =?utf-8?B?NENGSmtOOWdJM3A4MU1xWCtyK3Zrd3UzMHRzVUNUSUdMaWJ6MTRyYWlhemIv?=
 =?utf-8?B?Wmt0eUtHL2Y5b2RkTEs2V2s3VDJXWUFwb3plRFdXSTBZd0l0MUwwdEhIWm40?=
 =?utf-8?B?UnQ4UGFpa3pWaWE5TTZEYTBHOTFWUm85TUtHNURpRzdLaUF6TVZVREZ1NDJL?=
 =?utf-8?B?bVV3V1ZMSHkrTmE2NCtXRmh0Y0xCNVp6blgyd1JSN080NC9ybU9yYzdEKzhv?=
 =?utf-8?B?bTNVN3F5VHI2UmtSRjQ1NFV3WGxIMnMwOFJJUjVpVEVzSGUyY3laMG1neVcy?=
 =?utf-8?B?ZzkreFk5ZWwzWk84WlNHckRFN1hFc2Zyc3dDRGJYSjl4RTdFTitLcDMxQ0Z4?=
 =?utf-8?Q?6/gWuAY0jXQCVYvqsuiXXzmldBXqhc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUcxdGtoOUVqeGNTSG83dEpCOU9WNktsWEdlYkMxd3cyMDVQQ3NvVHF6eEV1?=
 =?utf-8?B?NHFpTzJpa0lnVHBQekQ3MTBLN1hFMU1MTnVla0JYcmFSaURCWFpZcVFocmdJ?=
 =?utf-8?B?dnQ3d0h0dkZNN3NLcHhGQ3ZIc0JtcW54ZEpwUXByWnBtaXk4NG43S1JpTmJW?=
 =?utf-8?B?dm5lZXlTb3UyS3hOeTB5TmEyUjQzWHBVamJQR0djKzFGeTNFRDNUUW9xRSto?=
 =?utf-8?B?VXNybExyR1RTUE44Rk5vYUd4bFJ0YXB6ZXluMnRXQWJCZjJqR051YU1hM2hL?=
 =?utf-8?B?T29TaU1abFFlNTF6cmZDV0FoK0dhVFlodk9GcDhtbURQa3dIUXhnbVFMU0NE?=
 =?utf-8?B?WGxpenV1ZzNsbHlsazNIV2VOT280UFNtNytPTGZQUjFFTTdMcnlQS0xNYlN2?=
 =?utf-8?B?UEJFNUFSRXY1V1lCR2F6aWhPbkQ5UnEya1Y5RnhRWFNDWmZBMi92OTQ0UzZH?=
 =?utf-8?B?SC9FL3ROQ2pYZERNUUJmN2RPd1B3UWpVR1NJdCsyYURVclE5bDF5K2NxRFJn?=
 =?utf-8?B?dHQ2dDFVZHJvdTlSZVR4L1FQRVRnd2xaWFJDR1BhanhUNHg5bE5Sbk9rbDZQ?=
 =?utf-8?B?QnhHTHhXQ1BmMk1hdE1wR09GRGtlQVBXNDVVbVpMOFNnUVh1SGZQUVRreEJS?=
 =?utf-8?B?YjFRS0lZaVVCbW93dHJsYTA0d01WWjZMTTBWNWNvUmsxSGJMZFROcE5tMnpH?=
 =?utf-8?B?Rmo0V2hGWEQxajBjZGJiQXRNeGZNZDE2MXJnamx5MXFEbnRLZ0lWV1k2SlVs?=
 =?utf-8?B?d09DU1JFOVpQMnpvcWQ0dzA2SC9JSTAxSWNnVEY1RGhqRjgwTVRqTzFzMGd6?=
 =?utf-8?B?SEFvSEhJallKVUNuL3RpdHcvNk9QWDY4eGJreWhFc1dEYlhEK0M0VDlpT3NT?=
 =?utf-8?B?U1h5andRTmRscHBVYSt0ck1Ha05lZjBjQnN1ZEtPclRvUXFsVXIzR0tISWFa?=
 =?utf-8?B?V3NybWdwSlVEOEtldWdtdXRNMXJ1RVQwa2tiRGs0UzU4b1ArTm93UXRmOXky?=
 =?utf-8?B?MWZrTG93UVZmVkNVRk4rQmxldExHZytrZmdhZHdyTUNIUzFmWDFHbm83dkJV?=
 =?utf-8?B?ajhvdnFtT3dBVWhCNHpMdGZkS21pVWQ5VzkvM3pCY1hoSUlaVEFVT1JBd1JJ?=
 =?utf-8?B?dmpzc0JTeEdESHMzTGJVbXEreDN6TkVrMWhhQUVEYUxPL2QvajJVZUxDQkUy?=
 =?utf-8?B?aVZRNjR3Z2tLbmFUYXhEbWxTWEtPRHMyNjkvdDM3cmJEL2RXVVlCelU5MU5Z?=
 =?utf-8?B?NnVhVkRrN1NPbmFnRGlCbDFWU0o4YkVUd282L044L3cvdmE4UHMva0Fpb2hp?=
 =?utf-8?B?Vlp3Z0hQWWJnRW1jViszaUJKa2diQnZTK1lDZlppQU9PR2pZNXR4NFIxcXZF?=
 =?utf-8?B?Q1RvMlEyd2NKVGtWYkJMTnB5d2tDMkpPRlhzT051V05xRklocjIxSVBYYWJ4?=
 =?utf-8?B?Y1Y5a2g3UEl1dGhjVWNkM3dBSmZ5bU5NY0xWakpIemdsVklqTEJiTFAvMWdL?=
 =?utf-8?B?eHZqRUxJYmJLUUxRZko2aXJ0ZEZ4cTVrcEJBTGRncXRFOERLMlhzekF4cDE0?=
 =?utf-8?B?WUdWZE0xeWZzSFlKNGJqOC9XbzRveEtNc2Z6Sld3RU9MUFczVW1ENFp2d3dj?=
 =?utf-8?B?U3pBVzNiYXFNN0crV1NoTVY0ampReTk5YlJRN3VPcmxmbjg1d2FNNzN0M3o3?=
 =?utf-8?B?VlV1U1pCY0x6cUwyaVp4ejRTWi9kY2Exb05WdVppM3FXNVgxVnQ5cXFRcEtD?=
 =?utf-8?B?S0tUL2FRSkcvT0dBc0c5eHhPMlBoTU01UW9DbzJydmJvbWViTmg5K2hpLzVS?=
 =?utf-8?B?c0EyeUw1a3h1OUI3S3g5Q2VMb2xCandGQ1I2OFh2Q0ttZmRnTWtOUUpOUVVn?=
 =?utf-8?B?TXJWZGJmN2NnU082eXFKRkd4M3dKWFVtYmhjVzczN2VZTS9FSWpQMEdwSVZv?=
 =?utf-8?B?UVlMZnF4SnJGSndZVHBWN3ZpdDJLelZ4UmxGdWQyelk1NFJVcVhDbXRzWCtU?=
 =?utf-8?B?eG9PZ0JJSGZuNkptaDlpcUxYQ1o2NFBlWnZRamVOQWxGMmlMR2dJemZaWXFV?=
 =?utf-8?B?ckhCRWtqZVdMM29lejJvcXZwaUV1M1RERWZXckpOWGQ3Y054Y1diVnlXbVZx?=
 =?utf-8?Q?1wAvevGfmafmI+KFFq2xUi44R?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6689f03c-031b-440a-16bc-08ddb30311d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 09:39:52.1830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwc2mcWLHRfsCb4/9RqvOxq2pqaJl8YzCHfc19DIcpR75JtJPsG2ifp6Y1cIvYHP1iy6UfOODdlpXWbUi6Ema0jTQoTGRTShotDko9Iuupk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0XSBtZWk6IGJ1czogZml4IGRldmljZSBsZWFr
DQo+IA0KPiBPbiBUdWUsIEp1biAyNCwgMjAyNSBhdCAxMDoxNToyMUFNICswMzAwLCBBbGV4YW5k
ZXIgVXN5c2tpbiB3cm90ZToNCj4gPiBUaGUgYnVzIHJlc2NhbiBmdW5jdGlvbiBjcmVhdGVzIGJ1
cyBkZXZpY2VzIGZvciBhbGwgY2xpZW50cy4NCj4gPiBUaGUgZml4dXAgcm91dGluZSBpcyBleGVj
dXRlZCBvbiBhbGwgZGV2aWNlcywgdW5uZWVkZWQNCj4gPiBkZXZpY2VzIGFyZSByZW1vdmVkIGFu
ZCBmdWxseSBpbml0aWFsaXplZCBvbmNlIHNldA0KPiA+IGlzX2FkZGVkIGZsYWcgdG8gMS4NCj4g
Pg0KPiA+IElmIGxpbmsgdG8gZmlybXdhcmUgaXMgcmVzZXQgcmlnaHQgYWZ0ZXIgYWxsIGRldmlj
ZXMgYXJlDQo+ID4gaW5pdGlhbGl6ZWQsIGJ1dCBiZWZvcmUgZml4dXAgaXMgZXhlY3V0ZWQsIHRo
ZSByZXNjYW4gdHJpZXMNCj4gPiB0byByZW1vdmUgZGV2aWNlcy4NCj4gPiBUaGUgaXNfYWRkZWQg
ZmxhZyBpcyBub3Qgc2V0IGFuZCB0aGUgbWVpX2NsX2J1c19kZXZfZGVzdHJveQ0KPiA+IHJldHVy
bnMgcHJlbWF0dXJlbHkuDQo+ID4gQWxsb3cgdG8gY2xlYW4gdXAgZGV2aWNlIHdoZW4gaXNfYWRk
ZWQgZmxhZyBpcyB1bnNldCB0bw0KPiA+IGFjY291bnQgZm9yIGFib3ZlIHNjZW5hcmlvLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2lu
QGludGVsLmNvbT4NCj4gDQo+IFdoYXQgY29tbWl0IGlkIGRvZXMgdGhpcyBmaXg/DQo+IA0KPiB0
aGFua3MsDQo+IA0KPiBncmVnIGstaA0KDQpUaGlzIGlzIHRoZSBvbmUgdGhhdCBpbnRyb2R1Y2Vz
IHRoaXMgZnVuY3Rpb246DQpjb21taXQgNjAwOTU5NWE2NmU0ICgibWVpOiBidXM6IGxpbmsgY2xp
ZW50IGRldmljZXMgaW5zdGVhZCBvZiBob3N0IGNsaWVudHMiKQ0KDQpXaWxsIHNlbmQgdjIgd2l0
aCBGaXhlcyB0YWcuDQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCg0K
