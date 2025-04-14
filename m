Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6C1F417D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672872; cv=fail; b=XjtUEZ7meVDPBHcav77rASMEbTTRljN06LU5dHrPCVwkrTgaLcqywywkQNP3k+5ftmz0QxJB19jWUA2o78iRneppHqj9D+mOrarnW1/jIrR2oFScU6F4g3L3UO7ybLK6RrycyigzusQHW473z2dEmc+UzBogHGpl6T4SOHM/nQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672872; c=relaxed/simple;
	bh=F+g/9mkR4hYKWJXkZP0Y+GPKSrXLmZtmkW9EGUleSD4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JxGKxRxuzsz6p2oe//VVF7FT9tVdDpkGNKx2J4GNQaGc0Oi1UWKf4ZE/Wi2sCX8d7pc5iC4R4GF7VtDnOD6Wyuwrdz7Y1K9iwnMsiYf8ISCEtboExdkQUbLHCu2BjmBKh/45VI6FTDqIfJ7CwAGRgHD6LkQ9al2+PAJV4t+qjb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CPF5LOph; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CPF5LOph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJzHin7Oty+Gb+MG291db0y0fQVDVfbyFtKoPFnE8hqhGowL/5L+1NJuNSltERnT78zQioop5hWZNRI2cjdb1IYZ0M1SUnSawuNCRCGtap6TuHJMWapP1dUPosTCzrBPN3qTxuEug6lg5ee7JglYM+ine6vsXM/wlzHNxgZDJ4tPwKrWCd5cAp+HinkG7gIBcRI+02daz9E0SaPIv3acrvFsXO2xkiK5No4pjLMnyC4wfQJwSh4myuiBYktGRf1NPP68BXDF8SucfJq2uureUOUmfls+oja2T+CvAWD07ZKdrYTXCHYnq0ULQcGzLwFY6J+mHyZxxfq+TDW6Tv3tAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnh2N1nlkC39st2m7bi/VWyQLibQHGgRLEY3mVkMriM=;
 b=AwfWVdPOuJH7PSQU0YDyQFDapJqQ8I2jTR9fkUgdudYOB9YGTKZK/7KzOsUuUfj2gu2jRdk4idx46boRrztW5UNn73miGdyjScNjmsaxYQ6aOyOT9zMetA3KxgOwWGajz7/iQaYX76ScWkZIepvdIPF22LCQQroJ0yIztYCKgR7C52v0krAYvLS7Pj8WsFUUEuNAcWop/FkKdjb9/TK8Rjpr4lu20pdVN5VsB5gU3jPqFDMXt/XtHVvBr/aun2No4yvf4evgvYH/0HRFHYReFn5Z+axbmYHfADEMFrSDhXUzQoP6etAUSg9I9E9ngjVA/k/tWoxsnCbv4BUtMujI1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnh2N1nlkC39st2m7bi/VWyQLibQHGgRLEY3mVkMriM=;
 b=CPF5LOph2Eu0xibEbUS/4g5bEs2/3s/Dimz4m+iA5jXj8wDxr+T+aR2vo+zJ+A3kHIr0BDXA2AdtQ/I1Ky8/gobssYdSqClGHtRfskEVtCcFfVPXUboIjWSVhN1pJJOxuJrMCUEc7LZxvZkw2oFw8XhyCeiqcv5U9wphOLi/TXHhkh3S6cNRWj5/fZf4JoPrGPd/GC8WBiTGDAJ4RzjDA8d68WWfR+0i5nuXmvnA0n8hxq29ivaQJBIlJldwtphRSgULW+f7vIMVXIaQUrjPVezsqrDzmVZqQmNpZZJqz9I/jy/lK4bZguz323L9EoSrTTzq7NbV7gbbVYTCqAnf3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.33; Mon, 14 Apr 2025 23:21:05 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 23:21:05 +0000
Message-ID: <3404690d-f1cf-4838-aa1a-788a6210b72f@nvidia.com>
Date: Mon, 14 Apr 2025 16:21:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/21] x86,fs/resctrl: Move the resctrl filesystem code
 to live in /fs/resctrl
From: Fenghua Yu <fenghuay@nvidia.com>
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-18-james.morse@arm.com>
 <f4ab6c75-f6ef-4504-9060-8ca9ab38b0aa@nvidia.com>
Content-Language: en-US
In-Reply-To: <f4ab6c75-f6ef-4504-9060-8ca9ab38b0aa@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 2620326d-035a-462c-8317-08dd7bab0748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkVaUDBJMGJSTFFhaCtRcjN2M2h5RnNxbHR0ZDkzTUxhWW9sa0s2ZFZkbjZ1?=
 =?utf-8?B?WW1CQXVXYjc5ZDZ6OEhxM2c0cjFXb3J2S0R1YXZabWUvZFRibWRoSE9tRnE5?=
 =?utf-8?B?S3ViaXpiYTN0cXRSS2ltMkNuV0xIRGt1QmlFZ2hUa0dyS2EvcytpS2NLNWs1?=
 =?utf-8?B?NWdPbDViS1d5TngzbjFheElWdk1FcmFRRlY3a2d0ZS9TNGlYS21XaTJ5SGxj?=
 =?utf-8?B?UE5TZCs2UllhMlhvbVRIOU9aZkVQOWtWdkRvM204NHVvOTVId1lkdnRLc2sw?=
 =?utf-8?B?YkdSU3N3bDJFeTFkNmJIQk5vUmt3ZjUzQWt1L2xucFBNN2U4S1hKU09WOVdW?=
 =?utf-8?B?K1hnclo3QzJodXlqQUFXbWJOajRNTHhoV2kxdXlJaURtMkxudGVkMzlWTnBX?=
 =?utf-8?B?ejlyR0RteHIzRVJsMUNQMEtGaThLc3p5WmVTTHlVVmd6R1ZFNVZtNkhXd3hs?=
 =?utf-8?B?NXl6aXRWbGZnWGJHWGMvN2FacytYTlVsbVI1blVUMDZZcGVLcXJCa2pSblFi?=
 =?utf-8?B?WWNOdk9LYXdxMEtZc3g0TE1zZFdCakdjbUdiMkRqcmFYUndxeWxTNktBQUcz?=
 =?utf-8?B?dlRZYkVzSUdSS3lUcTFUSjZXbWk2VEljVmZPVHBsM3JUM1BKUUJucGJCSFBa?=
 =?utf-8?B?aTFUNDlianpZWmwwQStYUHJHckRqOEYwZStOdXVoaHRDV3hWaS90Z0MzUFZ1?=
 =?utf-8?B?T3dVdG1HbE9semdKZlhyNzJuL29LcUdBdG9xS1BSa0F5bTF2eStiS1JlaU1P?=
 =?utf-8?B?SjVWVjJaa3Rka3IybUdYZlVqZGhvWmwzdTd2eHZwblhZUm5sd3FTVW01T1Ny?=
 =?utf-8?B?NC9VVnQySnZGN0hudlk5cmVhRHc2enZtZjFzeGk0cnVrWS9ucFVuTXNSYVYy?=
 =?utf-8?B?ckoreEdidi9zMFNiRHBLekpaRVNtZWhUSUkwNXY2NXBGSUd6bTIvbTBZOE1Y?=
 =?utf-8?B?WFk0ck9pbWZQbUJmZ3I5cnR0L1VRdlhBbVFWVEo3MDdFUEl6aUNaSTdRbUtQ?=
 =?utf-8?B?S2JnNFZTRE1rSkVxQlpFNndlaENCd2RKYkYyQnFoK2V5RFkwL1dobk5pTjBR?=
 =?utf-8?B?K1RaY2pjSnNuS1BwK2dERkQwV0MxMUh3SnZZSEdiUDJkWlFqaVprbWJLeGYx?=
 =?utf-8?B?WDhuWnA0Q0cwbGJNZ3V2TFBJelE3aG85NVlCTGdUbGRxVTZtb1hCQmRCUjc5?=
 =?utf-8?B?REdkc2pvd0s5M3ZlOTVrRkJYWGVtK25Od2dzTFpjY1VTamxCcXRUaC9WR1No?=
 =?utf-8?B?OUxhS3BHMnFQakJTekFEVXVHdStTVXVnWVFGdm5pY2QzSU84eEN6QjF6Qnk0?=
 =?utf-8?B?bzh0eFVld3lRdXp3dFJwbUJ5VDVxUHI2ZzdseGpwNFpTVjB2S3R3NnUwYkM5?=
 =?utf-8?B?amo0c1hmQ0NLOHJjT0xpOTNsVWk5MjhPdmwyZGtKbUpHOHpyNHl5NFJuWmFN?=
 =?utf-8?B?QklyTTFvbmJVdERjMDFQak9kTnVObEhaVktEZEdmVU5xbjhZeHdTZ0NEWnd3?=
 =?utf-8?B?TmM0N1BNQ0pMdDVSR2hEK2lJbkNzbW5HYWJWclV4dENDeTRYcnFCMDFVQWVw?=
 =?utf-8?B?eXZoMUNuKzd6bFRFZmdUMEJhQ0lJU0xMRS9hYXk3c0VDTGVlZ05oa0liTjBU?=
 =?utf-8?B?NEZ2SXBTckpmY0RCUEpZOGVUUjZ0bXhuRHNFT1NVSWRyUVhOdmlUTERieGdz?=
 =?utf-8?B?VGVXTzdPUXpNN2NkSUR3OUloTi9teGRZWVpTb0wwaEpjRTRSZU53OWpGVlFC?=
 =?utf-8?B?VzhNN0p6aDF5L2Q3NFVFNml2OG9lcmJ4bndxVm90dmtpTGQ1eVZITVBVYnFl?=
 =?utf-8?B?WENqTzB0T0I5SjVxNkdtU3Z1MW9DYjlaMWw0eE9BM0NORGJEczdXdEc2Ti9G?=
 =?utf-8?B?TEQ0bjVuL2llQlpWS1FkVHloY3publRqbGx3RGdpdUlVU0RsT25pVEt6cXpK?=
 =?utf-8?Q?xuBL4eUssy8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3RTbVZUZGZxcVRXZVdFc1FEN2ViSTA4blBvc08vdUFjc2duNVc1cDBmNGli?=
 =?utf-8?B?RSticVhjOWJIWEZrVzQ4U3VFb0U1VGdYK05tZ2t1ODJsQVZVSnIwc1YyT0c3?=
 =?utf-8?B?b0szZmRrY1VRdkJSbFZ1cEFQLzdtUVErbVo1c0dReTBnd3VyZFRnTW1iaUg0?=
 =?utf-8?B?RjFlR2NxT08vckFYNG04OStoM1I2TmhvaVp1cWJIVHpxc1ROaXBneXBtRm5W?=
 =?utf-8?B?Q2o4YTdmS3pITzJycW1xTHB6WHRWc1N1VDErNDM3U0pXVE9ieVNIZVVjT1gr?=
 =?utf-8?B?b1Q0S29ucDc2ODVjYWh4Y1pHWTNscVBEVnZiMDE2MCtVellxRVVxamRLcm51?=
 =?utf-8?B?bTFLR2JwYzJOOVl1WWpSWUhMNGxaY0x0cktnM3hWUFVXWmk3QXNSUjN2bkpN?=
 =?utf-8?B?QkJKd0tMQkNraGg0bzVqanFNelhhN2llSXlKeDd1Z2c3cEJUTmVFSER2NENp?=
 =?utf-8?B?SDBwVys3YUUya3A2ZTZZTDQ5a3A5YUY3eVdneW5FSzI5TXZtcjkyRi83TVFq?=
 =?utf-8?B?c2x1Zzl3MStORVROd0tEMVg0RnpsWDgxRTVzMlJVTisxSDlzZjVFc1lQYWJm?=
 =?utf-8?B?U0tUY0FrTXlxRGZTNkZRelNhWmRDc2dLdDZscC9nYkN3aUxxQmZVaHBGcjV3?=
 =?utf-8?B?VG1GVUprYUR4SFFiaGFZRm9UbnhFUnArRG56bCtvVnkyaCt6QUdESlhDZXZC?=
 =?utf-8?B?MHp3eUJ1OHdTL1Z0bkVtUmd0MGduUndSdDlUS0RnYUh1L0lTcmdKemZsMzhD?=
 =?utf-8?B?RVQ5THlucE9qdWt4OTRXV0FYekZoTllFZTZIMW5pb3hiUy91aGNVdmxRMnFT?=
 =?utf-8?B?VTNjVVV4cWxMNnpKbkRWTnNuV0dGcjRaOExjOWxuNk82NDlDK205SjBtMGpG?=
 =?utf-8?B?a2tYUUNYajBZcU50ZDFUL0cwVWhOZmEzOVRta3BBUmc2T3BFbW1yOThPSEp3?=
 =?utf-8?B?TnI3RTBLN25kSGxTYWdiS0hIVWxqNjBib1IrODhHd1VwRFBIMTh5Nkt5c09Z?=
 =?utf-8?B?Q1ZSQ3VrYk5VL2VSM3RBYWFlZ3NKVXcxTFk2OE1CVUhPbGJPRWhLOXRXcVR2?=
 =?utf-8?B?cE43clBudzA0MTNHUW5Ob1JsTnlGMkZFdTk1bDJEN3BDVlJ3dUJBV3VGSDln?=
 =?utf-8?B?c3JqejNNUWdWQ0c5YUFXeDgyQUFPNDVHWGp5Z2FHYVlreGpTTmtpUnBmRmhx?=
 =?utf-8?B?Z2JxcFZTcndNYUt4cnJhMlpZN3JWditRaXRXc1NnWGM0OHVMVllTaGcxQ3pW?=
 =?utf-8?B?SjBzZDRmbHNSdk0zQURUejZ3WTNkdFphekk5ZENCSHVvaG12QnJJSnJTd0xj?=
 =?utf-8?B?aFZMQmY5TDVYV3E4L0gxY1N4Szc4MFg2Mmw3UXRKNnlkUW1PbmQvaWxkdEJC?=
 =?utf-8?B?Q2hKRldpeE15TzQrSEk1UktUUkZIaHRwZEVScU5nN1htVFlUajZzc3N1UFRH?=
 =?utf-8?B?Y3hZN00yWFNsbExjMTBiZ3l6QnUyUHpFMzJTUXcvZm1GRVFIc29zZCtvSVFj?=
 =?utf-8?B?Zjd2bmNFTEI4cVNTaURUTktaSDVMeVFwQ3ZNMzVmS2krVXZHOUFiZE5UdVl5?=
 =?utf-8?B?UVlnWVdQdW54c2xvWUJrbS9BRzhuWWVLU1FMNkcvMnJoN3htZ1dXMjRoTVVv?=
 =?utf-8?B?L3JrSlJZdEJGR3dxWUROcTc5eFl3M1VTem9CeFM3NjZFdUNvOENMOUVnSGF4?=
 =?utf-8?B?WFRKT1U4ODBDWHFSLy9hMzh0Z1d1aUU5YThsM1hCSC9PdGFWWG1USXVYdWRw?=
 =?utf-8?B?SU1QN0dLNzlIb1d0dUdyZm5LRjZnR0o4ZlRrT0E4cStmMUFuMjMyRmlSZldU?=
 =?utf-8?B?cEZiZ2ZLLzBqT2EwcHNXdTJKR3ptcWVKQW1SZTJHdDRGeVBVS3V1VVlCNU1R?=
 =?utf-8?B?bmR0UE4zQlVSZWE1T2V4WU9xcGNZRWtBb05CcHhwSWZRN1lGZkE2K3FXREdT?=
 =?utf-8?B?V0dQak9VUWlvSDVncEQ2U2Vlc2ZOTk92ckxta2RIWVFwczdyNG9sQTlUdk9Y?=
 =?utf-8?B?bGJWWWxEYU91dldtekpBdFBPTVJOd0RQV1duV1hMdENWbStKS05FNnFQTVVR?=
 =?utf-8?B?dnpmcTJ0Vmlmb09hdXNraWdMZGZpWXpzU2VsMWZSbk4wOEExc0tvSXVNcEZR?=
 =?utf-8?Q?Znh2ptRdLoZ99v7uiefHDRIel?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2620326d-035a-462c-8317-08dd7bab0748
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 23:21:05.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH7A5FXfsxS0JkxPBmyjTQ+KXAcghYvLGeS/O8LJX4k2hcFTaLILb5a+b5Z9rR1u5lkuZxXvHwmKLyZy0b2sVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938

Hi, James,

This comment was buried in the middle of this huge patch.

To see my previous comment easily, I cut all other irrelevant code.

On 4/11/25 17:18, Fenghua Yu wrote:
> Hi, James,
>
> On 4/11/25 09:42, James Morse wrote:
>> Resctrl is a filesystem interface to hardware that provides cache
>> allocation policy and bandwidth control for groups of tasks or CPUs.
>>
>> To support more than one architecture, resctrl needs to live in /fs/.
>>
>> Move the code that is concerned with the filesystem interface to
>> /fs/resctrl.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>> Changes since *:
>>   * This patch is generated by a script.
>> ---
>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  636 ---
>>   arch/x86/kernel/cpu/resctrl/internal.h        |  380 +-
>>   arch/x86/kernel/cpu/resctrl/monitor.c         |  902 +---
>>   arch/x86/kernel/cpu/resctrl/monitor_trace.h   |   18 +-
>>   arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1080 +---
>>   .../kernel/cpu/resctrl/pseudo_lock_trace.h    |    2 +
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4556 +----------------
>>   fs/resctrl/ctrlmondata.c                      |  660 +++
>>   fs/resctrl/internal.h                         |  442 ++
>>   fs/resctrl/monitor.c                          |  932 ++++
>>   fs/resctrl/monitor_trace.h                    |   33 +
>>   fs/resctrl/pseudo_lock.c                      | 1115 ++++
>>   fs/resctrl/pseudo_lock_trace.h                |   17 +
>>   fs/resctrl/rdtgroup.c                         | 4313 ++++++++++++++++
>>   14 files changed, 7668 insertions(+), 7418 deletions(-)

[SNIP]

>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c 
>> b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 326b3048d728..c7a7f0ae373a 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c 

[SNIP]

>> -static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
>> -                 const char *name, umode_t mode,
>> -                 enum rdt_group_type rtype, struct rdtgroup **r)
>> -{
>> -    struct rdtgroup *prdtgrp, *rdtgrp;
>> -    unsigned long files = 0;
>> -    struct kernfs_node *kn;
>> -    int ret;
>> -
>> -    prdtgrp = rdtgroup_kn_lock_live(parent_kn);
>> -    if (!prdtgrp) {
>> -        ret = -ENODEV;
>> -        goto out_unlock;
>> -    }
>> -
>> -    /*
>> -     * Check that the parent directory for a monitor group is a
>> -     * "mon_groups" directory.

The follow is my previous original comment on the merge conflict and the 
fix:

> Due to the slight difference between here and the upstream commit 
> 45c2e30bbd64 ("x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of 
> kernfs_node::name"), merge conflicts.
>
> You may consider to add the following patch in patch #17 to fix the 
> conflict?
>
>         /*
> -        * Check that the parent directory for a monitor group is a 
> "mon_groups"
> -        * directory.
> +        * Check that the parent directory for a monitor group is a
> +        * "mon_groups" directory.
>          */
>
[SNIP]

Thanks.

-Fenghua

