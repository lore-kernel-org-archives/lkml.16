Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F102FC006;
	Wed, 25 Jun 2025 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890694; cv=fail; b=cS4Sd6GxHU/jvx3sdkZa486LD37M1a+TRWngkrSUbO6SA1xDJmF1l2DNcChaWT/PlQbsrEDhKlt5eJkg9TrBS8ZdDzq9UupL4h1J5ySXAwcgFkpQ7g2GXjvF6nxcvgYeAPl3NGytaE3pz4w5UJxHSMir7QYQCZ0n9hruA0c1a8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890694; c=relaxed/simple;
	bh=7/dRRtutS9Y+NN8uyGB06cVjAHejf8CUjC9J9+Vrj7A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e7bq47d5ONosxDU0LW0sIGhmB+825+NHPxtxi48qQevFqPcKquP53rph5rJ7yzBSV9YUgNQpzJqo6NeNOLaF3MWQmHU2rK+4bTp1ZnlbxybX7WQe/lNNlTNiCxhssweX+RhQjg9x+EP3GE8UiwPR/9P90BUXML8FjuxiZ0ytjbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iFD4P0Sl; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iFD4P0Sl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAAyDujSn+ySYji24oiEBjLtTNrE7h6d2V07VcSxiSuDiEP4ElpI9FSc79BxvFo7Lf50EQRgv88jKmTFK0SFFHbQwxt1CUVahuTrNN1fZ1DheLMygmXa2JsKEBNQf9MhlkE1WO4/da9Qw39gtyAhjPwm3V2lexpyUPjMq3aEe8E2OvO2O3LzFqu70qQj9h2IF1LHbG5hiHyxKmi9mgMEd2zy4ojDfthHCPPGoyoQOxIzdwFx/3lXN/Dfu94H83reRPsIIHcmo5CtoeVZn6NDH0X1K5GcTHLecKnjdqBDvIrMvow+9z9MHkoIyyYySk73/WCSl0khcP4XBvRnXaSddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdnup+NDc5xQPUolzW7o9TKibjEBXyF1uGWqZVk89l0=;
 b=YKsnGjiZD8ZROYrnQUEKPhNJMheBAV4ZGSu+pm6kWvL31c8Khr6uLWIMw//TAUX6bS7XYUbu0ymKxaO0a5imCVZhYVIpVJ/WzcD84F2zyXdds1+si58UqYLJcdKTBUcuE96YyREEeC6fnXU5db9YlHNak84YK3rM4bsD2NTB994zRRJXRyCxkJ69iWwEtqiX03rMT0jr0ETTyxg/0ffI8lM2KgOfvkrlhbkWyI3z8lP6ysIxUwWwtQDXfvHKBl0aIWT7MQh7f9zo/RCa0aJzMXyWpJ/0x8D/MCQvuxuLEMYhjrz3YVk0N9Erem3SibSumy4HbRd8x+3vbREj+RIwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdnup+NDc5xQPUolzW7o9TKibjEBXyF1uGWqZVk89l0=;
 b=iFD4P0SlXcJbdmFevup8+o04l5i/0QZD5zIBgd1cf1ox9BS98q9jA/ufLWlNm/xs+6P9lqDnhAbd3OfS43o46hxEu4ttcpqGMkipEABYrRRadEWE4Zuz/0Le5RXLE5ZQxqyvCj1ETM58efnGxTd9zaXAR6P1uZ7JGlc+v8c1v/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY5PR12MB6525.namprd12.prod.outlook.com (2603:10b6:930:32::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 25 Jun
 2025 22:31:29 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 22:31:29 +0000
Message-ID: <d8313fd1-6d97-4d20-8343-5a8609d2951d@amd.com>
Date: Wed, 25 Jun 2025 17:31:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH v14 02/32] x86,fs/resctrl: Consolidate monitor event
 descriptions
To: "Luck, Tony" <tony.luck@intel.com>,
 "babu.moger@amd.com" <babu.moger@amd.com>,
 "Chatre, Reinette" <reinette.chatre@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "Dave.Martin@arm.com"
 <Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "thuth@redhat.com" <thuth@redhat.com>, "ardb@kernel.org" <ardb@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "manali.shukla@amd.com" <manali.shukla@amd.com>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>, "Huang, Kai"
 <kai.huang@intel.com>, "peterz@infradead.org" <peterz@infradead.org>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "Li, Xin3" <xin3.li@intel.com>,
 "gautham.shenoy@amd.com" <gautham.shenoy@amd.com>,
 "xin@zytor.com" <xin@zytor.com>, "Bae, Chang Seok"
 <chang.seok.bae@intel.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
 "Eranian, Stephane" <eranian@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <80689a762e59137f0d0297ee4ce0d31f070a3655.1749848714.git.babu.moger@amd.com>
 <e9eb906f-d463-4c1e-9e15-5ed795fe5366@intel.com>
 <09c1aa33-08f7-456e-9c15-323a29877302@amd.com>
 <SJ1PR11MB60839D756E7D880DA0D2268BFC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <SJ1PR11MB6083670E3A7FF6AE8881EBC2FC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <SJ1PR11MB6083670E3A7FF6AE8881EBC2FC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:806:122::20) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY5PR12MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: f112969b-9938-49a4-5a83-08ddb438074e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkMxQUgrRXE3RVk1OVY5TzJMZHVCc29wWVp0bHgyMGZ4cCs2TnUwZzYyRVlm?=
 =?utf-8?B?TVF1d2J5SmFmMjlad2F6Q1lHTWxjd1N1bnZnbldRczZZRGhqWjNiN05TY0VQ?=
 =?utf-8?B?b3hHOURRY3BCQ1JaQVU5UGpBTkUvV1lPSTB2UmJHZTZKdDJVZnlSNFAvRUVy?=
 =?utf-8?B?NjY3MCtESTg2WTZiZHcybzcrdS9RMWZ3NHd5VW9hTlFkTXpyY1lzZ2dTVU14?=
 =?utf-8?B?b0VCVWNFR2tucHdaYTBwUlNIWHErVGpEaXNtY1dFU1ZSRldFTDBYTXh6ZHd2?=
 =?utf-8?B?SENCU1hyamZWeC9NZnR5VC9MSE0wYW9nZHBENWlWbXhXSmY4ZWlaWDA5aFph?=
 =?utf-8?B?dWxJd1dOQVNKNS9GZWlwbUtIUmw2bWFxVVZOUFg0YjZIcTRvTi9rYUczMGY4?=
 =?utf-8?B?a3A3MCtRTkdGQUVMZnlGazJKSGg2azNWQkdMaHp5MlJpM2hiV2hPRG85YTVl?=
 =?utf-8?B?RzEzcDJWMlhvNjNFZURMU2U0bHgvMW9KQktsNlJPcXZHakZiUStIS1d2NHBx?=
 =?utf-8?B?MUNIeUNWT29LcmxINHIzMmhWai94cTdvTW5WTG9WYzdjb0E4SnZQMWZBN3ky?=
 =?utf-8?B?eVdrY0hlUXNXV1l5N25oVGhrNnFHa2UxVUhCVHVyU3FTTFpHa1BORHB6b2VZ?=
 =?utf-8?B?bHdKMFpTUUtpVDNHV0xNNS9LRXhUZDNNREJwNldhUWhGd3RwZ1Z0azhuL1Vz?=
 =?utf-8?B?RnpjN0Q3NXdiMmptd2ZzdlJKS0JWdEF3YlVjRnlHUjYxVU9WWFludUc5VXVM?=
 =?utf-8?B?ekhVeG9ueTYxTnpZclEwVE1QK0tKdGN5Q3RwcUsrV2ttak9WOEhqVzFmcXZL?=
 =?utf-8?B?ZXRQYVEzNnR3TThodk1JMTFKV2ZhMEFqWGNkVkpHZjE5VndHOW93UCtsTkNo?=
 =?utf-8?B?elI0UHFwaFAyUXJnZkhWdjROd2JzanIzcmk2WUFSOXRJUXpXb1JkOVYwRnk2?=
 =?utf-8?B?VTZjQlpYc0k0MnluRXFhaERWNHZYdXJSUlV5dkRyWVpPYXBIbjVyK1RWWEVI?=
 =?utf-8?B?SXNrWng1UXA4aEJqNFdKVTZCVWhvbjYxcTlNdnZlcU5lOUdqSXQwNGNINlI3?=
 =?utf-8?B?SXRuQldXbVZ1ZlllK3d5SVNET2lYK0szNXFPc2c3U1JyS0pDYzFQUGR0am9N?=
 =?utf-8?B?RHd2NWp3M0ZLNVdDV1YwckluQlNXSmNEK0hEWFRpdDFXZEdmWHB1TnpqZjR0?=
 =?utf-8?B?cHJqTEM1QUFLUUMvQXlHMDNLQTFQcUxPK0ljOHpoS1ExVXhrNWtRSnZ6b2E1?=
 =?utf-8?B?TUNBOGNKRGtJdVRkM2NqeFU3dXhXTlk4bUptM1ozY21UemxWNm9mUmVyV3lO?=
 =?utf-8?B?T2NLTGRDZHkyeGg1d29ybXJWMTdkczhZK2drcmN1bXRMditTdGhNaHcydTU4?=
 =?utf-8?B?MkI3cElLVTB0TFNVNENtYU4rK2hrVWZMbGtmWk1rUllYeWxwOC9MUEdJZE1i?=
 =?utf-8?B?K0NWRmd3enZsQ2RjVzlOM0VXZ25JdDltbk0rZE5Hd2lLY3B1WEE5NVFzY1My?=
 =?utf-8?B?cE84MTZ5ZVZ0Zlo3Q2pweE5yK0NkSk5kTjQwWHZzS1JNQkUrZTBkZFA0Vlpo?=
 =?utf-8?B?K2diU0xnRGRtTFFqc0hKZVAzRDhndTliWW84Y2JDTjJ0Tmo3N1kwRUEvOWlO?=
 =?utf-8?B?TEhlYTNnR3Jwckd5c0pOaVlyVFpEc2ZTYjNMSjF5VUNYcDNVRksvTHkwNlQ5?=
 =?utf-8?B?c01QcWhQWXRLMWRyZXJwSHQzVUFnc0xtMlJ1YzBSVVRuR2VMOEFpQXRNcFo0?=
 =?utf-8?B?ZmZVV1lUYUExZWl4YlV4Vmdidy8wWTN5UTNlWWdYQU9tdjlIQU1saTRqbFRk?=
 =?utf-8?B?MktTZUNqdWNvZXVKVGxwYnN2ellaL3hnRGRkWlgwamgweWc5ckR0VlFGc29V?=
 =?utf-8?B?VVNUTzRLNUZDQlorUldsekF6K0ltSi9tbWI5Tnd3ZnBkSi9pRjJhTm1LM3Iy?=
 =?utf-8?B?RkNMaHZXcGVBMWhTUTZQSlhxTGgyc0pwSjNxWjdIck1LRHB2bXpoZ04zR1Jw?=
 =?utf-8?B?NUpwLyszcGhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHVBa2hOS1cxdlh0YjlodCtlVkx5aEJUNllyYUlDOFVXUVlhWHU4VUs4a0R6?=
 =?utf-8?B?ZUd3ekdXTjA2NkhVNS9ZRnhBdkhZZjRwdjhKd2w2QVlaKzhwODlvUWRlSjcy?=
 =?utf-8?B?ZExmb2Y5NzVoU3N0NU5UaW9NK3liK0tRMkdiZmpSNHJ1bmhUVDB4S3ZLb1dr?=
 =?utf-8?B?MmdKODlrRGwrVGRjcGFndldrUTVHNHBaRG5ZZi9kbHdoZUhab2tHcHNaMUdG?=
 =?utf-8?B?enJwaEVza2hsTVdRNnU4Qk83aG9zYUZsODNqd2FxRFA3TjdYYk9ValFQblZt?=
 =?utf-8?B?YUZocHZ0ZkNaaXB0NzYxaE1mMkI3c3FvMExpTVdrTEo0RVpnd1FIeUNMcW1K?=
 =?utf-8?B?Tm56TWgzU1BpdW8zdUhlbWRkY1RRbU81MDZPQ0xBWUgrTEZ2eDdJU01XWmdT?=
 =?utf-8?B?blcycy9UYm1zQjR2QjZsSkV6aUtuc21RL1JNeSsrT2h6VlBGZzczQVNQOXAy?=
 =?utf-8?B?a3FVTnpxWm5LVmttVWRyYlFDRlRLU2RRaUdFNS8zbnN0dVg0RU14c0NaanZn?=
 =?utf-8?B?ajZ1YlNacXExTS9PWHhCQTVxMHUxN0RtVzYwNG9OdVpERHkzZHBaYmtPcmJo?=
 =?utf-8?B?amxtM0JOaHdCNDdIT08yM0F4eXY5ekxURS82bEl1OGQwaFRJTzV2Z0FkeWFI?=
 =?utf-8?B?VFB2bzVxM1pHY2FuQk92UDUvaG1WTGIvK1JseCtxcmRKWUt5U0xnTFBxMDdv?=
 =?utf-8?B?NGp6RGdVeVBOUTJUS3FMZVZ2NTZhVmhVU2o4MzFBMmxRUG1udUZyTTR6QzM0?=
 =?utf-8?B?Y1RRYmovOC9VdlE3TTJjaHg1QjFEVHBFL3oyUVdYZkFhdUV3cG1JMXBIMUZv?=
 =?utf-8?B?eS9Td1dCNVk4L3kyMHgxTWtzYW5vUU5IaUZHRXFZN3JaeEFYVERIMEhBRTl0?=
 =?utf-8?B?WlkwbCt1WkVXY0VMSG52T0RzaXJtd0FKQ2tpZ1pwdVR5L0RGSjAra3cvcDNL?=
 =?utf-8?B?azNnQ256c0JBSDJ0RmF0Z2ZoQUFNSGFxNVdZRGNnTXJIaUpPakJiVmlTSlhX?=
 =?utf-8?B?V3VDOVE4Zm1lYjE1b1NCOHBxajlhZ3hiOFNLOFVpQ3BhZTA4dDlwdmc0cm96?=
 =?utf-8?B?YnRLZXp1UlZHdkpVNnVNL3BLbnZYZUFkK2tOZGRUam1lNlNMbjlCQmtlWnp3?=
 =?utf-8?B?cTIzaWttUXYrejF5aXhDRDdOdDg0MGVYN1hqMFJOQzNYKzFlM1p5OUZyOU10?=
 =?utf-8?B?N1hJcVJ6QmNZRnRYa3c0UERzZFF5aXdtTFJyRmFvTDVxV3REVzM1WnBKbW05?=
 =?utf-8?B?N3RSY0tJWS9VZEhmSkJlZXVnbFNWMGRrbDVrbUs4RDlVdERjcDNNMmhrQTUy?=
 =?utf-8?B?S2JSTWhBK205eWZmSEtzZWNVMjlXQ0pkbThSc3JWaW9KY3JOa3dTZXd2dHhn?=
 =?utf-8?B?RTBaMnFSZnJYb3c2ZzFYenN3S1M2MGxlWExyTjQ0b0JhUUcvNm1FblFqSHQw?=
 =?utf-8?B?NHlsaU1NejVmUUo0bGhCUnRQK2xDM2RHNGxGNmRsQWlMb25hb0hQeDdlYTFa?=
 =?utf-8?B?aFBSdzVqNUNubzhaakZKaDdOVmhGL3pvazVrSHhMTGFOZ01rM0dGZnVJU1J0?=
 =?utf-8?B?VEQ5QTQ2WWNvRlJDN3FWNENuQ2F5dnZXazRrdTF1aG5yWWFKUTJ4cC9pQjJ2?=
 =?utf-8?B?TkJBQ1QrSU8zblgyV3ZaQUNIWUhxRXcyRTdFOXI3ZzNtblBMaThrdzFpbWx0?=
 =?utf-8?B?cWdKdFNEOTBsSGtpcFFxZW1RUUlWV0Mva25xY1hEV2JOdXhwMzc5TnhsajVx?=
 =?utf-8?B?T1Y2SGx5eTFyVnl3eVFOSGpXWVJqRG9HUG9qQjYrRjBpekwzbTJMTEZFZkVU?=
 =?utf-8?B?QkVYbXFBbXU4eGgybGdpSGMvTUIxVjlkeEdJL2wwdFk4WEEreWxQdkw2VTlp?=
 =?utf-8?B?czVsU01RVElLcFNrcFhaL0hEb085SlVGa1E3KzRTaDRGeW1oQ2dMOVZyOTlS?=
 =?utf-8?B?bDVkdEMwQzJKVFA5dncvZnN6ZWZ0QWc3elNtanBmV2pPNDJKTUdDYWxrWFln?=
 =?utf-8?B?RmRPQlpCRnJrdklxRHV3YjNDNW5OZDUvUVhHR3ZsbnhIZXVJRk5oNUZZb1ZW?=
 =?utf-8?B?bTlLRm9LRlk0VFF0clVGekRUek5wZEdTRFhkc1Fqczh5c0hTYTBjTkFIYjFM?=
 =?utf-8?Q?G0yo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f112969b-9938-49a4-5a83-08ddb438074e
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 22:31:29.3590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXeWbfjFuPVZAW0xjUK82VbG71Yb14fCe6zw7CssEN5gF5I8+YwH0YLNP/Y8WDMh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6525

Hi Tony,

On 6/25/2025 3:12 PM, Luck, Tony wrote:
>> I'm working on fixing these additional issues. I'll ping you when I
>> push to my GIT tree.
> 
> Pushed to the rdt-aet-v5.5 branch of git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git
> 
> You need these four commits:
> 
> 2feb4e5716f7 x86,fs/resctrl: Prepare for more monitor events
> 3a86f90a9b81 x86/resctrl: Remove 'rdt_mon_features' global variable
> 3e720a9d3b46 x86,fs/resctrl: Replace architecture event enabled checks
> ed06edafba78 x86,fs/resctrl: Consolidate monitor event descriptions
> 
> Only first and last have substantive changes. Middle two might just have
> changed line numbers because of the first.
> 
> To fix the "landmine " code using "while (--idx)" I added a macro to
> do the iteration (originally suggested by Fenghua, but there were
> only two places to use it then, so it didn't seem worth it.)
> 
> Now there are 4 ... so here's my macro:
> 
> /* Iterate over memory bandwidth arrays in domain structures */
> #define for_each_mbm_idx(idx)                                   \
>          for (idx = 0; idx < QOS_NUM_L3_MBM_EVENTS; idx++)
> 
> Hopefully enough different from:
> 
> /* Iterate over all memory bandwidth events */
> #define for_each_mbm_event_id(eventid)                          \
>          for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;               \
>               eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)
> 
> to not cause confusion.
> 

Picked up the patches. Applied cleanly. Thanks a lot.

Thanks,
Babu


