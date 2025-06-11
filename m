Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE268283144;
	Wed, 11 Jun 2025 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645612; cv=fail; b=YvLIudhzDJat80+sik+XoYhUx642MkzFtKqLTaX0geCRxgvNyicP2o9buznjOPBt7iF9vYojrAgDiQMMD5yiE0abKZTjeS/eOao+PFdeIBV3yHwY/xNtyo931O6DJOvPkiRLCbhfVi9u4HGmmhXK+kkdMZri6xvwEQO732mE91U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645612; c=relaxed/simple;
	bh=n3AwHlH+kZs0RnB0a92lEWuuSeU4kqvJDu46qPGxyCg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PcrzFlI3qYk/kp6sKQDOMRol5a90UN5lJi5CVr3f9pmPr/kcRX/dzHHnMlFF7wQRnxLtMopeBeyX39IuvjyoAhbGZmgWAyddfYSI4uh3YO2Y22Sxkc+gmndNCvEaoEE78JwgoTxHqv93XCqsFsbqwLuazYP39tI5oH3jPLdb90g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=LWSDT0fI; arc=fail smtp.client-ip=52.101.61.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="LWSDT0fI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ni037S9tZ94N/ZMXQLCsF9Qv8Xhau0BUIxP0zwUCQQiyx1yb+awS6K04By6uPvWtrVhPbbCPlLSI/EjlKyHIAvbm5Q0JG2f1VWJb8oaaPQkura4SokVSwvdd41Czophhk2VH/1S8R7tyjm25vT+ljHLHOI8TQb3pV209ij+Q3pyfo1Egu2YfVzoNZ8uwRGLE7YsG1/k47xkppG1A0jHfjcu1BZtD18H7zLf/zbfNy1NdRamgSmJskhk7puYkRUPxkUPWkkl97j+Dm7NNrUEkAf7X3da7LvAtR7ZV+ZsAi0lQ+rQMIUuzKpb02PsvN+pApao8kd+iVEUqiSgNxi5Cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7Lx8FHXjbVH7dlpUP2jc3H9x/PlWSVrxZS8id4U8S4=;
 b=sfHpqJ2BSzyb104lk76Pd0VBRX3JSDM8c/FOcvilPvwGfRCgiKIgoXOaXR+jRKjETUpRQykwdFiVqbaok5pblB9Ig17QUE5D0e6qD2d4CyyKFpGc1JsS/sb+4+M8cV7E74l8GXbeiIqh5YW6srRCjpWz5QWL8B8JHs6TZCyigKXo1N8OLajsYILHimO4NQEJRJCfw+FEHfB+samrFHpbeGPNPTR/oKdpdiCHbnoGI4rOjyXPaS6QRMDCybeVK9IINARJYtiYO9VuDVa3sVyFSo/L7dGmk36rMB5GmhUbL0DpCr3RW1rtUOzNjNh4ss75Aa4zlEc4tWVeZ1opH/4adA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Lx8FHXjbVH7dlpUP2jc3H9x/PlWSVrxZS8id4U8S4=;
 b=LWSDT0fIyCzi2+yonqHxYFswh247Zx+QDeDF2j1477wAAm/MMpVB2LXfGKx/Z3UeuaUn7oRwjuOp0R8VH+vJliaxxEc9uK+VCrhgJAdSbk4GnNZUuVwvM/C1qPFE/KIrflzk5XLXcBNr0Is8yGOgrNx5IVSS9N32DBwJjkwaxzgU75lQuE6sVIDeRdNKq11DXeK2PR51RpLWxr6l5WIg+tf08Y0aEEC2+fdqWJ8kWCM0DxaGpAjQ1/KC1NZGnYq4zjounysOSrZ3gf/NQOieQqtkX0zF2q6z2AXYvfwln270tJmc4qn61ivhgkfjg8t1tLEgBf4TcYwIqMvjTaMczQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by DS7PR03MB5480.namprd03.prod.outlook.com (2603:10b6:5:2d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 12:40:07 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8792.035; Wed, 11 Jun 2025
 12:40:07 +0000
Message-ID: <b92fc5e6-d39f-4e17-a7e9-bd121650b41b@altera.com>
Date: Wed, 11 Jun 2025 18:10:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] firmware: stratix10-svc: Add mutex lock and unlock
 in stratix10 memory allocation/free
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
 <20250610-sip_svc_upstream-v4-1-bcd9d6089071@altera.com>
 <6c6d40fb-8c1a-4e95-a12f-9c994ae03d1f@altera.com>
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <6c6d40fb-8c1a-4e95-a12f-9c994ae03d1f@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|DS7PR03MB5480:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a8465a-ddd4-4ddb-bc28-08dda8e518cb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjlOb2FVYmVLSXFLVU1XS3BWNGpTRzNPMVVpUitreEt5S1pUaVZtWHF1dFdY?=
 =?utf-8?B?RDB2QjBDUGxoSGZtNDVOZ1RwVGtDdjJqOGFoWG1VemJRaUZEN0VUa2lZdVMv?=
 =?utf-8?B?cWQvSlZ4Vmt1djE1aWZsbXBtSWN0N041TzZMaGx3bDd3ejNaOTFVT0xvbkJX?=
 =?utf-8?B?VTB5dDRIbWQxQWNzNnRLc2RUbERkMHJTQzJiaEJ4WmI3ZXVYUFZZWmhTU3hq?=
 =?utf-8?B?YVlid202UERielFLVmxMV3pJbUJjdXE0SmJGTTNzTjJ0aVhadDdLWjNZcGVG?=
 =?utf-8?B?SGlzMTRDY2ZpZmFIYXEyM2FWVkdNUWRaVGthTENGMm5GRk5VRXpoOE56ZS9T?=
 =?utf-8?B?b2M4ZlFuU2xPU1VLaGdKM3lDRWdSYWJ4dWNWSkNwUzhzL1dUWGtSQVN5UlJO?=
 =?utf-8?B?RzNSRnA5L3BWa1I5UmhCNEFjclpwaEJPUjk4WHZaVUNpWGZxQ0dWY0kxUWRV?=
 =?utf-8?B?ZERBZHkrNFA4Y05WM0tra3RqRTN3TzlTNmRKSWthb01LQUF6ajY4cS9CVmlB?=
 =?utf-8?B?SkFlS1NjaVFvVFRUNlhSY3FzNnFmZkNzbzE1TXI2Q2RMRnVzOWJjMTJ2Rk91?=
 =?utf-8?B?M2lpcjBtbkVEeVd3SW80SGZyN09WTHliWktpdVlWaytoZzJwM09LU1FSRFdt?=
 =?utf-8?B?azBuVDFPTzVPWjdiKzhZMk1nRFFZUEk1ajZUWEkyUGpMbzhUTlpZSVpzRGc4?=
 =?utf-8?B?S0Q0dXlLNzE1UnpDT2czaUlpSzkzV1RHWFNESFd6dkpkZ3paaTJmcnJkbVUr?=
 =?utf-8?B?Ly83Z3psdDlaMy84anQzbkJKM2d3WVpkdFh2L1lmL3l0OGRwWEJMVEczdzRl?=
 =?utf-8?B?ejlGVlJmM0Q5NGtNeGZMU1Y1YnFJTGFKOXFvbGJ4WjVzUHV3RDZtSUxCajlq?=
 =?utf-8?B?aFMvK2ZQbHAxTkQyVXNhTWVvdFFqSlA3WWxGTHN2ajVxWmdWNXhHUzlSSGhk?=
 =?utf-8?B?ZlhLZlB3SGZCTjgwZWI2Vm9DaFI4NkVHcnNNRGNrK0JCUWIzak5rdVQyRm14?=
 =?utf-8?B?aU50YTJNYVlOL25qTWR2UHpKaGhmUmNFakFJY0ZuR2t5dWpzellPVUs5bmdI?=
 =?utf-8?B?YUhINkIvVXc1VEpLWDVmcWI3ZDZ1NXJsYytPU1AyYWRGdTA4bkkybDdkNjhG?=
 =?utf-8?B?TU9jYit1d2ZCSjRnN0JVcXl4Q1MvYnVUNE5Uc1RKQ3NGby81bklnWnVDdVdz?=
 =?utf-8?B?RjlTVDdGY2M5eXNMZnl1Z3gyQ1hKU25LN3J4ZW9vaGxiSGVKenFwaS9uazRS?=
 =?utf-8?B?M2V0UEZqYmsxdVpXRkVnbDdYc29SSksyanUzSi9yOG5GSGNUT3cxTGEzeHlI?=
 =?utf-8?B?cWhJT0UzajViUDY1Ryt0aVZDQzVra00veUprUER1cGp5ZWdzbXh2dlhiUUtS?=
 =?utf-8?B?SlF2QkJoV2RRWTBHM2RQWkRtVExjb1k5VnVlVForM0F1Sjg2Y2h4OXh3MnhX?=
 =?utf-8?B?cGNPN3pyTjNsYmU0UmprVDBRaWxad1NCcG1VQmJLTVErRGp2cittNGpVU1dY?=
 =?utf-8?B?bC9FYUQ0NVdjYkhQcXFZNFJJUDkyNFpPV3R4bXlkcmpZaGhMSlF4YjJoR2xZ?=
 =?utf-8?B?STFDbStoQzVkSkxUWk8vRzZjbnRiWUJXdFVhQThvZWN0TENSWlpFSmlQM1NW?=
 =?utf-8?B?RkVMWnpEWXEwbXltSHdaTE1VVmorMnFWazZzT0hUcUJ2Rkg2anlqc0dHV0hx?=
 =?utf-8?B?MGlMRTRZaWJJQ3REbW16eHpkc3owYUxhRDRsNWZmQnpYSlVVaS9IREhVbnps?=
 =?utf-8?B?Tml2WFU2ekJsb0NEZFhFTzhvUjFXL3VyZ2tRNWtMZnJ6TTlneWgwb3pNV0RF?=
 =?utf-8?B?Y0oxZVBoTW9sL0Jsc1NWdUZjeXZLNVFjR3BsUWZFR3JIRm9BaWZNc2JRdVRQ?=
 =?utf-8?B?MmMvWVJsTEY5T0dOT014cHdqYTR6cFk4S0FzNmRJK1NWdUcyd2hlZmhDY3JB?=
 =?utf-8?Q?Xyq/AGaOXhs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzNtUy9zZkJNMU0yaWRFazduMi9DT1FGR2JZK01PWVJsOSs3SmpVV1lYd0ZC?=
 =?utf-8?B?cDRPMStVMnBFNzJKaHVUSmVHUDNqZ0ZhR0J4TGVKVTFJRU1wZGw4dm96NitE?=
 =?utf-8?B?MWlocFRQT2JtckdDbXlxa3RiVVdwTlNPMUJJWXc0bHluM1BXcXNhYnUwY013?=
 =?utf-8?B?ZnZqcnJOb2l5RFYwL3R0b3JHREFzTis3TFpSZlNVb2RoSndmbFNCOHFPOU5L?=
 =?utf-8?B?M3VtclRrZHZhVU5VR2s2NTVObmZ3UUNZUEtSM2F3SjJTVWRXYUEzdzl1MWNn?=
 =?utf-8?B?Y3dlUDZ1dm96MmtOUXc4bHFodFM5N1NlTjFPZzlIZnl4TGZPeFVTa25VTGor?=
 =?utf-8?B?TSt0NzdrWEZxK3hlVFFZMHhxRS9XVGkvd0I1dTFRUWIvWFc5ZjQyNWFiajVP?=
 =?utf-8?B?YXJPZWNpNVFVc3ZOK0NCQ1IzS2VIc3NxSUJRYzZKQkY2c3lTL1JWU1Ztejlp?=
 =?utf-8?B?ZXp5S3ZoNis3VFJESG1JdGFpUDE3S21IVWFSYzgrVUV1dEVuZWszdE9YY0J0?=
 =?utf-8?B?MGUxc3dKL0lDRWEydStzWkR3WVFkbmJCeWVlSTFzYXhUMzhEWHZhcGJ5bkow?=
 =?utf-8?B?TTlnTVlmWk82UXJWeDNqdWI1TFljK3BUdzlORlphRzRGR2E5UXR2Mjk5VS9L?=
 =?utf-8?B?MkRubVd5RW5QZmFpQzhhMHBRNzFBYVFLaFllaW04eVR3ZTgyWG1PNVMzQm5R?=
 =?utf-8?B?OW81MWpnNThvRkhRMkFFQzFMdmc4bWNINVFGWWpBL1VzWExYUWMyWjdDT1lL?=
 =?utf-8?B?em02VDA3TytmY1ViMlE0VW9UdGhsb211ZlBMLy80RjkzZFNsMWVvNUx3cDBM?=
 =?utf-8?B?WTJhbk1wYmpKU3pUdE9ybWt5dVBueTJDcForT3NabmV6czdTQ3FyL1p4dEZu?=
 =?utf-8?B?bTlSQ2hiNE1uVzJYZ2xGNVJmMTU0dEV6Yi9qSE5mSjlkcmJ6bjJwK29jYVov?=
 =?utf-8?B?cTFSRThMc1ZQM1IxbVF6MUZ3amtWT3Vld21MdUpTVkZ1K0s3NFJ1NHYwTW0r?=
 =?utf-8?B?cUVtVTdxL3VTaUlLN08veUdpbDk2bk1yaHZhRkdEUm0yOUhwVTJheUZ1RElr?=
 =?utf-8?B?aDBrc2hqVVpaSERWTm5RN3Jya0Z2dnM1NzhmWXVZYXpINkl2Sjkyekp6NHF1?=
 =?utf-8?B?SG5uWWRQNGhZdjJkamlFdTV0dGt5YmZid0lKeVFFd3NZV2JGYkltR2huV2hH?=
 =?utf-8?B?YVJCeXFSc2QzMzkyWG1scEx1QVh2ZzMyMFdhMnMxWHhKeVlYM2pML2ZzUGJs?=
 =?utf-8?B?cGRZVEhWQmFXNUtoaW9vM3d4eHl1SndFSlpvOTB6Z2twQ0cxU1p6TlZ2SE93?=
 =?utf-8?B?bVNJaTlHaUVhK0UwL1J4NlY0RmtaNndCc05HaUtxd3V5TldSeUZqbkR3UVV4?=
 =?utf-8?B?ZXFzZG1neDk5OGI0T29QeE5RNUF2VXdSUHNtUFVRYkt6aWhYaFlkR0VSMVA2?=
 =?utf-8?B?eTFWZXQxQUtHQ3N1NWVqSEZRT28ydHJwZU45VkpmWnQyTjVxMFoxUmZ4L0Yr?=
 =?utf-8?B?K0plL0pNekNOcHpucE9SNzBsaUZGVHhrd3ZzWFRqd1JCSFlUem8xR29WUzdm?=
 =?utf-8?B?VEI2bGwvYmdzbEJ4RWt0SUhZa2E4MEVKeWhDM1lGUUh2NmdZUStER3IveXNs?=
 =?utf-8?B?WENLRVlyOU1EUmJWT3VFVG0vVFdudTJsWkhBaXBZN0RzenQ1aVNET2lyb0lq?=
 =?utf-8?B?WDNFRjEyNWNjQjlyTkIxUDl0ZzF0Z0dJUXpBUUNNbDVxS1FpcUw0ZFBPT0Nt?=
 =?utf-8?B?SmFwcTE1VDlBOUFHelprNk1hS0FYdldkUy9JdGttYjltUnVnN09iVDlSK0Jy?=
 =?utf-8?B?MmhhV0hiQUlNOWZETVIzbUszMzFhSWkzWE1oRUpVRzhJZ2lPUzVvUWladnEx?=
 =?utf-8?B?ck01QTZpYkVtY3JxUk9JaDNlSVhsMWdYUi9JVm5EaStLMEt0QzBpVFUxeW93?=
 =?utf-8?B?NTFTcmVqVFJNeWFGcjlKV3NiVFVvckxQRHlyV25rU0JRU3YrWDlvdXJrRVNm?=
 =?utf-8?B?MFdhVS9GVmYxdVEvWm9yVTlYYWRpQ2FWVmJNMGhFNjE3bGlQK20rYi95S2hl?=
 =?utf-8?B?Q3lsSVRTU3NWRUZveVgxOW9TTGUrelpqREkwTnRzMTJ0M3NjeENsN1NiSGtq?=
 =?utf-8?Q?FRIP9ysp6/hilif5KPEVT2H8F?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a8465a-ddd4-4ddb-bc28-08dda8e518cb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 12:40:07.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ9E4kw0bzM6YbUqa9NMDaxcEnTbbGyF7cI9/PjuaNnb+s62DG3K8bVe+lDOpcg+3vfKtdKE7hNgGPmJy7KPsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5480

Hi Matthew,

On 10-06-2025 09:36 pm, Matthew Gerlach wrote:
> 
> On 6/10/25 8:37 AM, Mahesh Rao via B4 Relay wrote:
>> From: Mahesh Rao <mahesh.rao@altera.com>
>>
>> This commit adds a mutex lock to protect the
>> stratix10_svc_allocate_memory and
>> stratix10_svc_free_memory functions to ensure
>> thread safety when allocating and freeing memory.
>> This prevents potential race conditions and ensures
>> synchronization.
>>
>> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
>> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> ---
>>   drivers/firmware/stratix10-svc.c | 30 +++++++++++++++++++++++-------
>>   1 file changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/ 
>> stratix10-svc.c
>> index 
>> e3f990d888d71829f0ab22b8a59aa7af0316bea0..955468555738b2031dfcf6dc4db7dbf11ccc482c 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>>    * Copyright (C) 2017-2018, Intel Corporation
>> + * Copyright (C) 2025, Altera Corporation
>>    */
>>   #include <linux/completion.h>
>> @@ -171,6 +172,10 @@ struct stratix10_svc_chan {
>>   static LIST_HEAD(svc_ctrl);
>>   static LIST_HEAD(svc_data_mem);
>> +/* svc_mem_lock protects access to the svc_data_mem list for
>> + * concurrent multi-client operations
>> + */
>> +static DEFINE_MUTEX(svc_mem_lock);
>>   /**
>>    * svc_pa_to_va() - translate physical address to virtual address
>> @@ -182,14 +187,17 @@ static LIST_HEAD(svc_data_mem);
>>   static void *svc_pa_to_va(unsigned long addr)
>>   {
>>       struct stratix10_svc_data_mem *pmem;
>> +    void *ret = NULL;
>>       pr_debug("claim back P-addr=0x%016x\n", (unsigned int)addr);
>> +    mutex_lock(&svc_mem_lock);
>>       list_for_each_entry(pmem, &svc_data_mem, node)
>> -        if (pmem->paddr == addr)
>> -            return pmem->vaddr;
>> -
>> -    /* physical address is not found */
>> -    return NULL;
>> +        if (pmem->paddr == addr) {
>> +            /* physical address is found */
>> +            ret = pmem->vaddr;
> 
> I think you want a "break;" here.
> 
> 
> Matthew Geralch

Will make the change.
> 
>> +        }
>> +    mutex_unlock(&svc_mem_lock);
>> +    return ret;
>>   }
>>   /**
>> @@ -990,6 +998,7 @@ int stratix10_svc_send(struct stratix10_svc_chan 
