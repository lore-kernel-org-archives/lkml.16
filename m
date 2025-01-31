Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449BE1581EE
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322199; cv=fail; b=Ohi2NSqRdx53EyTi+n41TiYzTIRttcvUu/UUqnXc4AgIJPpWbYBt9haclN6gW+Na7h+/1W7mWX4AWnekOAMGnBfxfG6mNpPVQpmKXOqNbq1i/fIqlrgTf9ghbdXNCXrt8h49ZxiTyhtyEnT4UdIqmIOwbgocSe/ewddP8jgtzt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322199; c=relaxed/simple;
	bh=MDHgmz1uuSZzdoqsSDWP2RnM7i2SS5CI198TC2l3S7I=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GiUgotPcOpku607JXlPHT6uaUlMtkjDKbDeOuvHRGshw1RvTNUQpmB3+sk+/krw2xl68QgyYTy/NhDs7u8Rs0HhJ+BSZdpKkP3zZo4zX2/kkVprfGDPEuREkcbUHTb8fQzKdqji5wu9o3K0x6SUHogxtHmPZ1Hl0NrM2Pvacx70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oZyz6JMp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vMs8A/ib; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oZyz6JMp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vMs8A/ib"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V96PxY015858;
	Fri, 31 Jan 2025 11:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=CjfVp7Lvf7lkVujltbJ5nmbZ+Ti6wwLAmtS24op5HRs=; b=
	oZyz6JMpQ2TgrlCWyeqdDTiUxbEHnYpFIJHlNq2S3750bqk6oZICPphQqkhkFX6D
	rW++y+4yMRt2XjSIphspsGgn7YPkQifvYjBLFtn1X+ubK7cfYwpqxRsMzWbkGT6S
	SW6Dc5N8EI7EBwgSdHIXUI3ZMjbSrlD3SS0XZq4Uzpf5hYcowwfeRzAUyQkPyg/S
	OLqgkS8eluGQzZkOgpl150rzMTXNbpsT1xTlWpk2gyuMYqGuEvoP1RMkw/6jFAG+
	MZJW+SHDEofdAH7vcI0KKGyIzF27nRo0hUQn2HAkoD/YDpXktY2rSAuUlLVR8BJ0
	K36tlT8XDKYmjtMWBjUyzA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gukb870y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 11:16:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VAXnEn032181;
	Fri, 31 Jan 2025 11:16:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gf93tcek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 11:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIDj1w75LZM2c8tMwIqXtOkegeUKh9Uj174eOMXNpz+tadlhZNL6sKt2YisbwuUNnlfvEVXRYSyakb3AtZU9XdCuyZmcUKe4yPHIbLR9WeZBcbEktmZeqTXX2RhlPZ0TWN+Nqj+EZCS/6F4209045x20ptefz0Pwpkmgf2KYktyVpAdvPdXdBpMxZRvlLAB7cQua0oUWoaNRUtr1uOKznwdEoQyoE+FCZMlKMBpqIgTAflQZsR3YrEMxFc9aXJdl32dNGU52LQnlbr/lyS6NfuOzDl6qZySoDxgKKKhVxF3HjDWJAi9XMgG7RKkglSiYgx7sJmPau3AuUze7957V3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjfVp7Lvf7lkVujltbJ5nmbZ+Ti6wwLAmtS24op5HRs=;
 b=tbZ/MGlq2EYpztbWiweSs1PXTs6F4hwpcMYSYHgqcr+Yb7tmcA3Dy7GA7L1ecspM6DdcGT5e5ScYFTjNuvc4oHXL01SReqPpQqBucVQ629RA18wYpvaifwCaP3mcd+FXGtbSSZRHQaGKpYP/XNUfjgkKXiI6QNZsrDq/BOmcST/LeqOeYrtuvpZm0pTd9Xv5Eq9T2g+6ucoAa4tAgKvXQGM5O46ydrPoKwTc6sMIz38VD5nnV6dSPTSmgLUT/jRSo79soqjWNSupVgF1qNo0a/DhnFs9OFYUKpRoKyUlyiGPA1m0Aw/XE5MrNMJi0zI2qrSKlslqiWG3CHCxDNB/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjfVp7Lvf7lkVujltbJ5nmbZ+Ti6wwLAmtS24op5HRs=;
 b=vMs8A/ibKutQKcLVMCmgwH6qrWGN3C/aHe42bby6HSUqmYgMy/q/RITHAnX5wcN051fF85dDFR8kisDjsIgzwVJItI+QdOgw+j27UptPAU34C9zQcpFpy2k7DsXWBZekbdNjl5OCYmamW7ezc2hER93yCDM4zG+oQcXVDn8DFwc=
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by DS0PR10MB7173.namprd10.prod.outlook.com (2603:10b6:8:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 11:16:29 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::485e:729e:c0a4:e562]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::485e:729e:c0a4:e562%7]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 11:16:29 +0000
Message-ID: <08fd6f46-1e85-4642-b2ca-17013cb7a9c9@oracle.com>
Date: Fri, 31 Jan 2025 22:16:17 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] workqueue: introduce
 queue_delayed_work_on_offline_safe.
From: imran.f.khan@oracle.com
To: Tejun Heo <tj@kernel.org>
Cc: jiangshanlai@gmail.com, linux-kernel@vger.kernel.org
References: <20250113043540.2396426-1-imran.f.khan@oracle.com>
 <Z4VZsFBn13nBnGjb@slm.duckdns.org>
 <eab73ac2-d9eb-4ac7-9e0f-9a02b81a31bb@oracle.com>
 <8715d5cf-1f63-4c57-b855-8abae8debaa2@oracle.com>
Content-Language: en-US
In-Reply-To: <8715d5cf-1f63-4c57-b855-8abae8debaa2@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::15) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4468:EE_|DS0PR10MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 799417eb-0fda-42bd-4795-08dd41e8b5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGFBOUZkNkx1TmRHdTN1K2hoZUFZV0EvUm9peGlEbjBUSHVIYVZ0ZFkwVWtS?=
 =?utf-8?B?THRzd3JpQzFmSlRVYVhnS2ZJNFU1Y2xPNWZWU256Wmw5THRTbU9OTVlqUXpW?=
 =?utf-8?B?MkVlaG9mUEpqN2hQSDBBdGxXTUxZUTB5R0szK1ZNV2ZIcktPYllNMHRoajhP?=
 =?utf-8?B?aWo2YVU1eVA4NU94NEg3andIUU5ReDRtZFlJckZGaUlFWFVSUlA3Q3BQQTNR?=
 =?utf-8?B?QUNEb0tnVXJsUHJEa0xsc1FaY3poL2NQRDM3eURleUN0d2R0NnN5bnFteWxT?=
 =?utf-8?B?dWd2UjBMMUl0Z0pFL1puY3NoZys2ZHI4WXBwT3RJanZtaGwyR00xWTZBNDlP?=
 =?utf-8?B?TDVEb2lWSUJUZDR1YnQvb0lGYVRpaEV2dkNBc0xrV0daaktoUXZ5ME91RDN2?=
 =?utf-8?B?KzdQdGRlY25PZC9CdjNzclhwYkNuR3lHRzhLYkNUcUFBYkhHWWhmQXBib3Fn?=
 =?utf-8?B?VDByYm4vUFovN3pmMVNCNDZRY2tHZDBZSE1CbWZWM1RJN1I5MFI4Nm9RRFhK?=
 =?utf-8?B?cWNsdkxMUEU5Tmt2OXozN1l5THZ4YVdHMnJNMktRWVZMWmp4SC9lQ0xUUnRG?=
 =?utf-8?B?MWpRczd6Y0VmK1VLZUpJMjNvVzJDSW9JTDhNbDdSUmZJY0NrbnFXRG9WZ0FV?=
 =?utf-8?B?TCtxOWh1S3NmYjZYd1AwQU5PczZ2eXk0VCtGMGF1UmNzZXlnNDNUMDhmYm1Y?=
 =?utf-8?B?NFNNNk9ydTl1ZE8zOTdyR3NFZkVPbzl2U0lCZU9kQUxvcG9NTkQyWWJ1L1ZM?=
 =?utf-8?B?Z3RybE5WenhmcW1DMVNicTVOdjcvWThCTUdZZDBGenZnZjg5Z0NIVmlzdTJU?=
 =?utf-8?B?enQ3NmdUMDFZR1EvaldXUWtJVEw3ZEo4cFpJK0M4RXFBdEdjSTF3YmNxSlVy?=
 =?utf-8?B?T2FsTURuR2R4WStFQnhIYnlXdmtQcDFPNU54YXJ0Tm51MURFMnV2ZzFIYWtZ?=
 =?utf-8?B?UUIxRTRjZ0xtcWViUFlnTkJmbHJ5Q2xqS0IxWW1RbmgwWWFqWFczdGhBemdm?=
 =?utf-8?B?RG9ndEZsUGkrdEVaU2FicGhXcG1KclBPakovYUZKT21uZ1h5UWtnT0k5OUFL?=
 =?utf-8?B?WHlGaXJiTHZ3R1k0Q0FZeVhkdDNWS0JDK0xoRDNteXdwZFRkN0l1alE1TGVM?=
 =?utf-8?B?TDhJczRld2pZd25uOXpVUXNsbURjNGF2RitUODZZZTQ3YXJZZ0NYT0Z3UGxJ?=
 =?utf-8?B?NnBxU2s0bVZtcmcwbjlUZVdWckpYUUZ5QXlnejFyNFdQY2xabERYK2xhaEVI?=
 =?utf-8?B?a0VUdE5nN0hxVTVrYlh3NkNLTXY5aWg1aEEweGZ6OFpjeG1mT1A5bUlkYmFK?=
 =?utf-8?B?eDA3Wi9GVUtueHpyZ0d3RWNCd3pLem15Y3FLWkx0RnlWd3VrL3pZVFZVZmQz?=
 =?utf-8?B?SzUzUElySDJYeUx4aGZ4Sko5TVpnNEtUaEpjOWJjVDA0MzBPY3dtb3RNZncz?=
 =?utf-8?B?Z29wOE56d3ozcWJGV1ZORFFSUmZzd2FKMFlQNUxDK21xSW5XdUwrQVM1Tk80?=
 =?utf-8?B?clNMNmM3TzZFalh4L1B5VjQrOFZYUXVoRnppYW9ibWtCN2lRcjNXb00wNms2?=
 =?utf-8?B?VVQwOEZCOUZLRElISm1SNmgydFo4eWl3VzZnMG9JY2JrRzFldU4xUzBMSUg3?=
 =?utf-8?B?QkRzQkx0QWxqUTVMM0Y0dlpSTGd2ZERHaDc1ejM4T3pvbmlQSHcyQThQb1Bs?=
 =?utf-8?B?b2tPcU1tT0IxQVczS1hWRGxEREMxcWV4UXgxeTFpUEtLU2cyRUlhcElmMDlU?=
 =?utf-8?B?Uis4d29EbWpiNkJzSlV2ZFU1YlFPZnViYmtiT3kzbFVNdWRxMEI4OXJtVWpH?=
 =?utf-8?B?L3lwOFA3T0RKbUNkVmtMN1M0V0ppVXkwdFlUUVJnYk03QVlyWlRiWGNFVVBi?=
 =?utf-8?Q?DEc1/TTnl+qyr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4468.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVN2QnV3c3dPOXlhZk5TQ3dGY3c3bHRRMU5zMGU5UWZ4NnhDWUErZ3d0bGdX?=
 =?utf-8?B?bHFqUEVyd0VicmtKeWF2bjdZSC9BdEFuK2hGMHlyVkZEY0NzUFV0b21GblZW?=
 =?utf-8?B?S0RFQjlJOTErUHEzUi9leTNoMDh4eUphQ2cxWXFBWCtZdTExTWJROGpqaGZn?=
 =?utf-8?B?VEdISnBxNlN6MEEvM1hqamRwUmxkYWRqd1FLUkJtcktMU042RlRDZnpRK3V4?=
 =?utf-8?B?SllEYmdRSUZGZTJuMEttc3NPS0g5RzgvcWRxdVBTSnNteklkbWc5V25CdGN6?=
 =?utf-8?B?QmpnYzRodUlrNElkY3grcmhGSmJZa01qNWxzZndjYjRhVmtsU0RndGNsazdK?=
 =?utf-8?B?UThrNUYyOU8wZ1JXYWxOSDlrK3VUU3NUdmVERm1GNVJjak5ZUnVIRXFyTGhR?=
 =?utf-8?B?VzloY2dIS2RrUkxKeDZ0S3FVRGdLY0lOQXV5QXYrT3pqUFVndElpd09PQ0dx?=
 =?utf-8?B?WlFQaGZ6eWZOWndLWDcrL25heUNGN2FsUjQxNGJ1L3lCWmdERjBKNzh3SUpR?=
 =?utf-8?B?L2VTRHVzQ3dHQVhZaXE5ZlMrSnp6a2VpSWtzNGkrWit4QlBOaTgvbVZFVHEy?=
 =?utf-8?B?MkNVc2tXcU1EVmthWVV5dmlaS1NESU9Wd0UxUTd0SndwVnNOKzBON01sQ3F3?=
 =?utf-8?B?blZXZUxKRmx1ZE12ekZlY2RHVjFtWkVtcDJzbFRWaGdxRXNtdHBRczBzVkhx?=
 =?utf-8?B?TkJVRkZ5UXhKNmtSQ2NITENRaTNuYnVNb0JVdm1mZjcvenIzSWJ4dW5LakRh?=
 =?utf-8?B?UnJDV2VrYWllMmtjV2s3WTh6di9UNkxXVnZFeVkxc3pFYmE1cVJIMG9ocE9l?=
 =?utf-8?B?dkEyaHdJU0FQWHF1UjlHT0FYRTVZV0ZqQjlYZXZ5aG9jb2NsTDU0UU93d0tY?=
 =?utf-8?B?OWNtOU1xbHpRNnZsaFZwdm96cWhRdWxyOWREOWhqUGF4NldLcnNLT0ZpTVVp?=
 =?utf-8?B?K2JRQWpBNGJuMTl5WHdKWVA3amc1T3MreDVHRWh1QjRuMFY3Tm4xN0J6RDBl?=
 =?utf-8?B?NUw2ZVpYV2dONy9QZ0dibXdWS3pMOXk1UzQ3dE1PNElheXFMdmRhTlo2bDR1?=
 =?utf-8?B?T0YyTkhJY3pkb2JMalZ4bjN0bnBuMTRZa1NUWTRHUGNJVlJJbDhaK1R6SEJp?=
 =?utf-8?B?bUcvdmdBYjdDTGVIMmVTRnZFSzdTUWlqRGlhOWJ5YkxTc1hFbzRPV1kzaXZE?=
 =?utf-8?B?UUZnWFZsaXBnRllFNVZVSFBMbFlKOTNkYmRmS3FYS2s5VGVrOW4zeGZ6d0lo?=
 =?utf-8?B?L0J4ZWRmN2NiaEF5Tk95NHRlNUtDeTM4MmEybkxVUWdnckFnMUZ5N1pwU2U4?=
 =?utf-8?B?eU5RbS8rQnduU2JyaVY1NEZEbjdOdk5ZbmZKcHA1SytEdmJjMDMxZjI0NDNF?=
 =?utf-8?B?YjRRWHpQZzdGSTN0YjBwWDVSdHkveGRFbStIRCtCOWVJc1RqS0JaNlcwVnVr?=
 =?utf-8?B?Uzhjd0NycHRSeXVDM1FRWUZ3akhVTFdJczZCUXN1aHk2RWFxYWllZ2FIS3Ur?=
 =?utf-8?B?UGNDYjNxaFRwNFBhN0ZZeXc4eVM0cjFSUTFXNStlUHY0OVpkKzh5cHE2RGdn?=
 =?utf-8?B?OURTejh6TkVLbnJXMDRCU21ZZlhzcW5rWVlmenlLbWhDSjI2Yk1NM3hLdGVC?=
 =?utf-8?B?Sm5zSmhUdWdyYWlXYURGbWM0TVk4cnF5Qk9SeW5sbXdnbEdaN3JsUmJhS1lU?=
 =?utf-8?B?ZW9UMVFteThUaGV1clQ1d3pDNUVzc0xPN3hvN2lINm80NWVOdGc4TTlNL0ZB?=
 =?utf-8?B?Ti9wZnkzR0FCR1RqdklYS3lPRWYrRkpJYVMrb0FIQllrTytiUXlBSldQSUdK?=
 =?utf-8?B?OE45eWFXbE9Lazh6T0xNQ2hocWNFeVZ3MmM1UVBGeXBjUEFNQ2ZCQklwOEZ0?=
 =?utf-8?B?VitRcHFhTW1wKzZYVTRVd3NIbHpoR2QzNG94WGpvb3lTQ1c5RldPYmx1MStF?=
 =?utf-8?B?L1Z1SEFXbHpUMmpHd1NGaFE0SWFkRmJPR0VwaElUU1d6akpoWDVOWUN3WkJB?=
 =?utf-8?B?dU4vV3JZanpnK1JBV0lIRU4wZS9Nd0hqUDljRDV4V2l5ZmtEMURSY2lpWXg0?=
 =?utf-8?B?bHJINVZYMmFhVzQzSktuRytTQU1sWlExU1lUMzVJajVKVys3SWRnMFV3NlNv?=
 =?utf-8?B?TE1YT1lEWkQyeGdNQk9RNEh4Zk9TaXNRKzZuMG5VWGhBeUZnbkdJQ0haeS9P?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PPSM8atVqYyFNUa3SxlOKan9LsGMjHC416/qzTR3kW0xSr1wrwf4fwKTmkc48fsSNbzugzhlsZcbcr6fDMazZF2LtlWDusSIrpEuGXNdOTic11COCs7kKHjVM4vbUz+Ca+gHoyJ9DY4K7hmouHiMGRqkus682AkNzZPvm4MhVnT27gLAl61N5Szb94aVCZr4u6L4Hk/E+rvl9kyR3RW+Cjy1huVh95RRQNgRXlLmcus9CjjxoXtvbV58CY9qcosWLN5lGrup2UsyVhYJgWsULX4fWjEaEfB/uHsuw5M1iliIA55VBMTCIh8LUFSZzrZsNS1NGwYuSv3WcG7e1B5YBwBU2qFcspiv+fK+amu5QDUW0Q4YEZ1ZTu71hCnvrfNxe4GhsQ9Z/05aOZV0cqHUB3+jXT2jCjNPXI4lGBClu740JlCDKVeXzTaV/o0q0RbHOxid/eQVwzo+OrSRSGmuL8yUwL8J30pPS04gyxp4ASxn8cbr08zF8Ci6/grGscj+K9k8whiLJTGZF8b1PGWxSQ+jvxBrMj/o8IVSYMdIzi76He89ZO9wP8cHWA43RHwqV12sQpkDmNktmaDCqTgLD99VP2aWaEzkryYSg6T9Xc8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799417eb-0fda-42bd-4795-08dd41e8b5cc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:16:29.7638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiLhSyIDSrZ7B2x75ddQr5NmiSIssVO9AqbDIV00M6ieUlCO4ue0Q9KOriR1t9OyFDs0LieUoezyMeU8l77ZKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310085
X-Proofpoint-ORIG-GUID: FkhsyYc6iLuawxT-R5ZUOG1B-5mmLDwA
X-Proofpoint-GUID: FkhsyYc6iLuawxT-R5ZUOG1B-5mmLDwA

Hello again Tejun,
sorry, just found one mistake in earlier shared patch, it
missed an unlock done below:

Thanks,
Imran
On 31/1/2025 9:37 pm, imran.f.khan@oracle.com wrote:
> Hello Tejun,
> 
[...]
> 
> Could you kindly let me know, if it would be acceptable, to have 
> queue_delayed_work_on_offline_safe, as a wrapper around 
> queue_delayed_work_on, such that it can check and ensure CPU's
> availability. If it can't, then it can simply return false and let
> caller decide which cpu to use next. Something like below:
> 
> 
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index b0dc957c3e560..57f39807f3bf1 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -589,6 +589,9 @@ extern bool queue_work_node(int node, struct workqueue_struct *wq,
>                             struct work_struct *work);
>  extern bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
>                         struct delayed_work *work, unsigned long delay);
> +extern bool queue_delayed_work_on_offline_safe(int cpu,
> +                       struct workqueue_struct *wq, struct delayed_work *work,
> +                       unsigned long delay);
>  extern bool mod_delayed_work_on(int cpu, struct workqueue_struct *wq,
>                         struct delayed_work *dwork, unsigned long delay);
>  extern bool queue_rcu_work(struct workqueue_struct *wq, struct rcu_work *rwork);
> 
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 9362484a653c4..7d3b8050422e4 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -2565,6 +2565,37 @@ bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
>  }
>  EXPORT_SYMBOL(queue_delayed_work_on);
> 
> +/**
> + * queue_delayed_work_on_offline_safe - queue work on specific online CPU after
> + *                                     delay,
> + *
> + * @cpu: CPU number to execute work on
> + * @wq: workqueue to use
> + * @dwork: work to queue
> + * @delay: number of jiffies to wait before queueing
> + *
> + * a wrapper, around queue_delayed_work_on, that checks and ensures that
> + * specified @cpu is online. If @cpu is found to be offline or if its online
> + * status can't be reliably determined, return false and leave the decision,
> + * of selecting new cpu for delayed_work, to caller.
> + *
> + */
> +bool queue_delayed_work_on_offline_safe(int cpu, struct workqueue_struct *wq,
> +                          struct delayed_work *dwork, unsigned long delay)
> +{
> +       bool ret = false;
> +       int locked = 0;
> +
> +       if ((locked = cpus_read_trylock()) && cpu_online(cpu)) {
> +               ret = queue_delayed_work_on(cpu, wq, dwork, delay);
                  cpus_read_unlock(); 
> +       } else if (locked)
> +               cpus_read_unlock();
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(queue_delayed_work_on_offline_safe);
> +
> +
> 
> If this looks acceptable to you, I can send a v2 of earlier patch.
> 
> Thanks,
> Imran
> 
