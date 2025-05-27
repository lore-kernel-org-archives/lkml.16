Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AAD1E261F;
	Tue, 27 May 2025 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371773; cv=fail; b=WasHIPq84G7cCmn5V9TD0nD7qdIXlZRrJNeXy03hNdr+sbqKeLyF4UZ0+NYtQLpxPWPX4lVTud3GaHz1cdYj29R6beME7xBjmwBu7deqMOytXAsDNlEHydqaxpc0WET8TRyBleguWqFWHS5WpLR6e+dtV2dm5ZWhS9Rizf+mb78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371773; c=relaxed/simple;
	bh=hZioJNEIWv4gaIKutN6sMIjCAZv9tr/GPiOWNIoP5Jw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bz1/EqHGFbK3G8HZPSB9xHVnseOuebRMeB02xA5eKFajs0dPZ6LpvX75BAjuFdjs1iUsmatJgdKwJxa/n2mygFE/ECmdoMsi1X9kCsqOgy7MQroqBpeYDhV79iPzNWA4YbBzbnDE7CvZWEO4qElT2UhJQH6CGAwZurF5NhsQ84Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uEKZDEWd; arc=fail smtp.client-ip=40.107.237.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uEKZDEWd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZpVX0xVz7Gg9VYM57pfX9/KCzipSUEaImS640wDThKNSrVFS+Jqh/64h09whhpM0whmh9zT/arfmm2s13Goim/qRHFYHh0QUdXdJhqXr3ZxCRYCsC3zzNJBywbKbXFIEB9ZjSUPUMxyHDChHbIxE4C1eDItL1ttTHGnxAPCPJaY3HOFDr1ZVV2N4wF2vi+FveNhP5OyxicqCWmUAXwpmMtS3wE11vXRUaEWy/wITt1NlYvDDIy5UgCABCS9mv+obgqfYjIQKWzFTOGVpXrXpbhBSp/rHyRIVTfyYSZ1d9+IZt5GToGVK23MQ72LdbfE3dYRVdTdosmeVEdoHMzUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQykjRDVmmHgIQHTHXiADNIzGzdBIJv455dDmDpTv3s=;
 b=QnasP6MyhOKUxrkOOZPBA5hupZpMN99d/TFBcBuVZp5UVFscXPDv5090HwXD3D0mcbiMPijBzQhK2deZUJHBGeuPWgKnL7CWmr0dvvtrczUcAxkttne/wk3NwYTip2NSIvnZdSggKyICAs3KX4jOL1YbjH1BB8IbsVakFk5ef8jLZ/jao+5jc+wrZVGF7JSAa73ZZCFWSxO+ZLuV6v//e/4FXErfVH63oyqrnqH3kZ1qUvfsvmLEcikqUvad6KQmn5HEdwuVY2Z1/soAPjgxNuMx2FK/8g48YThbeD/sEB9csKe9S3q01f6pOrxZkAInBgX1eoB/gJxQ7WkEORl2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQykjRDVmmHgIQHTHXiADNIzGzdBIJv455dDmDpTv3s=;
 b=uEKZDEWd/n7ejLkAejq89+5V4Uen2U2TrELzKzt45x172Pb1IMLH9cf7852Iq1m3+zo7l5PWAuxbyY/WGe/fE+fT8IDbPkfCeYKvht1s19RtdbNa9GvX5xT03XEvE4NQnkZYCnoTEwVy8Twj4/N68cvgvtBGeRTuDSeAS1xLHdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 18:49:27 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 18:49:27 +0000
Message-ID: <589d089e-7d47-4986-96e1-434f12d0a899@amd.com>
Date: Tue, 27 May 2025 13:49:08 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 03/27] x86/resctrl: Consolidate monitoring related
 data from rdt_resource
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <cb8425c73f57280b0b4f22e089b2912eede42f7a.1747349530.git.babu.moger@amd.com>
 <1fc88c6f-65e6-46fd-b1b0-1efbdb6c5b05@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <1fc88c6f-65e6-46fd-b1b0-1efbdb6c5b05@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CP3P284CA0073.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6e::18) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc03400-e4c3-46bd-0876-08dd9d4f34e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODU2Z1NESGtHZUtreVpNTFBGZ2NMUENFRVoySjF4TUlSNFhXVEFvRFNBOXBp?=
 =?utf-8?B?d01nQ3BoWkdjNnd1b0FIa21RcnRmNi9XUy9kZkFpM3NrQXZaM1RhV0dMQ1dV?=
 =?utf-8?B?T1lFNitjL3FobUI1NzZHR3dXQlBMaTI2Nyt6SzRBeXhtdlpoMXhxSE9wOXgr?=
 =?utf-8?B?cEVCcjY0amQycTNlY0NwU1dqdFZXVHcrNmgzdjdNaVFEWnZGTWRlMTdnR3Rk?=
 =?utf-8?B?enJ5U1RNekthWjBBeGJKUTQ3Mk5IUzRUMldqREg4ZnIxTXBkN0xKVXliUW8r?=
 =?utf-8?B?LzVpWkRiNmJzeGMrVEdJKzdUdlNFeHIyWUdSTUNiczBkcHFFSGVFQXFGWGYy?=
 =?utf-8?B?cUFqL0lOc3BIakxodjFuN2RpVndQUENBbkFYa0hUcDZmblI1MU5qa0hCWWw0?=
 =?utf-8?B?UTVaWGtONVp3ckJRUUNHUjZJUkRQQTJiKzFwQWZsRjFsL0ZYWFFPSmo2VTRQ?=
 =?utf-8?B?ZVVIRnc2Y251c0lTQy9uNm0vYUppUnZ6MTlYL2g5ZXNZZXJ6aWo4SmYzOThN?=
 =?utf-8?B?WlA1dWc0NGdMYTFwZTA0U2RPQWl2Ymd2SlNpSm45Y3hOY2ppMjBOQ2NOTWN1?=
 =?utf-8?B?YXpDdXZ2S0ZpNGZPWW1IMDZBVUhuaDBqZ0hzL3Z5akxTZmxUeTlySVMxT2lL?=
 =?utf-8?B?ZmUrdHhPdDJTV25Nb3A0S1EvclNJQzZobExxZUJ5Qy91OThQd3BOKzFCZkZp?=
 =?utf-8?B?ZS8wRExxVUtwKzdWSEtQemREMzVNTnlXUjNYbnMvcDVLTzN5TGpGaXpuSE9a?=
 =?utf-8?B?bExNK2FGL3RqY3hBYUpKdVJJWTZ6QmpLZVlzd2VlUGVHcDRaWUc2REYyQVZX?=
 =?utf-8?B?b2xib0lzZEcvZFZHUGpkYzNwVEpZTHptbHRIYVlNenlQL2FJOStSQnNQS1Ji?=
 =?utf-8?B?cUUvaTlmMTBRcUQwOWl1YjVVNXdhdk55QndndFR1Z21SZXlpUmpRUnJhYmFs?=
 =?utf-8?B?MVYxcVZRZ1piWk9XTno5d0w3TlE3cTZUMmZkVUgrdVgrN3JUV3VaZ1Q2a2dq?=
 =?utf-8?B?WXVFbTNSaFY2RGc5S2lBb1p2UmlnTGk4Qnpjb2ZTSVhQTzlvVG5PRHJSMWc1?=
 =?utf-8?B?T2ZXalJuOUpQR2VPdXY4d1VkRVl6SXkzc0hFakVaTmlhb1hwQWlMNjRlRVMy?=
 =?utf-8?B?S3FydzhTcmE0ZDJBRnJqWUdtc3hGMUNVUGNYV3dJZmx2RTROU2ZjcFdsdnRS?=
 =?utf-8?B?Yk9EOGhuMERWOTJ0RGlyU013WmlYQW9McmFWdmFqb05MVzR2TDBLSXp5OU11?=
 =?utf-8?B?bEh2ZTMyS3NjZXlIYkREVWRscGZXbU5jOFYwTHRvaC82dThVOE9lU1doOHMz?=
 =?utf-8?B?Mi90ZUhyNW1xMVVialdDMm4raSt4Vm5XdGVoNVFQYk5zbWFsWkVtTHV6MGhU?=
 =?utf-8?B?M0U3K3ArR0greEtnNTlLUWpjZ0g2L0FlOU84WmRFRExTdDVYaTR1c3Z6R0pL?=
 =?utf-8?B?RVhMTGVhTjFtUEJXb2NjWUcrVGhKYkJacEtWQ0g0MWEzSkJITi9ieFBjR2RM?=
 =?utf-8?B?aEF3UTZQcWEwazJxUFdrUlpta0pFSVJNSnZXVEZsaUJvUVpNSTRQOVpvMks3?=
 =?utf-8?B?WVFRQzdKMEpDaExWWEVqbGdQK3VNWW1xUStMOHA5MnJkUjl2SkU2bkFyMXMy?=
 =?utf-8?B?NzNlVTNGWkRUT2FoUUVCcDRtcWh6MGlZNVpKLzBjL2VKa1ZDWjlZN1RIMHpi?=
 =?utf-8?B?bEZtamFIRGp5TU1ObzRWOUhxbG5qRUpYUWwydWl3MzlqZlRNZVNhVWUrY3A1?=
 =?utf-8?B?T0dmTDJYYW5QMXg5bkdBVXU0U1I1ZHdEMkpyc29KKzRvVDI5bkhPZk1rYTNB?=
 =?utf-8?B?RDBhNVkyN3hyZnRmckJNSllKOXh2S2RnV3FINzhQcGNLemNpVEhScFZNQTR3?=
 =?utf-8?B?UG1HNTlXbkJIbnEvNXVtTkRaY2hDVlc1RFNqakFZWlhDekNmZVdjZ1FsNU9E?=
 =?utf-8?Q?q4c2nZz5jsM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2huLzhVajY0eHQ4c1lpYit0UVI2WW9CS1VLMkVwUHJTQVdJK3Q2OEhoVEpB?=
 =?utf-8?B?K0Y3TFhwbGhnN29DemRiRlNqT3FZVXVpTHZjRFJtL3FEZGsxZDNxK0I1elhz?=
 =?utf-8?B?aks3dTZueTVnUjdQVG5EV3JJVG1qRnlQZ2NiMUJHRjcvK05SZ2V1OXlBeDNI?=
 =?utf-8?B?bXZKbWRMYm1ER1QrdjZ4YVoyMWM1eHZhU2YyemJ0WUV6NWRNRngzdWJCWDIy?=
 =?utf-8?B?TzVGM3grdVB5TVUybXg2TXhURFp6Nk42VnpxZldCSFJNY1pMdFdBYnlaQnZD?=
 =?utf-8?B?U3pzY3ViTUdZRmRSRVFhNGNsM2hSQzJoZzhPMXRZTlVxcFNmcTBTb0d4bW1o?=
 =?utf-8?B?UFprb2dYdVZRaXNFQTMzT0NBUFhXcXBoUTVYWGM3U1NOQlVReFZlYmd1MzYr?=
 =?utf-8?B?U0FPbldDNUpQUU1GVTdreEtlZGlIbUh3VThZazAwRzgrd2hNbzkzQUVYTWtG?=
 =?utf-8?B?ZG0xaG1hbGlCcGtnRVFOcWlUVmM2UitjQWhvRWhLbTRiSis1bnRLS3JqVUc5?=
 =?utf-8?B?OVg0RzlqT0dGVEo0SS9rcTQ0N1NGUWJDZW8xY0xqQVVqQ0l3SFd4czdMZWxZ?=
 =?utf-8?B?bkdLazgwaDhMTHIzTTAxSDhzcjlDbU1EUCtXVEhNQzROTTY0QTBDZU5odnJk?=
 =?utf-8?B?OFZUU0Y3RnRqb0lGMjBadjJzS0F3a29sd1Q4U2dhdktnbVk5VWl2U2p2SzJY?=
 =?utf-8?B?VmhnQ0xKL2dpTlc2WnowNWJMejgxVGl4dEJMQWFYRzdvTFI5SzVhMjBENzF2?=
 =?utf-8?B?dXM5cU9tSTcwQzRsNzRtSXVuQ2ZsZkhIbVFNWHM2SlhYR2t0Y2pHZEIvN1Ft?=
 =?utf-8?B?cS81OGZmMVZsa3RhaHRDaDU3bDlhSnVRUVViVThJcTgrS2RSOWloZTV3WWZt?=
 =?utf-8?B?cUNUNGVZR3hMcms5YlVQMUFQRE5ocW00YWJGVEJOSjY5VEplczNnWHd2T1pj?=
 =?utf-8?B?bnBjRzhIUUlRbFo5Znp4bE13YklTVEQyRk9teFpHRHo0OTNzT01sVGY2Nmxr?=
 =?utf-8?B?U3pHS2o2aSthSXBORDE2S0VDZE9FcGxtWE01OHlBdnNSYW1OS0NaL09JODZx?=
 =?utf-8?B?M0NLYkVyWmJ3VXNBSFdKRzBJNWFhT0JPUzM3WFN6MnlGRjY5Y1JxQWxtNEJu?=
 =?utf-8?B?TVdCRFUzZUE3Rm9mdHdRT2dENVR1UVdiR1AzeEExK1huRDNNdmJLblFrUFRp?=
 =?utf-8?B?UVk3blBMSW56eHUyVHdNZStLa1gyNUJyTEZ5SFc4RzBjWFAvQzdWdGgrcjU1?=
 =?utf-8?B?dzBjdU5OaG8zOW1QUUQrR056dHdoeEFZVUhYSmI2ak5XbXVoNzdVYzZxSW1a?=
 =?utf-8?B?YzFEK2lPVWtKc1k0dWVlVWpKMm1zWjM4WDZnNTRjTUlaSm1sYjlOcFloSmFx?=
 =?utf-8?B?dGtMZFRuUUVWNVdQWVJzekk4dWFyL3ZQdDlwZDVLc0lDZnZiclFHSTFSd01M?=
 =?utf-8?B?QUE4d3lRTTZoOWpzVXBITzZwVzdobi9NVFlJQm1FazYxREd3UDZCVkVqendx?=
 =?utf-8?B?OGRYdTZ3dGpQNUFtcU9XaDkrMG54OFBkL2EvNG1PT2NJR3M5c1ZoenFlcDJQ?=
 =?utf-8?B?K0dveXVacUxhaStzOG1zTWdOZVFCYmFCYStxSTByU0hTOVJhU3hLcTBHSHh1?=
 =?utf-8?B?Ymo3NjIwSXJKKzhPMmN4RFZSdEd2QVhXRFVMNG9ad1ppTHZSdWp1OXphNllq?=
 =?utf-8?B?Z0ZPbGxZZEdZZlA0aWlYUUppalJXa0xiWmRodnJjL202SjltOERXWWRXVEFE?=
 =?utf-8?B?QnVsRVpxdkFpbUhxZ1NGd3NVb2lYYUNtLzZVbVJRUTdxdE9pVFZhU2pIWnBr?=
 =?utf-8?B?T0ZTVVlWWXFrVk1OYktaVCt6cDRFUzg4L2Y2OEdRTFhkTTBtZEcxb3dmM0NL?=
 =?utf-8?B?QWtYaEVDbFpNYW1wZXpzSDQ3alN4ajhHWFJNeHFKQzMyTi96RXhFTE5OdFRQ?=
 =?utf-8?B?K0hxVXVJd09vWUdjNjBWa2ZCSzJQb0hoWFVtc0Mxdm5uUVlPNkVnZnZLVEl1?=
 =?utf-8?B?Z1pXeXp3bFRFTUhNbnpYeVR0cW5BdldERGgzRFhMaDFyK2xCZ1ZPSG5xWWFm?=
 =?utf-8?B?a0VScHNDSWU5MUNjYzh4NFBXQlE0cllTNGkxTnhRbDU2RWZGWkphZVdrVHE4?=
 =?utf-8?Q?hXEg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc03400-e4c3-46bd-0876-08dd9d4f34e6
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 18:49:27.5365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVAEp5LVxoiTb8ACb3CdZCwvrE/qG4hjdXj31uRnwlyxmQ69B9y5AJEQi7v+L5hR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252

Hi Reinette,

On 5/22/25 15:52, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
> 
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 9ba771f2ddea..2a8fa454d3e6 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -255,40 +255,48 @@ enum resctrl_schema_fmt {
>>  	RESCTRL_SCHEMA_RANGE,
>>  };
>>  
>> +/**
>> + * struct resctrl_mon - Monitoring related data of a resctrl resource
>> + * @num_rmid:		Number of RMIDs available
>> + * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
>> + *			monitoring events can be configured.
>> + * @evt_list:		List of monitoring events
>> + */
> 
> Nit: this new comment portion can start with a clean slate by all sentences
> having good structure by starting with upper case and ending with period.

Sure. Will do.
-- 
Thanks
Babu Moger
