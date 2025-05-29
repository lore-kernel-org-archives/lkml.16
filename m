Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008F61DA5F;
	Thu, 29 May 2025 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748542090; cv=fail; b=uVjNg0J4sVpPMB0ujf3FPhIhiAmnfVl9JleqeT0lDgAoXs3mr0nGWcV44AXWojzYxO+1vWVnOEr/1JVx4N9GXMwGdrKBSitRQ6EruDbg7bRwaI5U3URWplKOXkwxU+vL1qZWAeWb/w/BOCW3Ep5kBCRE/buXCpNwaxp2lDMoo2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748542090; c=relaxed/simple;
	bh=mRTwMbENQ4Bz0llzWPdaJrdrgupga+KkEh5rYjQqK40=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mubMBPODUqrg3s3AFwS786Y0oYL3uAVuACanCWJN9C0CZCQJbmB7vxiEF+Skp1+/xyCkBEvIMRaBXR/9WxugADhDhJ2Kd2K/eJqgTU423m4vsPBZoMxU9Q6dZCM8lVvCDUs7dx8URYIKyIRoo/H39bj612a7DhuewZF9NYOlopA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lwV04mFl; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lwV04mFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYt3FnckuW1pvSX7PMHnDCMj5g7fLpQ8SqibZRjv/fyufds0lwm0OicB0CheygA6z82JK+ZzXWctDPO6GsSWWsdCfORlDQraPLxtg2OIWz9ifW3HkTBv+b3m0F6nCiY3WrxjbYveNnZDuZIZH1NmnPjmnoogCLRWjeS2+4XCJCd2rFusOxNWUzaUV00gkhzTFZ41+CbSfu0zDmRH1u94R3MVkS1xIy47rMkKeEln94ICGvisKlExQgblZM3W6hMz7476GsRZ+Hg7HwLI0Hl0ltRLoJyCExPEgaG8aksNY8e3BkvNnEe8+WyYp2O19IZGzDMcEWUHOy7YKuqqzM1bNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLdONmmCwN1nmYa8/j9DF9LAzrUBt2IH2vPZzv5gjj4=;
 b=w4WqYxTN8WEtIBtrVnLPCk8MgPysElhGtLEfXNYb3qG6MbZLl/D+3rJQ3LqRZBcufqNfgcSeOIpjXC3bYXMyUT4JH9Ve06IFh5dVG3QjySgHE/Uz6AmlRduAJx6MGr5M2h1YVj7yHJQUONbrQN/w9WujzLzgICrAifQ8YbM52QM5xUjUbOf8pOIWn5COtl098W3ZkqGTOlV8vZRwMq2/AYv7v69n9RMeFlOC8Fq0pShI9Q84rZKUn2Q7LXOzPrbLxpUPd7CzC/kIbPiZpk3KgAvkLv9i1SEboPnYQ7Ankq98vGG73JSC+js0gRGRAUifERz59PEtUT/vPpnaHNFefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLdONmmCwN1nmYa8/j9DF9LAzrUBt2IH2vPZzv5gjj4=;
 b=lwV04mFl4rajVtRiFlzAlaMQCQDS7i5Kup5X+YHASDd8r37IZM0LY9ppMB5Rg1+bzwDTbuGRGZYdZpogTXzBhcDyUabGqSjPKzY4H//k5Tua4mQvWptp/OyjEs6cGCLmKOQLjxseB2gzzqzmiwztWQeIeZx+IDNb1mfcIF/5ayE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Thu, 29 May 2025 18:08:05 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 18:08:04 +0000
Message-ID: <4aaa13f8-9b60-467e-9dd3-bf9fecf60458@amd.com>
Date: Thu, 29 May 2025 13:07:46 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 16/27] x86/resctrl: Pass entire struct rdtgroup rather
 than passing individual members
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
 <619c9cbb6b1525a2d4a46a042384e6771800d61c.1747349530.git.babu.moger@amd.com>
 <d4bf97a2-15ae-4093-bdf9-63c78d07eb4a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d4bf97a2-15ae-4093-bdf9-63c78d07eb4a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ROAP284CA0259.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:f1::20) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DM4PR12MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c95825c-41a0-4540-c4f0-08dd9edbc1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDF2ZWU2S001cllmR0hMdVlNclBXODBhTU85SGE0YmxCWStya0FPUFFiQnEv?=
 =?utf-8?B?ZlBGdGVPcXZOcEEweVcvbk5yakxneFNCS0lFOWxDNlRsMkFsK2tQWmJqaDRi?=
 =?utf-8?B?OW9qdVB5dUVLNVlhUDB1ZmpHREtockxDejlHYXUrMGxLVThpTnE1WVZ5U2Vh?=
 =?utf-8?B?bUd4VFQ4YWxPc2dtS2hJL2ZFNDZ0NUIwRzQ0cG5ITE9WUVVGbmc2dko3NVY0?=
 =?utf-8?B?WDBybFNjWXZ1RVdQOG1KcGhSR214U1dEd0tHZzVGeFQ3QnZTY01tei9vUURa?=
 =?utf-8?B?eGVRWmpFcjhFbk1IeXR5bjdpODFOOUdnc0prVU10UGV6MnlzTlY2RkhPdC9s?=
 =?utf-8?B?VVQwMUhHeHVvM1E0aHFkcktuWXgzWDNjbXlZSWZNNXhCbEs0RCtLeDZ4YnQx?=
 =?utf-8?B?T3hDZlVBUURJL1phWlZ2c25nakdiYWRpR3kzRW93Sm1DRkNUMEQwZHhqdmRH?=
 =?utf-8?B?QW5Tb2h5RTBzQlM5VEpGSWRoeTUrRkMxbUMySXBSbHJUVnBrNkVhTmJxOW9w?=
 =?utf-8?B?ZzlkZUhpWW4rbU1ORSszZ1BWcmxiZTU5SXhLR1JrbUhlU0owb092dXRQaHpU?=
 =?utf-8?B?MzZKc3NTV2ZIMUZIRGpzdytEaUVFUlZ1YVYxNlhzRlBqd0dKVjBYMTNLbkhy?=
 =?utf-8?B?ZHpnNWRNbHpNMC9zaXdEVVNYTE9IWXl6SDFXcytTMWJOV2lYM3luL3dzelIy?=
 =?utf-8?B?UmtKVS9yalVUdUtHSjhuZlUxVXM1dU1IcXVWa1JUTitnc3dSc3VOdGlGMmtK?=
 =?utf-8?B?ZVAxb1c2aG00WDllaU1mUHhhN2JlNTF4TVNYUktsU3JQc1ZlWVlpYjQyU2Rj?=
 =?utf-8?B?NkJ1Y1RlaDdtUTVZVnc0WmozUHJsVWg1RmpVdGpYaXlKdlB2UlExRnVPZG4v?=
 =?utf-8?B?VTBtTVRNYXhnM1BEWTdnTmxnMlB5WDhmVThkOFhRZHZWa01HZ0sraE1ram5a?=
 =?utf-8?B?akd5QzZxam9Kdnl6Mlh5dnkxYVBUbmtrejBIaEhVaWhqMkhtZmJDSVBWNHdZ?=
 =?utf-8?B?NWFDR2lyUWRwRVZ2WWhXM1RuQ0xhQ1JBNG02NFRXeVVzRmlpSHdiR0VZcFU1?=
 =?utf-8?B?bkVwY0RRekVxc0FLd1FRSVN3ditqOGVYQ2VtQStXdFVZS0NiZHEyYWpoU3ha?=
 =?utf-8?B?T0pZaFVZMnhySWdiTGNObnFHT3lkN0dCVDR5SkczT0NFd09sS1VOMlFTYk1C?=
 =?utf-8?B?VG00dEdneTR2NjdFa2RyT3p0bkVEMVFTMjlZcnhseEs0dE52UmZUcDNvUUxR?=
 =?utf-8?B?QlBPQmVWQXVRNW96YWRtT0E4Q0ZoVDczM1JUSzZiNU51REh5eUVHN1pBT2Rh?=
 =?utf-8?B?WXZwTmtJdkpkTkFZY1pBaGF0TnQwdnpFenZidzUzU3BtWVhpYUVnc1BoZ2lq?=
 =?utf-8?B?L0xWWjgwTUlQQm5LejhRSXlLSEc1WEN5T0tzUmZHRjc3bGhlaGlweExYaDRu?=
 =?utf-8?B?SzB6UkNacGE1ZUJsaXk5UXVsT2NQbnlXMFRPcVlieDl1U0NkQ1BEbW40ZVFx?=
 =?utf-8?B?SjVlSytPMTNkSUtyMjNIM2lBSHMyZjh3MGhra0xnQmFzZEhyVkNmY2JLeThK?=
 =?utf-8?B?bWt1OW5tS2c0VklURVAvU2o3YStYZHErZE1zaC9FRzZaYnJGWEVVamMrK2tU?=
 =?utf-8?B?S0tBNmgyV0N4SGRLcFdmT3JXWnFtSmc2Q2NGSStwcEdmdVVGeEVBdjNvTGRH?=
 =?utf-8?B?QWphUjB3NTFDajVQUlhHTHNSVmhoaUdqbURKbmtTYVh2TnFIbUh3QWhPbEVM?=
 =?utf-8?B?UHBoWTdCSzRVODB4VDh2bWZkM0dkVHd0MUVhZkVNaXNZQnpOTkVxck1lY01m?=
 =?utf-8?B?S1hVeWlZQTVBaWhyS1hDZXYzanZYdCtuRWxIVklDL3RRd0JvYmNIMXduZ0ho?=
 =?utf-8?B?czRXMWt0T3IwZzNqZnY4MEg0WEtDWTFWd1ZmM0h6S1M5WWhKcUdYWTcxSjBN?=
 =?utf-8?Q?Q6xHL6+DG3s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azF2WUpCeWtoV1RibUhCcG1xeEJLTkhoM3BzOGUraHJlWXExNU91MDVwR0hW?=
 =?utf-8?B?aVdOQnhBRnovSlNhcmExMUxYV2hobmxhRXptM2RDbnhRSUtaNllrYlhtMFlR?=
 =?utf-8?B?eW13VlNkeDM1ZXZ0T3R1REtWVEx2RG9YeStkRmZ6am5qUkZZZEVUUVhQU28z?=
 =?utf-8?B?YURCNE40U2RxaXlzYzdrNXpwcW4ySEE3N2pEZjJrQVRuZUxWbHg5dW83YzdT?=
 =?utf-8?B?eDlXZGxZT0lHSTdpQnJ3UE05TGN1M0xmUVM5L21rZ0t4dGtLTUJvOVEwZXRU?=
 =?utf-8?B?bU1ITlc4OVk2WURtenp1enEzRzZ0d2RXYTU2cnZNTXRiZWxmWTN2YWUxRU5J?=
 =?utf-8?B?WHhCYWFmRmZLTzhWRHRic2tpeDNXRHBsbVJmcDgwbTc4b2dOVzgxNDB3REJo?=
 =?utf-8?B?ZTBXajF0Nkh6SVJuQVkzdXhoNjlOY1BMWmtBTHB1Sys5VW9BMzR5b2R2UWJq?=
 =?utf-8?B?U2FIQzFDTytPVmVzSGNBS25INVRlTDY3OTl3RTZtUDlkM05WelVsSE1rRnFM?=
 =?utf-8?B?RGJvN2JOaE1nWjhFVWNCVDhEbzRvNWxhdDAvaWJuWHc5MWcrdmljb3phUEFo?=
 =?utf-8?B?YUVCVFFlT25FcS82TTdWc202ci9jYzZPZGR0WG85YWVJUXljYjJxZUtoUUpk?=
 =?utf-8?B?TEJFU2FnbVZDQjJVSHlIVmczaFNOMTEwaXY4ekZxREdYM0NMVFdhK2ZOb01h?=
 =?utf-8?B?MWpMT05IZHg5UE1OOWZBSzlRNmdyZWxhOW1tcnZ6Qm0yQVZtNm1IVG5VV1J5?=
 =?utf-8?B?bi9JTmZjbm9iZmVId1RmV2Uzd3k3cFI3WmdiTlJLd0VnQlVBZHh1QWxveEVD?=
 =?utf-8?B?Wm9TbnliRHI2MC9INC9PN0RJRGZkenpRQlU3Y1VDVngxUWY2b2xXUHQ2SWRP?=
 =?utf-8?B?N0QxUWFvdHlaTTJoMEpzV1Fac0ltN2YybWt2cVpPV0xqcmxlNW9EbkRua01G?=
 =?utf-8?B?NW1HVnN3ZDFoWTVvQ0lST3Y4M0pROTZYSVhFQktZK2xNTHRMUWlIdVN0S25J?=
 =?utf-8?B?TE9vWVZaTWw2eUVhVmFxWkdWOE14MHNOUDZLdWprdEU0QU1hdTJFNXozRFZC?=
 =?utf-8?B?L01ISVRPcTZ1OFlCWVBaVG8xdEhYM0ovem5vQmR2d2VVZEZQSWhjWU9Ba3Av?=
 =?utf-8?B?WFN0MjlnTUlGZzdkTmpEL2VwckZXb0ZkR3BscFYwWmhBWlppdktKbFczODNK?=
 =?utf-8?B?VEVoTGovN3NGcjFwdFpkWTdCZkMrbTVIS3NKREZNVkN6aWczL2U3dUp1a21G?=
 =?utf-8?B?WWN2V3pqTkErelBnUDZjK2tEY2dqRE0xR2Iva3dQNFN5OUFyS1FYZkV3ZjE1?=
 =?utf-8?B?SUxnYitIUUt0S0JWNm83am05ZkJIRElUSjRaeDZCTzNOVldobjR2NWtzalFt?=
 =?utf-8?B?c1VJYXQvd0ZHVDRIckRyTTMrTEtjWFJ2cHZWRWxrb2N1RUhkYURpRDhPMnZt?=
 =?utf-8?B?RUxQZXR3L2FGTmF3V211L2VEdCt3OXJzLzU5aXJlTi9VUGVQcTUzd053OFJn?=
 =?utf-8?B?dExBYWw1a2o0b2ZielkvaVdhVlhTKzVIL2ZDU3lEWG5UNldhcXpaSnlMNHVt?=
 =?utf-8?B?TTBjTElhYm8wWWsraTJGYyt6QndlUEErMS9OQktjR250dmk2RE5FWjhnM0dS?=
 =?utf-8?B?Y0VENURqWE0wczRrYUhQTWsvZFRLK01KdUwzSWx6STVYalYrRi82aVd0NnNQ?=
 =?utf-8?B?TkxDQlJjdFF5Z2lvZVZHVC8xZjlKYVZCcnBDMDBWaE1IaUdRNDVITmtTTlBm?=
 =?utf-8?B?ei9YV2llOFhaSllRTmJVWE9BVjB5M2lUODRNZi9paFU4ZHVBWkJnRGZ3VDJR?=
 =?utf-8?B?TG5XaEVmQlQzVXNPUEJtYzM3QTc0dFFCQktqdUJrRExxYWQ2VE5uNmMyaXBT?=
 =?utf-8?B?dkdSZnlRMzhNcjAzcWgxSmhSVG5ES0ExOUFtVE94RDVkNzJTUWRoak52eG5y?=
 =?utf-8?B?UkE5b0V1dFB4UU8yM253VFFBYmprWldTUkpXdTZJeHd0c0ZvbXZCRUxmY21H?=
 =?utf-8?B?WXNOY0hxV1cvOUdjTE8yMzFzK2xWVUx3eXFNcFhhVmttbEVpYVNZN1NWaTRj?=
 =?utf-8?B?MmtsNW9PT0xqdXRUalBGSGFHZmlVNFhBTnpjdmZHdHVlZTVGUGpzd0dSNjJT?=
 =?utf-8?Q?wxhQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c95825c-41a0-4540-c4f0-08dd9edbc1f2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 18:08:04.8898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aplY6TO2Cmxwfs3SKBkS9AL6T6vsvDEf0ER7dXZ33NpuNNHqKp5TbcTnub6D59eU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724

Hi Reinette,

On 5/22/25 18:05, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:52 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode requires a cntr_id to read event data. The
> 
> cntr_id -> "counter ID"
> 

Sure.

>> cntr_id is retrieved via mbm_cntr_get, which takes a struct rdtgroup as
> 
> cntr_id -> "counter ID"
>

Sure.


> mbm_cntr_get -> mbm_cntr_get()
> 

Sure.

>> a parameter.
>>
>> Passing the full rdtgroup also provides access to closid and rmid, both of
> 
> closid -> CLOSID
> rmid -> RMID
> 

Sure.
>> which are necessary to read monitoring events.
>>
>> Refactor the code to pass the entire struct rdtgroup instead of individual
> 
> "the entire" -> "a pointer to"
> 

Sure.

>> members in preparation for this requirement.
>>
>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> Patch looks good.-- 
Thanks
Babu Moger
