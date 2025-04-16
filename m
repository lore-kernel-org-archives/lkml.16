Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F92135C5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822583; cv=fail; b=LnSKT63Pk6vmGR2YOAEphV3ZHTldt9xJ6s5yfXkD9DIHHjqVl/OBi1ph19nJmr/eY87NNKi4Smm6hBoJw3IayS033jdEhk3XYtejOjLtel/kKxi9C2rqouXQRK+MDmxTOGHHCF/ki9tfRF6EG83PCzgGwmZNzqThDNttUBDL8X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822583; c=relaxed/simple;
	bh=d84Pre/9a9bpxT8DK032hAm1BaUC7OSDnLhWx3pqguI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VH/+Na2RGPo7wRHTCbb4olOVtndokIGoFSsFFB9Z+4pm8az+5LF4oR/Tg7uN6KSzHnc0JWjR1JBhYDqK0AuDJUSePWHLoDXA8pxWLDAenG/1zcJIqp+0t88Sqec5bTMstLZomzBZl3GHgPvhDTBDzaPBhFoXrW8UEJ3L4MQaDoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPYt2SwD; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPYt2SwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744822582; x=1776358582;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d84Pre/9a9bpxT8DK032hAm1BaUC7OSDnLhWx3pqguI=;
  b=lPYt2SwDk1q+e2AgM07vMmjLKgRFe93xZujwHKVWMfrFS43hPIFVkAlk
   9/SsbgXbVkrgXNS8RYfxJ9Zs5wi9yOu2XBjOXK3wGSBeWhxN5INqX54FL
   D3FK/FxNUjt4+l5levTJ9fq3mqycYelSb4V/T6S06Id5HCFJDQCYTO8iv
   oyUVl9pZzY/VhXjVsg6CMqWyot+S6TfF403/K4fRctANVPbdj4nawXu3d
   tZeyjRdvBocqS1hFTM2cSW4LlTiTixHWMi3+zLuMD2JdLWMEW890lYf9n
   C1KsRH8zBkUwFnN/Kf58Z3Z/AiXYP6dEULqUq6vlKf9ZzHG9ZXMFsZfsD
   A==;
X-CSE-ConnectionGUID: RXMiA0PMQLupZrjxuSZsxg==
X-CSE-MsgGUID: 2W3PliRZRb+OFDUXOxvzZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46468798"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46468798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:56:21 -0700
X-CSE-ConnectionGUID: 6hCk+1E0QHqUnHoGn0bdlw==
X-CSE-MsgGUID: EnAFSH3ARoW+QeM1ugTJKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135528121"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:56:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 09:56:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 09:56:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 09:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkWbuCAe82/1cqxXy90YxUeW3UuOI7594ePgLiggpelnqsFqRB2mnv6ZC7xybWzCKCUHfEXwSTN/5Nvb5svM4tezB7QVsCAU7T2losfNntYRIj4lmpAq4kowYcteixNUmTKXueSoW4aHKvop0/GvTXrIPLoRJZyfdDUyfBV5A3Xa8zXtwFHhmJ1SHuF0fDaY642k4M3iPztS+y1K0PjV0ZHrscZS9jLfQWHRGlG5lLWQdiXhj7aw9dZIkXm27bif3DdUQJqr0iTY6k5qZUFIlqifXo+Avw038/DwOSUabOB4/IyiF/MawvASgX+SWU0r8EV79io/Xov3dQTsZKkX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzEhp3u8xgns4iUh2otNgekuaRV7WBig1nJ6pMuvvkg=;
 b=ywbcSlyOzStrMoUm69hx521b7tImCBXx+eMtUj2j2k3CrYd4jQIt5oGypgBXr6ZJyJ7ytaiY1pfg1WCw9/z6ozl8dorlAI/Nwt9aMrhcj463oB93HIFvuciOmPz2C0IIzsDNC2fX/Sh9PzH54hlyshb7HzQOIDtIQkfY3byIGCjGBIJZ9eW5NtPaXhgwLQsuTdN5I/WZfICxaP3uoLetb3Tsx1C7HHP3Pf+mn5bQqPz0pFszgjDBvNv28qbIINGqW4npMcAdDg0C9PcmI4HLrrVghNYcqgywTn20e44w0bABaqILF/t5hzYxJbqqJ7TYjX7IMSjNUwGOkyRpXHLQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3322.namprd11.prod.outlook.com (2603:10b6:5:55::19) by
 BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 16:56:16 +0000
Received: from DM6PR11MB3322.namprd11.prod.outlook.com
 ([fe80::fca4:6188:1cda:9c1e]) by DM6PR11MB3322.namprd11.prod.outlook.com
 ([fe80::fca4:6188:1cda:9c1e%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 16:56:16 +0000
Message-ID: <d67648a0-925c-433a-a33d-1cdba02cacef@intel.com>
Date: Wed, 16 Apr 2025 09:56:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] x86/fpu: Log XSAVE disablement consistently
To: "Chang S. Bae" <chang.seok.bae@intel.com>, <mingo@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
 <20250416021720.12305-7-chang.seok.bae@intel.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250416021720.12305-7-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To DM6PR11MB3322.namprd11.prod.outlook.com
 (2603:10b6:5:55::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3322:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: 94372279-a6a2-4331-ba4c-08dd7d079a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1M3M2dIYkNFalowdmxLZWthMTJLaFZlamIzR0hNOGlUTmtPWGxuQ0VQOG1i?=
 =?utf-8?B?TkJ5UnBCY0ZrK0VNZnRGTllnbHpXclowck9sU1dRNnlIajZueGNCbHFSeHVR?=
 =?utf-8?B?TXpJTWZJZk5hTjdNM0k3ejV1NzhEQk9iR0JHZXYwUzBGNWJZMkI1Qyt4NmJh?=
 =?utf-8?B?WU5jWGdRT3pKRXBiaVRicDUrbWxBRVhBMWowWkVqK2RUM2pPa2FvdHlVZ2cw?=
 =?utf-8?B?NWh4MVZ5UmRTZ3ZhYmN1ZHNpd0hkNWVVdDhVMzZWYlFSWm85c0Y4R29KdnRC?=
 =?utf-8?B?RGtvU3NVdkdiTWYrVHIyVVhLM3VFcVdUb3U1SFo1YWlvQ2NKRmRKakVwaWwx?=
 =?utf-8?B?ZlcvOS9JUVV2bUZYUzR5MTJyeCtHazI3R0pxRGYyZ1RqY0hUeGZObFBCbVdX?=
 =?utf-8?B?WHRZbkNjSFJrQ3JodnRiRzg0UVVnVnlWVHoxTVA2eTZ1aVpNektTSTRyYWRj?=
 =?utf-8?B?aHppUkJucUE5Z016czdVQjI1bzV0NjRhOVJWSHZkM3E5ZlFaTVdFdkVSWWtx?=
 =?utf-8?B?emxpNWQvSmFzTEJoMk9YS0lQMVRQUVlIVUZJeVI3a3NpdDBaTzN3QUNYcGdP?=
 =?utf-8?B?dUdRVlhIbkJmaEpMaXRKcFFkZ29EcmVXckprUlBCOUd0NEdJWFZuUU1PcHR5?=
 =?utf-8?B?TzRUZmF6YXVnNkRPQjgzYjZZajJPdUNQbmd0eC93aUp6bWFiaDZ5Z3Zwc0tK?=
 =?utf-8?B?KzR6Wkp1TWNvK0pwRUdiOW55bEQzM2VpSHdRa1krS1lnMG54NXlxUWFTR2tS?=
 =?utf-8?B?V1EwRm9KK0dFSTFrN2tuRjd3a01zNloyeDZuQi9xa2ZhRDFSM2ZoV0ZwcGZt?=
 =?utf-8?B?QThyRkxmWml0SGgrMVFmYnVNb285elRCeUVBbm1lVUdtWFpoUEpQSzdjRDRv?=
 =?utf-8?B?OXozL09aeWMxQlhnK25jQ3UrYnI0TEt4ckNvRmhOK2FOSWNOQTczZFV6VmMy?=
 =?utf-8?B?aUZuYlA2RlZqVjUvU0FqTnZiS3JKMzNQUFRhVlJEbnlJSk5za1lPNVZwalVo?=
 =?utf-8?B?RUZqbzZ0S1BzMy9jVWRRNjhuTjRrVVdsMDM0SFhYMXVNTy9Icm9OWUJ0LzVR?=
 =?utf-8?B?NFhNZTJ0V0F2ZTJFblUvSWczMm13WW5mZUpvYVNFOGxtTU9HMEgvRlIySW9y?=
 =?utf-8?B?bit4N0I4N3daY2lzUW1hN2hUU3Zpa1F1MGxpWklaWll6aFA5T2tUNGV3K3NL?=
 =?utf-8?B?ZzVucmdtb3RoMXRhbi9KanM1QjYwT3FRVkJNMGZpc293L24rckNQTjJWU3lr?=
 =?utf-8?B?Qk4vOUs1ajBraWo4RFMrT01WdU5iR1FGTmEyNVdzalVLMiswWVNweFFtMkl6?=
 =?utf-8?B?eExHRWZ0RTdmVWI2Ni9zdUxzRTRXL3lHOUh4Tnp2QzhHckRoVllSamxUbnRp?=
 =?utf-8?B?ck0xclExakhlQm1YMGZMcklQUjJiY0V3TGJ0MUtlSnovdTYrM05ZV05uY2E3?=
 =?utf-8?B?OVVGVnpPdWdxZWxSK21weENVSWVQWmZKVFpnMzJuWWxJblIzNktwQWMzWnE0?=
 =?utf-8?B?RTFHemxoMndTS1E3S1R4cjl1RmlEM0c2QzEzVzJlTE9SMW50Z2ZieHNybG0v?=
 =?utf-8?B?Nk9JZ0RFeGlEdWIzcUhHdmQzLzgxRXU4UnBIOFNNUU1MenJuL25GY2VwZUs1?=
 =?utf-8?B?UzgvbXdIOVRvU3plalRDZGxYN3hpN1VmL0JuM1pBMG1nV1o4aGxVV0h1N0VL?=
 =?utf-8?B?NExYb3RMVW9Wc0NtQVFJVzJSdThITFBqc1EramZyTkR3VDREZmhHMFRWZzRs?=
 =?utf-8?B?eUR6djQ3eXlnTmN0Ni9ERDBsQmJ2OStZS3NhZFBua1hkb09hb0doeG80ZVNW?=
 =?utf-8?B?ajZHV0xkOU53eUtiNkFPS2drZzZjSFpnZ0ppZ1JvcEV3NFVHTXAvS3lRRzNE?=
 =?utf-8?B?RXc4L05FZXFVemlFQkZ5dlJIckJHYUVjNmhGNGRYaWxmSmxTaEd0U2l1R0x0?=
 =?utf-8?Q?AIsbshwqwn8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3322.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGo2THJaQXEwK3NXdCt4SDZHb1N1bHEzQTZqUXVncVFFbmJxaFJvdk55NzFz?=
 =?utf-8?B?VGlNcGd3bjU0SW1OZHRpa1V4dXFUbyt5MGJGaTlpODNGSWw5NWVoTmQ5RThD?=
 =?utf-8?B?UjhyMGNseWhQZXQ0SCtBUHlpZzYyWjdza0FpQkxFaVBxekd5KzRCMEF1aVFL?=
 =?utf-8?B?TE9UQ2V4cHI2VWgxdTh1ZE1hVVpSUkRBamtSeTNoTXNHNGhCZkFOeEk4K2I3?=
 =?utf-8?B?ZUp5RHZuVlBMeWpJZFVNODFldHl0Y3I1TlF3cGEwaEV2Ym5zR2lRVEFycXZw?=
 =?utf-8?B?N2VncVgzUkk0UVd3Y1VwZWpqSUtMMmd5QUpBYUg5TWR5ZnBXelNiSlhkT0lN?=
 =?utf-8?B?bTdZWG5QemhzbGFkVm9uWXoybTk4S1lzOURIMlI1MmZ4bEV2Z3BzMkUxSis2?=
 =?utf-8?B?bTBKNTdFYWNvU1luZEhtNnhvV0RIRkFTWXp3eEh3cXpSTHpTeGs5ODFla3pr?=
 =?utf-8?B?VnFWTlo2UkdsTlJ5V1FnNlErZnNBK2d2eXhKRlNMTStnRlo1WjdreGxyREt5?=
 =?utf-8?B?dURETUlFL1RCcUFRN3NTckNBQUJDMDI1Y3FOM3hwVkhzcHA3NG9rMFVkT3Z2?=
 =?utf-8?B?NlJ0aFBia2lmbm9NOFc3NEFKRUExWFJxTDNvT3lYaXJuL1pGUDg2U0dCUUhY?=
 =?utf-8?B?SCtjdDI0bUEvQ3J1RlJ5KzljZVhaK3lXSkpEelRaWTNDMHRMdC9DenBrRFpV?=
 =?utf-8?B?Q0RwSUZMWHJkTWRvV3g5SG5XVTJMaG0ydE1Mb1VTZGNEOXJOZ0JEamJQOXBT?=
 =?utf-8?B?cFdpSnVtQ0FkVDdDZUFRaTFsR1BHVzZSRThudkpXSk45K25LaWIrb0wxVzRS?=
 =?utf-8?B?c3VDUis1cjRKd09XOHJrZ0RyaDkxc3dmV0cyWEl1Z1I2cWJ4ZnhZbmtLZ0ZD?=
 =?utf-8?B?RUtGR1FaNUZHN1RtcDdtem82aFJZQU1CemdWVm9JZDd4VWFmb0lMUXBZc2ds?=
 =?utf-8?B?aThidHRILys4T2lxZWVrdGRjU1lqNmxTN0dtOS9mM0xDUldlWkEvQkdrL1Rw?=
 =?utf-8?B?Y2Q5ZjdIekpsNTZUUVc1ZDdQSHQ5ODdkSkpqZ0EyTVdMVkhuSmdvYWxNZjVG?=
 =?utf-8?B?eGsrc1dkMGdJamx6dGdac0o1NGtYWmQ4VCtQeDRqV2RoMkR5bnBrcHR2Zk5C?=
 =?utf-8?B?K2JGZk1XYkx4T3JqWnRJRjIvQ1J1dTBZRHMrNk5lYVNQSmxkVG5HZmRwM3dw?=
 =?utf-8?B?ZStZb0NYeVZHR3dna1BKbnhDTlJKNU5VbDdBaXZZOEU3enplQVc3QVJ0dnkx?=
 =?utf-8?B?djNERXdtd2JxVWppSXRzeXpYSGFCVTNNYTVXVENrNEF3ZkE2QUltV2tsQWNP?=
 =?utf-8?B?dXkxSzA1Q09kd255WlJaMXloZVVrUTJPeS9xOUtzQnljU0FtMG9EWnRZeUxI?=
 =?utf-8?B?elZpbGZSWFdVTUJlaWhQaUFmNlNPS3FHVG0yK2o4cy8zdzJFWTNUOXFBSjNt?=
 =?utf-8?B?SGx1UVpOcWV0UlhjQlI3OVZJKzQ0RVFQT1NYazNEVEo4ekptOFd0Sk1jcElj?=
 =?utf-8?B?SXZLZ3BIdmxFWmxFNFFDUXFOMWxrd1pPdUxINTh2ci8zazJPaENtaGozN28r?=
 =?utf-8?B?YVJzY3hwVmJaSzZCSDN2L3BDTFA1TXJpNG9KZFJ6MFJGa3lQZW5kQUV1YlIx?=
 =?utf-8?B?MXAzTXgwQ0ZQZEJScHFWWlNVTjRFZklZaGZGVFlqNThtMWxSbTkwY0hOQ2RF?=
 =?utf-8?B?S3lEQW94NnMvdWwyOXdmN012c2R2bGQ1bldPVzFFRFoxSjcxTUdpUUg2aExh?=
 =?utf-8?B?Si80R09MQkF1VUVoaTc4WUU1cC9lVjlyNHJyN1lOMldJN28wM01FTlBEMDBy?=
 =?utf-8?B?SG84UmpJdzRrdiszM2EyQXNJWHZacGYzZVFwMlQ5NXJnalp1djBPaE1NdnlD?=
 =?utf-8?B?aUx4YlNhLy9TdHBnMTJzRzIwNFdOTmE2ckRuelllQWwyZktyeTA5bWVRMmx5?=
 =?utf-8?B?T3VDRkhTd2YwNWxxckNFV0tEVTFrYW85a3dqN0ZnL0JGYnNtaGY0ai9RV09T?=
 =?utf-8?B?bU9kUW5jUGpwdnVTTk1PQXJIQUpFc094bjZMYWhUTzFlSmV0Tnh1Nk1kQXpK?=
 =?utf-8?B?OXlKc01kWVA4eGFMbDFRWkFDcDJPbXh2aXNUSUxHVWFIZDVFWU04RTBMa3Fr?=
 =?utf-8?Q?ohASoX3UPHsW4ezCwnKpZvHo5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94372279-a6a2-4331-ba4c-08dd7d079a35
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3322.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:56:16.4527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gq6FCHu/u3nl4Yy/Hbk3Hv8Q72Ghcqy222GQWQk36fHFQWIflv7X7Fd7P9B3kmijmrkqeCetUtTgzRu0LPLHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
X-OriginatorOrg: intel.com

On 4/15/2025 7:16 PM, Chang S. Bae wrote:
> Not all paths that lead to fpu__init_disable_system_xstate() currently
> emit a message indicating that XSAVE has been disabled. Move the print
> statement into the function to ensure the message in all cases.
> 
> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/lkml/d6d19e39-2749-4d45-aeab-a209a0ecba17@intel.com
> ---
> New patch for following up patch 3.
> ---
>  arch/x86/kernel/fpu/xstate.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> index 2ac1fc182273..8b14c9d3a1df 100644
> --- a/arch/x86/kernel/fpu/xstate.c
> +++ b/arch/x86/kernel/fpu/xstate.c
> @@ -751,6 +751,8 @@ static int __init init_xstate_size(void)
>   */
>  static void __init fpu__init_disable_system_xstate(unsigned int legacy_size)
>  {
> +	pr_info("x86/fpu: XSAVE disabled\n");
> +

There is a mix of pr_info(), pr_warn() and pr_err() to log these related
messages. Would it be useful to make the log level consistent in this
patch or a follow-up?

I think new the "XSAVE disabled" print should be a pr_warn() at least.

>  	fpu_kernel_cfg.max_features = 0;
>  	cr4_clear_bits(X86_CR4_OSXSAVE);
>  	setup_clear_cpu_cap(X86_FEATURE_XSAVE);
> @@ -821,7 +823,7 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
>  		 * This is a problematic CPU configuration where two
>  		 * conflicting state components are both enumerated.
>  		 */
> -		pr_err("x86/fpu: Both APX/MPX present in the CPU's xstate features: 0x%llx, disabling XSAVE.\n",
> +		pr_err("x86/fpu: Both APX/MPX present in the CPU's xstate features: 0x%llx.\n",
>  		       fpu_kernel_cfg.max_features);
>  		goto out_disable;
>  	}
> @@ -900,7 +902,7 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
>  	init_fpstate.xfeatures		= fpu_kernel_cfg.default_features;
>  
>  	if (init_fpstate.size > sizeof(init_fpstate.regs)) {
> -		pr_warn("x86/fpu: init_fpstate buffer too small (%zu < %d), disabling XSAVE\n",
> +		pr_warn("x86/fpu: init_fpstate buffer too small (%zu < %d)\n",
>  			sizeof(init_fpstate.regs), init_fpstate.size);
>  		goto out_disable;
>  	}
> @@ -912,7 +914,7 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
>  	 * xfeatures mask.
>  	 */
>  	if (xfeatures != fpu_kernel_cfg.max_features) {
> -		pr_err("x86/fpu: xfeatures modified from 0x%016llx to 0x%016llx during init, disabling XSAVE\n",
> +		pr_err("x86/fpu: xfeatures modified from 0x%016llx to 0x%016llx during init\n",
>  		       xfeatures, fpu_kernel_cfg.max_features);
>  		goto out_disable;
>  	}

