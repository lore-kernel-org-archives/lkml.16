Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5862E3363
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466685; cv=fail; b=U4StgQW80j2hKOPvyWFT9RnUw7I3u7gA0GTsq3dZWdxPQNdUDy4Tan/B8cz/jtgHBZorTsky7CprhCNEVlmZrQilR1nmltojxl1F1YL/4vYOzmlOaeimQsHiaPKPN4CwL0tcvfhLcQghx09Q6OxCpJndQ6Pz1c3fWetHe3nFtMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466685; c=relaxed/simple;
	bh=zYgfoVavV2oK7dpHuTL0uLusssBotDW8zYmyaxN/1ys=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VyMQv1EDSjX6f1jpxEkY0RDuvHupPfoBEP6oxo90Jjal7lBK7VgQkz5eZnR6whvKdsTA/EjpTTYwwvLl112W509JV4AONv4S7nuc5oTZw5cyAE0vbbMFG1/VVabTzoufKFUrYfLuuE77NssI6XKqMnGLFnwBT8X8OO9tuydw0yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsE9qN4Q; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsE9qN4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743466684; x=1775002684;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zYgfoVavV2oK7dpHuTL0uLusssBotDW8zYmyaxN/1ys=;
  b=nsE9qN4Qw/Hpkx6Q/Eq2LQ/J2yx2seqyuVz5t0yCY66X5FWr/lM2olTt
   2M9RdjR2pdWE3s59sfWZrnCJNQTljKPOHDHDk8fI01VEs/kZoVIAHwl85
   dDyZ2Dag9Jaq+chr/jSH1aA1Kq+kKqWPpb0rRYSP94drHCpBjjBzkqyMl
   j+4iLW0MHREe87Dig6ES3CfwwKUNYJ2L8k6TbACsOupbt2D9unGyMuWd3
   mLIncn63hEN8ElYcRwJ0L4l3cng0E51RxfcLrvQIwuVDtT+f1usDRpA+c
   8YBhFJvLSse0u2n045GJ7jejU5MDXHAcMXMwBUNoDGuSXyPWUwWpUVKwO
   w==;
X-CSE-ConnectionGUID: m/y2jljVQdOjnnWx+QeBBQ==
X-CSE-MsgGUID: K+DNUJa6QQGCAEmRfNE+Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44903144"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="44903144"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:18:04 -0700
X-CSE-ConnectionGUID: JZB+CYuUQiuoKyNzBnYM5Q==
X-CSE-MsgGUID: WUbQ+c9nTzaAOOdI15ZKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="163461799"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:18:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 17:18:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 17:18:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 17:18:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRW8X6HVtlsm+/zLihSth7zJ+8jGq/ajJFYkD+1EAKGi976DdGhG0p/mGgluJs+VEl84WRCMshQSaLcqDMLkcupziCujDY7r+OVnor4/jRb18JUN5SMXlO4Wup++66UFZetedwaSfP2kVTptWqqP2u8kl7QpE3DQQaiodalNVnGMB9d+KM7maH/KYM2/oZhTBIPxoZ5KM4eAegnxhV5lkl3uO12f6ylY8sGZjnUyDOGMt9S7lTdctqK7x2Th0cBLBTASfSx0lCuyOL3T3LTVeza8lYjDU89/+SHJ8+yTg/TI2t9VkmYXk0j1PQNxoStyD3X9t+GgMO3JBzwNpXesLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYgfoVavV2oK7dpHuTL0uLusssBotDW8zYmyaxN/1ys=;
 b=eESU3Jt+lap0JfIo31e9W95vsxQ0NmxzVnuve5TmIv7tWgi/X3YDUDz+PosZ8rmUPD5Y/qFkMaWqxqIuIqPvy6URf4TgdOg5+fdVgB3Mj4UoNNrnF4bjecWdUEGu0q0YE9eHoBWm0E2zlniQn2IY+kaDHkr9RWg7G/EJ48fs5nWj6+0IEfB02JTl2Moer/PowRhXO150ycv95LC0/RYy7kJGEI0c22NrtPBPl0am7+UrMyfMhmlqpKyDtd142xT6iT4w0IWcAqc8An9y4MNawSKpCKXCfkDPix4RHoJfFWRGkjQoTJ6ATxKhRxMj1ml+Z0YeN/BO1pUQFrGpqM8GfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 00:17:55 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 00:17:55 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCH 5/9] x86/nmi: Fix comment in unknown NMI handling
Thread-Topic: [PATCH 5/9] x86/nmi: Fix comment in unknown NMI handling
Thread-Index: AQHbn3LbeS67F+LqYE2FHKWlel2AMLON+B4A
Date: Tue, 1 Apr 2025 00:17:55 +0000
Message-ID: <4e7937e946d94d5f62ff1a5f3b416f7d1eb2c71f.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-6-sohil.mehta@intel.com>
In-Reply-To: <20250327234629.3953536-6-sohil.mehta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|BN9PR11MB5228:EE_
x-ms-office365-filtering-correlation-id: 4fb03412-ab66-44f9-af0b-08dd70b2a64c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RThsQTVlYVdSb2RYUDZvTW9FUnJ4TkRPUURmVDU5V1c3Sk0xVVJvTzBxdmgw?=
 =?utf-8?B?MW1ENGxPWXRneDBSYXpIbENlUHBVMjRwQkpCdTE4enNQaEFMZ1JONFIzS0h3?=
 =?utf-8?B?S3dtR0hVK3A2K05RZXYrSVZKS01qUGF3UE54TVVrNXB6dnlTZU9odjVDN0Ny?=
 =?utf-8?B?b3pLdjM2a2hGeUR3NjNJQmhkMDIxVDZUaU1BdUlqTmZCcSs2MHJrNFRheDRN?=
 =?utf-8?B?QWZRSm9KeWVxWUU1dFA1ck9tNFFuTklWTXJGZytQQllRSE5ETldQNjhnUzdl?=
 =?utf-8?B?eUY2MkVaL0NDM1RWYWRRZTBsQjB1MmlHaWRDSE5zcEZya3VxNllWR2FUMytm?=
 =?utf-8?B?bUJnSkVmclNNQUtNaFoxZkViREQ4UE9hdHFkT3BxRTQxMC81MjNlanhicGF0?=
 =?utf-8?B?QmV2ejc0U3BWSzhIL0JaellLMVN1NzMyeGs5dVpnMTZTdEhaMDJWeGo2NVpr?=
 =?utf-8?B?NEViM0MweDRiK3Q5VFVzWFhQSDBzTjZnYnJ5TE84VEtWMW5Uei9QQjgwdTVy?=
 =?utf-8?B?c0lJMnpBWDR2UVRENmlBKzJONjB6SnpzbmZvV2xqc044VFI5azc2c3lXUk5H?=
 =?utf-8?B?SzVMR0JaaFhlS3dKWHVtZm95U3h6WGNvZ25PRldjODQvTkE4bW05a0NrT05i?=
 =?utf-8?B?R0d6NjVDMDR4QWVkUElLbjU3dGswOXhaZUljcHFVZ0dkOStVQkJ6ZER4b29O?=
 =?utf-8?B?U1F6YTIxejRnWElBTm8vUG0xdmlSeGFUQ3p3V0RLUXZZREFZU0NCbmgyUGdL?=
 =?utf-8?B?VjJFREhheWlWNEtVMnJpWEt4V1NQendmRGh6MFdRK0xDZFoxSG5nSjZlUnpU?=
 =?utf-8?B?cEdPM1RjK3NXQXhvaVF3eDFuNUJSVW1UTHlyRU1QTHorK01ReDRsQzBiOTVN?=
 =?utf-8?B?cmwwL3c4YVZmU0NBT0pNTWhVditaSElqcGRUVFpzRHNab0dLTDNHOURzNHM0?=
 =?utf-8?B?bUhvVUFkbmRjTmE4UFNUZ0lONmFaU09oWERBY1JsVUttcTdzSHBEdkMzNkFM?=
 =?utf-8?B?Q0JERWdSTWl0TVhNRFFxdGV2NEVOU1FvWmVaUUNRZFJaN1Jwb2xNSUZ2OFZF?=
 =?utf-8?B?OWtUQUFhSFVOaVRPR1ZEN0c5R0VBdURLRXRiTzUwYmJjZEEyM3BObXY2blp2?=
 =?utf-8?B?SzQwMGdBWEYzL2I4Vkk4L2dPZ1JydnlpeFFCckhKWXFYREdZZEx1RDhYamoy?=
 =?utf-8?B?bUMrNlRUa2hXVzQySFRMcUNTa0xLUVpnR0pyaUlaNUlHWjFuOGhBa283R1FY?=
 =?utf-8?B?bXUxcDVrbFkvYnlTOEdXOGt0NDlHVHJxUUx6dzE4ajR3V2daM3hIRlFwWVp3?=
 =?utf-8?B?THF3N2YyZnV5SGt5dlZIMko0aUdZUTBFL3REZEI0bDAvV0I5bUNwdndSV3pp?=
 =?utf-8?B?Y0IzWDdqTDBLanhTejI1SWZzVm1VazdKZUUwMzdUOFdZYkVXcFpRRCtFSFZy?=
 =?utf-8?B?SlZWTUdoMk5lcEF1SHdGMHdvVWpNU2xDMUZSQmE1b0RTN0praWtmZWE1OFNW?=
 =?utf-8?B?VzVTeUV0bE1QSm12ZE9KaGREWjhFYzc0K2dPa0swRGJneVpMemQ3UHN3UnlL?=
 =?utf-8?B?cGNwR1VtMTJxdVVwZkdHaFZHMnJmWlVmN0NlaDJ1Zkp2UndEK1JPZE1PRWs5?=
 =?utf-8?B?aDJPSXloQnUyOVFvQ3FwTVV6R1lqckx6U3d5a3IvRVlJQmNLb3JSdlBSUk51?=
 =?utf-8?B?Z1k0TlAwenNGRHVmRitwV3VOcU5zNEE2VGtTSnVmeDRwemtiZDdDU1NyWEl0?=
 =?utf-8?B?eFBaUXBkMFlOMW4rams2VFduYUZhMUJ6andaSjc5Yk9DVjBRSUR4d2YxR2c5?=
 =?utf-8?B?Q1c1RXhvdTZ5TTQ1L0NIUTNUVnM2UGFyZkZLeFcxRENVZFN4RDY5aWxnQXNp?=
 =?utf-8?B?cG4ycWRwSTNmVVZOSE1ZdlBqUWJEbEd4d1YzU2xPcHJhL21vTUFKWkxBQVNO?=
 =?utf-8?B?NDZBanJUQnlFMGZCRUlvZGhBODE4eUxyZ25Sa295Nk5idUExbThJNFRnQnFo?=
 =?utf-8?B?dlVIU3RnRzJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE9BOGJibzdhK29UL2NSR05UN0RMN3hSNG5oR3NXamx3ZTNNUjhYOENGR0Zj?=
 =?utf-8?B?NWVvR1BYVzhiTmJ2b1F4L0VLd2c5TzE4cDNJZ2ZCc1JDUDh4QzFzNjhRZjJ5?=
 =?utf-8?B?UXBubCtQVTVJSFgrQlZSMWxudmF0Z0ducGw0dVg3ZzBhWU1TdTIzNm9XMHVs?=
 =?utf-8?B?TkgyMjZUNGtDMWhGc0t0MnRhOGVtSVU1ZlJMY3VXUkp6bVRaOGtVa05VRkZt?=
 =?utf-8?B?dTNEU1E5MU5idHhnNkhmMm1hL2Y5ZUhuMkh2blF2VU12bzk4czV5WUFob2JD?=
 =?utf-8?B?MW5udCszdCtEbkNhQUoxVVU3RmJiUEViZ2ZBQUJVTG1aZlFJRFIydW1NTG9Y?=
 =?utf-8?B?RGt3bXA4NWpYU2ZoOGFMY3dYS2xlYWhaTXh1MHR2Rm03OEhCZ2xEMkhlMlJU?=
 =?utf-8?B?Y2g2czFvMW1pOGl4M25aWk50MUhCYXI0YlNCWURBdXdSLzcwdFp4K0JTMjVh?=
 =?utf-8?B?SEZBbjZuZDVIYTd3UU9odHYrdkhoVjhpZ2ZVaHBiZ2w4cWNmU0FaY3EzdVpy?=
 =?utf-8?B?TG5CMFMwblVMQzJVbXoyZDdBM1NXSVVQZ3BpWnRPVERtZkxjWUFxajUxby9W?=
 =?utf-8?B?amxKY1NiYzJXT0Myd0xjalRkblFSOHRPeXA3U0ZIS1o3Sy9oNVFrWWZWWXRp?=
 =?utf-8?B?YWsraWVLQXBuZkVwRDNLdjRJRmhlV2E0RmhWbnRmUDJOM05pVHJQcXc5Wi95?=
 =?utf-8?B?emFpZmdEVDVNdkZBWG1lTVdwZW9USi8vWGFJN2d6S0lLeUNIeUpBdktMdWwx?=
 =?utf-8?B?eEQwVC9wejBwN0VqVHJFM3pWREtMNWkzTlpyMCtTdmZxZDRQRjF4M2FMNHRI?=
 =?utf-8?B?Z2hlbHJKWDBMR2dJd2RkRzVEZEFJUUxnRXZqa0F5YjRtcWtXYVY2OFZaYUpW?=
 =?utf-8?B?WG9LSzBMVURCQncxK01XdVBUTXJ2cXh0TVVGWG5JN0QzUzVMNkM3NlYvZ2xl?=
 =?utf-8?B?a2UwMFE0Yk1kWDJHQXZSbmZCbWRKVW9RS3JTRld4dmpLMm5DK0Fwc21HbHA3?=
 =?utf-8?B?QUJzT2RYblJRcWh2WWhLM1pIamZKTGJaYTZNUUc0MlBkQStjaHlyd3dQbVFN?=
 =?utf-8?B?cXZQTk9IRyt4cUlVTlYxelpyaElyeFpmd2djOEpBaG84OS9UWWZ3Rmx5U0Nm?=
 =?utf-8?B?R1FLbkpyQXFJZzlGVys3WWJaR2Zmd2pJSkJRTW1ZR3M3T0h1SmpVeisyN055?=
 =?utf-8?B?d1lUbm9PR29PeElUWDJEQTRQb2ZXVVZwNHM3cHVtK2F3REQ1SjhZWDArSTJv?=
 =?utf-8?B?bWZXR3FlaW15bEpSMnM3ZjV6ckF0b1hhdWlrKy92MFVWNXBvZllDNTJzWWs1?=
 =?utf-8?B?UzFYOXRrTTdXS3lSdWRCR2xpZy9BbW16cEt5R1pET3BDcWlBQldFajF4TnBi?=
 =?utf-8?B?dytVdjQya3VVck1vUldUM2JzOE0zL2ozeVVUVXNsZ3ZyMzltZFVwb04vMFc0?=
 =?utf-8?B?S3ljbGRxRWRXdlZPR1NlTWFjV0hYaHhzWktoTWh4dDNqSmhCVlE0N0w4OHhi?=
 =?utf-8?B?Ujh5Q1laMlVTcUh5bTFzc1BiT25mdVVweGJjK2hveWxVclpXSnJQalVsM3Jk?=
 =?utf-8?B?OVdHUXZXYUtaWEJzanYyMzJBTCtya0JyK3Blb1M1UVV5YkYycld1akk3bTJn?=
 =?utf-8?B?VE94Qzk4N01MaGJyV3VLVzRQUFhITVBWZWxVVS9aMlRXUVBvMG9VZHJNSTds?=
 =?utf-8?B?bEN3aGpGbWIzb0x0UkFFeDBUWG5RQTV0dmtGLy9GUXJJb0NOZ0VwTDZMa3lH?=
 =?utf-8?B?QnhDU1hQemNXRnNvS0tEZ0JnV3FldkxJTTRzaUt5cDBwWHBjNnNmY29IUFRq?=
 =?utf-8?B?RW1YYVhwcVZCVzE2YWF4YmE2RUFBUmtnc0c5RTJYOUJsamVmaTJ4QXVtN0s1?=
 =?utf-8?B?czY1cG1nMFBtS3FOM081Y21DNlF0NldvZUJSQUZBMGtjODlsQlBHTlNPeW1l?=
 =?utf-8?B?a1JVRTBIMmRPZmoxb1FpQmV3aHlyY3B2SldybTU5eVpMTzBlT0xyUy9sZUo2?=
 =?utf-8?B?MlpORXcyS2dQSThyd3FZTnIyTm5DcEx2QVg5N2ZDOVhJaEx2dGJKTFVCTTVH?=
 =?utf-8?B?WHROdURrNEd2aVVhaVVOT1pJMWhpcERaR3J1M2lVV1dWOHo4bmZTcXZkaDgr?=
 =?utf-8?Q?BHWPqmR0+dTw/e1K2Saw4rUnL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50104027D7CEFD4F9E57FF7F4749FD53@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb03412-ab66-44f9-af0b-08dd70b2a64c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 00:17:55.2680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SAD7SkMAJ4lOHatzwp+HDzvcS0PPlL9xuOau4q7zHVRjfcfuOlKw55Yi/xIamDRMOCpIC6iNOJo0vQ5DlhhyNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDIzOjQ2ICswMDAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IFRoZSBjb21tZW50IGluIHVua25vd24gTk1JIGhhbmRsaW5nIGlzIGluY29ycmVjdCBhbmQgbWlz
bGVhZGluZy4gVGhlcmUNCj4gaXMgbm8gbG9uZ2VyIGEgcmVzdHJpY3Rpb24gb24gaGF2aW5nIGEg
c2luZ2xlIFVua25vd24gTk1JIGhhbmRsZXIuIEFsc28sDQo+IG5taV9oYW5kbGUoKSBkb2VzIG5v
dCB1c2UgdGhlICdiMmInIHBhcmFtZXRlciBhbnltb3JlLg0KPiANCj4gVGhlIGNoYW5nZXMgdGhh
dCBtYWRlIHRoZSBjb21tZW50IG91dGRhdGVkIGFyZToNCj4gDQo+IGNvbW1pdCAwZDQ0M2I3MGNj
OTIgKCJ4ODYvcGxhdGZvcm06IFJlbW92ZSB3YXJuaW5nIG1lc3NhZ2UgZm9yIGR1cGxpY2F0ZQ0K
PiBOTUkgaGFuZGxlcnMiKQ0KPiANCj4gY29tbWl0IGJmOWYyZWUyOGQ0NyAoIng4Ni9ubWk6IFJl
bW92ZSB0aGUgJ2IyYicgcGFyYW1ldGVyIGZyb20NCj4gbm1pX2hhbmRsZSgpIikNCg0KQWZ0ZXIg
c29tZSBkaWdnaW5nLCBJSVVDLCB0aGUgJ2IyYicgcGFyYW1ldGVyIG9mIHRoZSBubWlfaGFuZGxl
KCkgd2FzIGFjdHVhbGx5DQpuZXZlciB1c2VkIHdoZW4gaXQgd2FzIG9yaWdpbmFsbHkgYWRkZWQg
aW4gdGhlIA0KDQogIGNvbW1pdCBiMjI3ZTIzMzk5ZGMgKCJ4ODYsIG5taTogQWRkIGluIGxvZ2lj
IHRvIGhhbmRsZSBtdWx0aXBsZSBldmVudHMgYW5kDQp1bmtub3duIE5NSXMiKQ0KDQouLiwgc28g
SUlVQyB0aGUgY29tbWVudCB3YXMgd3Jvbmcgd2hlbiBpdCB3YXMgZmlyc3RseSBhZGRlZC4gwqAN
Cg0KVGhlIGFib3ZlIGNvbW1pdCB0byByZW1vdmUgdGhlICdiMmInIHNlZW1zIGp1c3QgYSBmaXh1
cCBwYXRjaCBidXQgaXQgZGlkbid0IGZpeA0KdGhlIGNvbW1lbnQuDQoNCk5vdCBzdXJlIHdoZXRo
ZXIgaXQgaXMgd29ydGggdG8gbWVudGlvbiBpbiB0aGUgY2hhbmdlbG9nLg0KDQo+IA0KPiBSZW1v
dmUgdGhlIG9sZCBjb21tZW50IGFuZCB1cGRhdGUgaXQgdG8gcmVmbGVjdCB0aGUgY3VycmVudCBp
bnRlbnRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTb2hpbCBNZWh0YSA8c29oaWwubWVodGFA
aW50ZWwuY29tPg0KPiANCg0KQW55d2F5Og0KDQpSZXZpZXdlZC1ieTogS2FpIEh1YW5nIDxrYWku
aHVhbmdAaW50ZWwuY29tPg0K
