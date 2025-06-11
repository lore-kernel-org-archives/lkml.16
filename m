Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F664380
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621650; cv=fail; b=YjHc60woIn0+wihoZBHgXiyV6kth2yorPeinb6fwvypvcNpzDuEsh0FciROHnB2OER/mtVGjo21Bd4fg1MHmYL/N3s3PQ8On9EwnN7c3o45NXaNnupeVN4hbPx9IMn9J9D657mwCEKv25oWB2zhXRVjDkFPEsQm4eoqazcVEa/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621650; c=relaxed/simple;
	bh=9fu9hxLeEwj7iN486V4tq7HbMGpwSTgKqG6BPGjDJ0k=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E0HjvW40LCHyKate7tDrL6oImTAX63iA/34RdYRqmfnKokaLb5nDGv1R2dt6L8MdMMAhD7tWQtlK2p15NvqVcL3sR2hyIVKfaHmw9oeUnzsC+63FcOp2/M+NXKP7kWf8NatbXzk4aLOD4vifO2VMXQpfgiFzhSkfNWIS4sA8eOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iCtHnkZZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eVM7Gsa7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iCtHnkZZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eVM7Gsa7"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B1BwPf001340;
	Wed, 11 Jun 2025 06:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=n9Iq15NpePKeQgXF9DcsAAObIyBPhQFi4bW+v5E/hfU=; b=
	iCtHnkZZCGapFl5n+ZF2utqdyFQwC1sGPnU5auwYONfs1dbHACEIwzEqd/GFXwMt
	01sJCFRpZ9aYrQi79QzKI7fSYxScMsn4tWvGhxFDZksEOwWnD1sxOJXEBde+JzK1
	qKn1mj8j7oijPu+ptGkrL3AJiENmZ0Ccsym+CdAvG06F9/GoT0esB9IzPLSrOrxQ
	wnEkMfXPEybbhr79v2w4go2538EA9/ZU1bdrRcAtRUUXFS9wspMWfMGYuiSaE0w8
	7FV+efpG7zqVoA1MRhA77AZGN4WbxB5hze1rI7On6Zt+GApxBnqP8JawzR04vrne
	qASvkQPlV4MVrGcU5YhohQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74wm3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 06:00:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55B59Tch021378;
	Wed, 11 Jun 2025 06:00:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvadktd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 06:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCyoWxN64e399nG71xrE5Ag+0KuriLhyqzJYAT4WiKP3iioNR35JMsgAVKj5UhceMXL90KZhHRfDg6aAzQEURwjM8S8vWsVmDeMJTbAINJyzR0rDsUU5DiqmwFM6/3pbdL3cd18ivF5FIkNYnHMhsrYijv/gAV0SC5IF04PU77ioWhf31AamcED3YDmMQs3pY58I8l1B+1m3tATl840qlXiWcyxFTblVtmVbtoKz5W+h3IdZDagilxDD6vp8BobBzHf20Q37klVcrZg0cxFXaFp4RF2mIwZIu/kvFqrsg4d/84EJmi6o2LmwcldXHh2NBsOIf1PCBuaUK2ytLm6eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9Iq15NpePKeQgXF9DcsAAObIyBPhQFi4bW+v5E/hfU=;
 b=YCX3Dgy2ZETOJEs1BvZIKMMRGhULaL/vp+1ciRBa7jk5/ZVQptl/ZqU6oTo9Q0F4ihz2dtX8RGboB/MApYSt3huw5yw93H1dQcK0+jFoC/pesIWESITkXBYOh8nt/Vuuz9Al6oGeRMZicKT2a79/Q0y5rZlcn+s4Xg7PMPbBja9zYQHTV5FJ247b3j+06Zi8FnOgVYnJ5VLvI8xOz1HWqlk3pUkgd+HnG8J5BIakKlq9uY9ehOqARE8q6LVVkKsJNK7kfyuldUKb3RiSwGnILDa2R/8XzUdIjkctUmnKgRJzDqvPUnPJeysFpjSY+hGwJcFdVCb8oWihC+N3d4PKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9Iq15NpePKeQgXF9DcsAAObIyBPhQFi4bW+v5E/hfU=;
 b=eVM7Gsa70G8YV3HOtCybIT9bdwjkpdxQvwxy8uDIVd40nWYYBVERemKC90KK4d7XODtDcpebx8yctHcR/fjnQM1EXuTfmIKFTK65f9Bwws4uh5GeHkg33XnYW96sf3o8SNUMjB9iUB0SK61ncInmyT8rgKTZa0Ypd4yc0nSFJPI=
Received: from SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18)
 by MN2PR10MB4336.namprd10.prod.outlook.com (2603:10b6:208:15f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 06:00:35 +0000
Received: from SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084]) by SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084%7]) with mapi id 15.20.8813.018; Wed, 11 Jun 2025
 06:00:35 +0000
Message-ID: <7e803ed0-60ac-4d5e-a039-904c3fba8e80@oracle.com>
Date: Wed, 11 Jun 2025 08:00:32 +0200
User-Agent: Mozilla Thunderbird
Cc: alexandre.chartre@oracle.com, linux-kernel@vger.kernel.org,
        mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 00/13] objtool: Function validation tracing
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <vx6cxar2ium7zsqqzf57lmn2nhwemi2kmeu2kal6s4mazj3tp3@zdymccnsispv>
 <d52b6b3a-dd18-4c8e-b7f6-5ac0879d959a@oracle.com>
 <c0153249-5643-492f-ab2f-70dcafcfdd0c@oracle.com>
 <iutvcrog7abyz2ski5fhcfzikc54b2gwodsds2gmovutahapg4@5rk4o4b7eajz>
Content-Language: en-US
From: Alexandre Chartre <alexandre.chartre@oracle.com>
Autocrypt: addr=alexandre.chartre@oracle.com; keydata=
 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
 swLliy6PdpST
In-Reply-To: <iutvcrog7abyz2ski5fhcfzikc54b2gwodsds2gmovutahapg4@5rk4o4b7eajz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::9) To SN4PR10MB5622.namprd10.prod.outlook.com
 (2603:10b6:806:209::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5622:EE_|MN2PR10MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: 638ba2a5-96d8-4c44-a5b1-08dda8ad4839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzN3dWNhNmN4dGRTdkZhNzlWaXBsVS9yVjZXQ25sV01DM1N4cFpDT3ZPdm1T?=
 =?utf-8?B?VUUzcEd4dTRKM3VFTEJ2ejdPS2NyWXZIeGN2dzdGd21Uam1vK0VXYWN5TUhE?=
 =?utf-8?B?bHFMdDZ6dCs2YVJ0RzVrWGFFOCtPa1RrM2VITzd5eUhxQy9SaFYyL2lDbmVW?=
 =?utf-8?B?N2trSDYrQ3A4Vmh5N3ZiVk1iaHkxT0d0QjU4d05VSkhsQkw0cUhJVjdYVGc5?=
 =?utf-8?B?NVEvSXVmWmVpWDJyc2V0WGVVRU0yS0gxY3FUd3RxZGJRV0NKcDFkNXVjK28w?=
 =?utf-8?B?UUxZT0pVZG5MN080bW1RcVdhMnp3aUVOcVhTU2hvanpVZlZER2I2VlNVTXJF?=
 =?utf-8?B?N1lvODgzblg3K1FUZTYvQWJRUEhaeHJoR1U2a1JkdzFnNjFheHdYa01KRjBv?=
 =?utf-8?B?bDgvdmYyS09HTG1DS2tsTzdzL1RjWVVXc1RUN21TKytVeHZkanJFQW9pVzd5?=
 =?utf-8?B?aWFBSzRYK1BjNVZxVmNHb0dFbnA0cHpnTmVLVVFHUEt3QkdFUlpLR2JEOHNM?=
 =?utf-8?B?dnhNejc4T0t0NWIrd0JxeWdzeUcwZjI1S2lPMmQrTVdra1JHQ2Fyd1dnL3Mr?=
 =?utf-8?B?S05vZzhSODRGTXRxUTNaMUs2TmtTa0wzNTlreXFNU09TTURaTjRtV1FVdDEz?=
 =?utf-8?B?QmN0dEMweXZHbWIxY3pUZ1lqOXRtTkpndkdsNjJ1bVMwRm1Kc2s4VjhoaCtr?=
 =?utf-8?B?cWs5YkJHekxId3orMmI4OS9ia3EzSFU3a0RTdzVIeTJUTzh4RG45clJlcGVl?=
 =?utf-8?B?Q0xSbXdTL2k1TERqOEZnQzZEOENYRlBMY2IrZjZjeG8vS0JPSzU5UTdNTSth?=
 =?utf-8?B?Y2FaNmJ0dm9sK0M2U0g1TlEydmYxWWZzTFZQT0hwU0JleG8rMGZ4R3AvVVhN?=
 =?utf-8?B?RkVpMG5OeUpvMzVqcWRFaHowRXpUZjNMdjA3WFpiMU05TmE3bUxhaGhBRlJk?=
 =?utf-8?B?Z0Q2UElDZjZoK0UwZ1Urd3dFTjBVTVpjL3F2dldrM2dXdmsvZ2xPa0hXcmYy?=
 =?utf-8?B?YWdHVis1UWJtUmgvUlpIdXY3WFd5a1R0NmE1cjlCdVRkamo4Ykk0ajQwcHpt?=
 =?utf-8?B?K1FJaktRZHErT2d3ME1nUk5KSmFUbCtuRlpqUEhJK2pKUG93WGoyc0NTcGVx?=
 =?utf-8?B?SlRtZjZKbjAwa3NhQVJyT2N1dzFRUkFrM0Zna3J0aXlDRDFwM2J0N09EYmFT?=
 =?utf-8?B?L2dsZ1ZJdVNHSmM3S1M1YUpIOHl3NnZHRHVQNEprUTRncU5xZXBnY08zSmRW?=
 =?utf-8?B?alEzZ01JWm1IVWVhL0gwYnlRWWxJNlFsTHJ2bHpNL2V5Sk1xWTlxdEZTalpt?=
 =?utf-8?B?SmVOTVoxTVdCL2QwWDcwUUhKRXBkUnUyTDlVaFZHRXdOVi9wdGhJTTVjUjhu?=
 =?utf-8?B?VWxtRjZUY1loc2h5M3Bhd3U4c25LaHFTN3RpRlQ5b0pKZWFZdGthd3BhTS8x?=
 =?utf-8?B?cEVkUTJURzh3UExPRXBqZllPNnFERzhsQzFoWENUYjRrVGRBOUFMQ01oR2dO?=
 =?utf-8?B?cyt5RWhaanhWY243QTVra1k4WFZDMGV5V2lWTkhoQTZGM1UrekdyOWxaRFFW?=
 =?utf-8?B?Q1hzdDZyUnB4NGpLU1NjdGdVYTBDNXFlSHZsTjByS29MVEhSRHNGeHJ5WDdD?=
 =?utf-8?B?cXJlUlF3QzQ4c0pIQ3NCL2E3YkpFR0RyZ2VQeXlpcGVnMDhTY1RUTEw2emM4?=
 =?utf-8?B?Sm52ZkpNd0VmNVgwcnVXZnI0Y21UUEFpYUpjWnJXT29XWjZQRFJwY3lYbGsw?=
 =?utf-8?B?eGxwQUVlS1NRT21IWnZybElyVFVrcThQSE96RUdmWE9LUnZNOVlUV3FSckVS?=
 =?utf-8?B?T1BnR3I5eGI3aUZ3WldPZWx0SWc4S0JyWXA5OC9UU2ZHYnBiblZLcXFhVmM5?=
 =?utf-8?B?Nm1RbWFGV2Yra094eFJIYzA3TDJlYlUwelBBQmNvVGRiSThCRVF3Z1h1MmhC?=
 =?utf-8?Q?77M0WueY2TQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5622.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDA3c3BmY2hVYU9sM1h6dDR0alUwRVF2UThXR2tiNEsxVnVjVm54aUdYSktC?=
 =?utf-8?B?UnUyR2JtazBSeXJVRklLVDJ5ZmRjZGp2Nm9ibSthTVA0Z0RvZkdaVE5lWWs4?=
 =?utf-8?B?TEJReEU5SHcvRUswZEUwOEpYUW1UV2l0UEVvTm1PU3dRaFM3N2MxUG5qK21O?=
 =?utf-8?B?eWtDZ0lxby9NWjJEbXlOK1NvRVBUU2hCRU9SSGxhcHNnZS9TcGpDUzJEREkw?=
 =?utf-8?B?Zms2bjNLTHAxRy9xMEdOR0VISFNhbEV2SWt0UzdoL2MzcVV6YW9JbWJyOEpO?=
 =?utf-8?B?bUR2bGlaMFhUUGk4UFVkVFlEWWlGaUFkczlNN2tHbllUQ2puVXRhSTJhcDBR?=
 =?utf-8?B?Mm1udGRLbnZrcUZZYit1cUNOcTVRVW9MZTFPcWVmRXFCV0Z5dTkzdjI1Qzhu?=
 =?utf-8?B?NG10SGtBMUJMdkp3SmFoS2RlOENtMXZOK2dFQXpteE9hWFlyVyt2QW9KWUxF?=
 =?utf-8?B?ZkswUm5IM0xYaUZlMDNHZmxVeUYzNVl2MzJIV2FsN25ZOGk0UU5weHdWV3c5?=
 =?utf-8?B?R1ltcXpkQVcyN09ya2RNeW9pVU04UGZsWTRkZTZ0Q0dIbE9OZGwxUmI4aTdq?=
 =?utf-8?B?QjhwNS9KR2Z1Z0lwUXVOVDZPMkt2SEVrVWt3SmliaEJQS2lVZzdqMUI3ZE9k?=
 =?utf-8?B?cmtrZWtpL2pZSjYyRkZIdHFNVXdBVGttbklHUjVISGNvK1c5LzJ2N0Uyb2R6?=
 =?utf-8?B?YWFtRHFMNGQyeGh4NmpFTlJqb25nTFhXZWJDYlRmTnpUTzMzdWVpRXJDcStM?=
 =?utf-8?B?OEcwSVFwUjNwZ2Jybk1uOWtWZ2JXVTQ4WHcwcmoza2hKcmxNa1VLMXBzWmpx?=
 =?utf-8?B?VCtIZXZITUp0dGxvWVVIa1czQysvYktkenJHRjE2TTZuVVFUcGJSNUNsQzNY?=
 =?utf-8?B?WVJOQTVKNzgxcUxTR285eWxSVEN2YngwRjZqWjdlN3FZVDN5YVRHZmM3MndH?=
 =?utf-8?B?TmRzSkt3ZDBXTzk1VUNMRitZdE9HQ2plMzluT3RkbC96STBPYmtySXlZbStO?=
 =?utf-8?B?SHJYaWpZeER0U1EzUUo3ZkFJNkJQRElyOUlxdnc0Um13VEk5Rk1WNWtMRXBx?=
 =?utf-8?B?RnVjZWMwemJNcUZ5cEo4VTJYbmNpQmc0RTNtODZPT3o0bEE3ZnVlbURNNTZJ?=
 =?utf-8?B?b0NRT2NTN3N2K1VWdklWUWJacmxKOTYva1RFZ3JaMmUxdkVrNlVLL1JXUlFI?=
 =?utf-8?B?c1FjUFNYMzlZQUp3QkxOOG1JOW1JSDJHeGZYOUUxRkRlZURLaGdjem5yQkd1?=
 =?utf-8?B?M2V2dXhoRm9Da1ZGWitoU3JaalU2Qy9vQ3dsb2NMcFZ1ME40aWdjQnV4RXZ1?=
 =?utf-8?B?TlRHR0dMOExzS1FpZGtheFEvZ3l6cmFBTWh1ODZGYTlkOGM5L0kxR1dVSFU3?=
 =?utf-8?B?b2IvNTlYWmQ0ZCs1bXE2aHBxd2NrSHgwZlByc1d2TnM1YVAxVG93WmpRcDNh?=
 =?utf-8?B?RVJBTHJVRFFaNHFFdk5GaWdUUmx6ajQzenJveDB6RHB2clZoTnRyNFZ2czhZ?=
 =?utf-8?B?eDE0WjhvemllWmdoOFB0MkZHUUs0d04wcnZ0aFRaaE12Q09rNFRnaGFCRHZ5?=
 =?utf-8?B?dU9MWnZBSzdKenlJajFuQkNZQkZwL0Y4UzgvY3p0VXdhQkZPVGN2SXdWc1hh?=
 =?utf-8?B?THBIUklyU2QxSzFleTNDN1h4MVZTUFh0Zk42RDJkWmFsTG0wejhIb2M1NVhB?=
 =?utf-8?B?aUlkYkhVZHYzeFB1YVA3Q1Qwc1NWZm1haUpwNE1tbmhrQkxWeGJPR1ZYWjF3?=
 =?utf-8?B?T0JxWEdWSGJWN1VUZkNmeGNnaGE1RTNiMDg0cGRyS2lZNzFQWGprOHVXc0tq?=
 =?utf-8?B?WjZyeWMxRWh4VnUzRkdoRkQrb0VEMHE0WDlTRTZGN3hRYzBLdG9uRjI3Ykly?=
 =?utf-8?B?M2RJaTdMdFkrK0l6Z3BkNG40Z2UrZTErMzlVYWwwTG9WVHdpYnMzNlN6bi9u?=
 =?utf-8?B?eXErTEJCVXN6QXFQTVJXWTBzUXA1VGpVUVdLV1k4Ujh5aWtnTFh5SEtnd1Mv?=
 =?utf-8?B?YUVqa3NRMEdhdmhnY1lMTlVkQ1BINjJhQndDVCt2NXM4WU40aWo4bmZlR3o4?=
 =?utf-8?B?MlE1QW9wRFhqR2M4N2ZDb0p3Qjcxdi90OWFyUzdaV2M2K0ZyQmROakRrV1pH?=
 =?utf-8?B?eDkxVXEwMkNiemsvNnlzaFo4RmNGaHJNRjdjRnQxb3ArTjlydGcyamFGQ0JD?=
 =?utf-8?B?QURwcXNzVURYc3AySHI0SWI4bWM4RXlHYWFLOXhpdWdkekRWUnNLNVRoTzJl?=
 =?utf-8?B?emhNam1RNGlKMEtETlRZREdrY0FnPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yo+DpbzdGX0tJELsoKgBWhXmivpPajRMUwvCMID34DoVej/ZIcAry03VgIDxcBEg8yyddjqyuP8R4Kpgj/zA3T0mJqYiLE4rFSKeRKcp16gSfXzIXDVN6Iac9pI9WWdLB9xBrHQvz/jHycl51tZNAB1ybPWql+wS8/rSI3lGzoYqgyfZXFthVqrUWz3YC1mIG9vi+uHxMkRk7qKKdaJFFUfiINbnIi2mCv+AKAM15JTiPiKyIr3Mb0Foy1wgi+UdismYz4CPm26YLC+HJIIWoTVoYq7HeuZOQepXfLKfjclnQZezA5Vqkogk50LbfAJdPmZ3w9WvqPtVjX+ExayOcXc++NxqZgjyNdbNy0z9dl6zK/ku3pEkTQZHjB9w5HWEiJULeuHNK5apTw3ZsqIWDq89HQZvqxeK4sDLK+v4Yu3m1hiMrB7mnj37KbntjeyziY2PH/cn4LPpfjToFi1yyxDaxDTF6eYIx7sZdS8E5AG0AWZbDf3FrTPL0d/BqyEkMUPy2pKQ8K48xIwNaUXi2VtTL8S/NFJLIFBqC6+p0y5N7oLMr8HvpJ5GD744C7W8OJXYJ2KXJaVYxf4xp8AWF87RgmuUrrpIw6ClpW6wbWI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638ba2a5-96d8-4c44-a5b1-08dda8ad4839
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5622.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 06:00:35.2845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhuQKJs0ntMZDbCk2Gr49AlD8bGYIicuLx+ovYGDkAMlGjs9hQkmsIlo5SVLHO4LVJHOrpO6YhbVTQTAst7VtIwqgimHArGGUNc6x2xjNpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506110051
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=68491b88 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=OXLXoUqizM1RkHpBMikA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: HfhJO3iarD1BFPmmnmu2RjUfyxXROYZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1MSBTYWx0ZWRfX1d7HYL5aP4T1 cWsuRvQ+hxrIhOlCDxN+aW4C75AqcPTPIF1nV+cjGCb5k25KfVaxZ5OgXgjQ9sOByQJJIH36jIf 3G7A70Yizw9h6XalgY//9k8n8RSptLmxt+zovv6dsx8bGN0wUoxBFCMojUrEQXW8Jg1eKsc6n+O
 2KiZP2PVCznlXZPC89IjuWiuiuqzaTrgblOGFhnNPR8o+TijCVyTZJaqu+he/5+zyYn4Fz2Izfr CwkUTXBWXAb3Mpmhi36TQh2bsDIeF3D6DuI35RrdmPUofh3hA6GVKPWUeWA3DQR7DIL5YTAnMZ5 urBq05SBwqySDfFanRsEvpUO5Kr6nS97+3rRdKZbFo8kE/bNsrLFhnngpO18hsKD64it6C5sepN
 F1ZdSNiIcr460T3IlSiA4AaVh/AnJhH2/RYFakeVTDQAnPFPZA/o1yO0gdUev+4UTU6PHaOw
X-Proofpoint-GUID: HfhJO3iarD1BFPmmnmu2RjUfyxXROYZK


On 6/10/25 23:05, Josh Poimboeuf wrote:
> On Tue, Jun 10, 2025 at 03:00:50PM +0200, Alexandre Chartre wrote:
>> Here is the patch to handle both old and new binutils versions:
>>
>> 8<------------------------------------------------------------------->8
>> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
>> index 00350fc7c662..91a2858fea14 100644
>> --- a/tools/objtool/Makefile
>> +++ b/tools/objtool/Makefile
>> @@ -7,6 +7,11 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
>>   srctree := $(patsubst %/,%,$(dir $(srctree)))
>>   endif
>> +FEATURE_USER = .objtool
>> +FEATURE_TESTS = disassembler-init-styled
>> +FEATURE_DISPLAY = disassembler-init-styled
>> +include $(srctree)/tools/build/Makefile.feature
> 
> Thanks, that worked.
> 
> That Makefile.feature thing is nice (except it prints an annoying
> newline on every build after the first one).
> 
> Can we also use that to determine if binutils-devel (or binutils-dev or
> whatever) is installed, and then make the build of disas.c optional?

This would probably require a new feature test, I will look at it.

> Then if somebody tries to use '--trace', it could tell them to install
> the binutils development package and rebuild objtool.  That way we don't
> disrupt everybody's kernel build for a feature they probably won't use.
> 
> That would also mean disas_warned_funcs() would be disabled on missing
> binutils-devel.  But I think that's probably fine.  In fact that will
> now have less reason for existing now that we have this tracing.  Maybe
> we won't need it at all.
> 

We can also fall back to using objdump if binutils-devel is not there.

And thanks for all the other comments, I will address them and resubmit. I am
also adding the "disas" option.

alex.

