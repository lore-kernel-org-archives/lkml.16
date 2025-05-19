Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B9C2857E2;
	Mon, 19 May 2025 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669016; cv=fail; b=RZKI4TsTLGypJKLpDLp/8pHeCwQsrWRijcUf2WCXS0dKM00i72Mlbk66J9VKL2W4Fimvc+CuMCvKE113jA+zwr06s8NSpLs7oOMIbjg5vU7EtRDwQlkVpzRWral+YzFzduXRcp0qsdE0RpS1ixFoyjrPvfhc27hruHGEdDznEso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669016; c=relaxed/simple;
	bh=g7BSGxxcyHB0wgnjJWQX4lUNv1+J8f5fYki6fEh/nqc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=by4O5wUoXyAxrTtr0kq1t1YC/mrUCKowgeMOs1A9s7l4a4Ap+ukIkGHBw+IVzXK88j4txO80WUTZjhJt32YhFfnjUh3avqcf1u35LYeLsOadQq3utsCuwWp4+mzW+IrGAv6xd4CMUmGoznbeaqzY6DBFsXXnZwYKtBE8sG2K0kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pWvizlwq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JOoWNd0o; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pWvizlwq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JOoWNd0o"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JEabMU013133;
	Mon, 19 May 2025 15:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=t5IQI9V1csHFeJVJXPNjL3ENiEicxNQ83mVirOen9DY=; b=
	pWvizlwqYlgUmTfTU/SO1saoSjyOl/B/SQQLdKuIXjInLLZFkmou2htr3IWgmst8
	TGEB2Bdx/+Vu1Ddb9nEGeL7WpuwWYmdKLdzbdiYiC3LMPYpw6TctYYL8UQ2otGCl
	jYY/LZHctk/Rudq3tvmh2ZFED7WoSH0QGi5SB2QHKbYlzwQyJoQX3LepFQzEnAPi
	FzgbZ3/tZNNqumzppYb7dYaRz6MZG8+1ecnljF8MoNxp3MbmW5C0JNDi0o0qfbDc
	BkdkU/ETUs1wxEbLKdQ28/WofaPlwUDlXIITVGiXz40qO3z6L2fPWT7tHXzZHoMr
	NjCU9bFQBznZTv/hSc/8Bw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46pj2ub9pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 15:36:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54JFAbxg000868;
	Mon, 19 May 2025 15:36:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw6vb97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 15:36:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXb3SJiQ9o8GhoOR268ckTmoq1JY68NTXh9xzfLgzYkxMURGZDxRaQyWvgdvWqM2pDlqyOcrUVk2zB4UU6NdrWFD+YSl1ziWfGrCcow+Wb3dK8ELwj1DwjhwgkQBg5m6Yf3fBty1viijW+nyyxxLuGmbVko+sxzxRfw+NrrGqbkAvAflYDiENBJLbFwaythunFagWU0ja8V0HhAKUyoQSJN94LYcjd2piKp5nJpcGojRn7094eyJFuwovQptwzXVi/2MAVyZPvuJRTBimF4IhsNKFChCyNmxVSAdf13nZLuxkawv8nX89wA7n6gN9xu1yiz4gckSyGpnxQcTqd8VEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5IQI9V1csHFeJVJXPNjL3ENiEicxNQ83mVirOen9DY=;
 b=T7EwDC/CtRjFnmF0WOR5Sf/Qd6iDUcLXqP2qdkoloZ60g7Df/gNfQneUHWuri1AZozK302G3rVIeRnKzS9aWkJPCZM9QiTqyN1P7nW6teuq9EqBdtjk2q7y1b/LtJPp3clNJ49L4upiMiwRgD/IOZ4d9sBIiFarAGP+QjfOszJ6LqmhEy++P6fwCyoO4E8P4uRJJfxUzibQVpSetM4ylNxefGO82D3+MMPI/nDiBLNuprEyfdCaetsrlyePac9ULY+/bYXn9aN4utRpo2ikWZuDzgQDyoDSxLSCnX+HM/MZSxa8ow8o8yFC2tlrpJCz/KB+IvbMm8JAZzYUg8iNPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5IQI9V1csHFeJVJXPNjL3ENiEicxNQ83mVirOen9DY=;
 b=JOoWNd0o91D/w1JLqnQDA5SItipulD09uhSCLeF8Fe3jMOwbsIfqqJAONfLci1/Ja0QKFy/qfbXP5PKINUseUDzFLRIT9yvv+e3ZoUzenwb05Ty2EU+1PdJhPL/ip4xoYMgKbhQ++ZlJXTiIQ/uBB90MLCLD+Og/KSoFzIqZvPQ=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BN0PR10MB5063.namprd10.prod.outlook.com (2603:10b6:408:126::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 15:36:34 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Mon, 19 May 2025
 15:36:34 +0000
Message-ID: <7bf2d09b-a500-476b-ba92-520eb5e24869@oracle.com>
Date: Mon, 19 May 2025 21:06:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: stm32: introduce clocks for STM32MP21 platform
To: gabriel.fernandez@foss.st.com,
        Michael Turquette
 <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Le Bayon <nicolas.le.bayon@st.com>
References: <20250519142057.260549-1-gabriel.fernandez@foss.st.com>
 <20250519142057.260549-3-gabriel.fernandez@foss.st.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250519142057.260549-3-gabriel.fernandez@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BN0PR10MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b107ce-89c7-4137-85b4-08dd96eaef32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzNFZjYyVmh4RlM1ZHJDZmRxR2Nkd0hXS2hxdzVNbW1SUWI1L0ZvU1lIdFAz?=
 =?utf-8?B?NllzakJjTFJtN0JwSHBDVlJNbXFRRzlmaG8yUG5oV1Fpai9NRzA0STJqeTNr?=
 =?utf-8?B?QXRuVVdjTzR3blRlWmtsZm9BZHpRdGpiN1FJdzJUb0d5Z3hUOEdrQjhNSmpu?=
 =?utf-8?B?NWV5UUZZdXBCNHVMNVBQRUJJVHd5MnlpVEF3TDY3cEdXdkZmK0JrSmN6TDN5?=
 =?utf-8?B?R3p2VitrcGZrZG9HdEFzSG9DRGV5VmUxZDAxZjV0dThwVXdsM096MnhjNDVO?=
 =?utf-8?B?UUEwZHo5bXcxbVNIK3JGaTg1OU1OWGpoWE9JSFRtS2dGTUt6dFVkTzRyQU1m?=
 =?utf-8?B?bEd1WFpISERsWFhWdjRWR3gvcUU3THdSRUI1YXlnOC9SbUh4SXV5UUdNT2ZB?=
 =?utf-8?B?NFhGZmRoZ09kdC9QaFV5Wi9HOFdsbkp1MmhSdTVPa1NGVjF6dFhWdzNadFB3?=
 =?utf-8?B?RHNJQ0JkNzhPVmJZWmxsVnlOUWh4TTZsQ0Z0RkhuSEtZYlJ6MmZMc0pFNDlx?=
 =?utf-8?B?UnM1d3J0dUYveDcxMnVjMkpSOU96bmdZY0ptbWNscHFsanZTNzR6R0ovVHVP?=
 =?utf-8?B?dmJpQk5yaURmZUpKVk9oWFowekZEcnFQVndUTmlZU0xYcklxUlBCUGF6NVVr?=
 =?utf-8?B?MllaYmpZYzRUMnJEck0vUFVmTDQ5QVM5ak9RNDZGa0tja2RlS0tBOW9JTkRp?=
 =?utf-8?B?ZmhHSDF6T1NOK0xvdmZlaVplQ0hydVhyZXJaLzFBOUd3a1ZkdWIwNkdJN2V1?=
 =?utf-8?B?ait0VHo5OVEyUjB0Z2dnZVlEUU1jU3l2TEVqSjNUczByemdscFB4VWZyZWRW?=
 =?utf-8?B?am1sNmpvS25qQlFobGhuS3J4MndWM1NkanJYYmVpSHc2bldoYk9FWUZRbEM2?=
 =?utf-8?B?ZjlOeXFaVXVZYXBGdWllM3psMzZYN0oxQVZPOTVtUkhaYkxOMGNVbldlVGxt?=
 =?utf-8?B?QXBoMzhYRGV5ODlwQnVwbCtYRHgxUGtPTmw4UGhpbnlvTGsxTHlMZVJoWWpk?=
 =?utf-8?B?djYzaEtNVFN6NVJWRHJUMCs3U0paT3c2VDBZZHI0Y0JzMEVEbjU1Z3dZVFNS?=
 =?utf-8?B?K01IUHpxTFhyOURHS00zdkYyY2Vtclpad2xKTStuSEdLS3ZWYStDSXIyQkxp?=
 =?utf-8?B?c0VsWTJWSmxqOGtnT1dFVmU0Q0ZTa1BKQUpZWlN3TDlGbW9OcFpmVkovODAv?=
 =?utf-8?B?VXhWdTNlZFJFQnk5YjVFV1d6dDBxalVEK1ljZUR5RUhkM05XL2xtWFQwZWJJ?=
 =?utf-8?B?cTNHUWhMbE1ZLzlCUlNXSE9pYXJTcGpLQlAwcjhRL0tlTndrN2hsem1heUp1?=
 =?utf-8?B?R0NsNTQwaG9oeDFyNW9GbDlFQzJ1Uk5jTEdTTXgzUDg2aEs5dFV0cXVHNG1Z?=
 =?utf-8?B?L0RNVEpNUUVtVGk1ZGV3K3VTelJRVExtNmNxRnE0eFZLTXYrRk5PWjJPbnlv?=
 =?utf-8?B?TEU5ZlhCWGZrQnF0ajVNMzdxM05LSlhMY1NUMEswdEtaZ2RWNWlDem5GcHdD?=
 =?utf-8?B?alRBNXdIVWtTL3dsOGdxUmRLYSthZGtVSFU0RWZaVURaS1BDK3dhOXVRaUNv?=
 =?utf-8?B?WWVOL3A5UGF6VlZRL0ZDbUx3UFgySXJlYjF0eGxDZGw0bHNVTnRPR3FpYUtY?=
 =?utf-8?B?bWZWM2UrTml5UWo4bzNzZ29RRU40ejNsbHZjQ0MvM2RvZWhaTzJzOHArd0Ft?=
 =?utf-8?B?VnV1dUtvM0NmUjRoWjdoZkZ3MlA1STliN2Jvcy9iK0ZMWkkrZU5Tc1Fnb0FL?=
 =?utf-8?B?VXZHb3ZMakFqcmJDOFdsdlRXd1NhL2xCVzg0VUlUWTBpem5tZi82N1dTb29R?=
 =?utf-8?B?OFZndU9JUmViQmVQUXhSTjN0Z2xDNS9BOEovcmNZb1lncHdRVEtMclZySkRM?=
 =?utf-8?B?Tnl5eU5ZSUJOdVRjWWxEWTgrQUxWdkJCQ2ppN1dEaHVHWFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVdHeVIvakdMQWZVOGZGa3lrVWdUL3VSWFZHcklnMTBocVpXb1JNbXhMSDZm?=
 =?utf-8?B?dXhjTDhROE0zS1JyeW5laDA1M0lyNHBUa0ovMkFhSlJmMkpDaXNnR3FhK0ov?=
 =?utf-8?B?L3BtWC9TTkhVdHNyMUZsTHVnMUNaR3BIaXhnbTdYSGk3MmZ1QjU1NjlCU0k4?=
 =?utf-8?B?Y0Q2TkQ4RG9naWdGdzZNV1NCZmFpRnVTTU0wYXV3aThIbVNLYUI1RlkwbCtD?=
 =?utf-8?B?Q1hhdHFXdHNNcjlSa0ZGN1FHcG02T2JocEtORytwUmxiVU5va1VpVXVoMGlq?=
 =?utf-8?B?b2h1MDRwaUMrbjRlWGNMQ09UVjFPMnp5cUxzK0ZYaWVKeVFoOVpSWVJOWjI1?=
 =?utf-8?B?Q3N5YmNKNHRBOHZUWGJUZnBxRzFGMkdwcXp4TDVUYzdEMkkrWmNBeXphTWVX?=
 =?utf-8?B?SFA5NldscHlvMlJMZmtZUTRkQUVrK3Fqb1l6UGdNbzI3QW5SWGlndmpPR2Rq?=
 =?utf-8?B?R2oxNWhBZnNuTU5vc3gvUmJtdzVlSGRrSGhJSGI4OVRCSk1IUlNtVy9EYndM?=
 =?utf-8?B?L05mNXFMS2JOZHhKWGhMT0djV2RnSGxrU0gvZm9EbWtDR0VQdCtaTmFNeHNH?=
 =?utf-8?B?NnhkZi8xd2Y5VEhtWDljM0IydGRFd1kvSXIxMms5MzZkb3hQdDBzaHpNaDEr?=
 =?utf-8?B?ZGhVZ3F4N3hKUGYrNDJPTW1pOXM0b3dnMDBHQVZIVWM0RWZJSVYvR1lxdFZM?=
 =?utf-8?B?L3dVaURBL3RpWU9lWmdOR20yREMzaVRxVEhWU3dFcTl2QUp1U1Bza1hlbW5K?=
 =?utf-8?B?SlRObHd4ZkRYTUZnTUkwTWJwYU53ZWs4eFd5V3plemttUUJPWWZJSWpYTjRR?=
 =?utf-8?B?Qkgwb3V6MHViQ2pmMkRTZWlDRElXMW4vUk5iVlM1STZvQ1dpcVkrUUNWOGFS?=
 =?utf-8?B?ZjN2eU9Zd2U3OGVaU1lXNm9GcnZtb0xXVzhVSFRTWlZzeVA5N0JxNXpDM0dP?=
 =?utf-8?B?b2lHRmlabjRxR2dlN0Y1d2NxUUEyQ3BVaWFDU292QWd5cGZEMjJVcmxzL3dm?=
 =?utf-8?B?T0Jqd0FOeko0K2wzTkN2OWtLa2haV0oxMXlGZ00waEpiNlhOcVBqUTZteXBK?=
 =?utf-8?B?bTZHNlYxL2hFbHc3YVpSbVFXTlF2aWQrMTY5VFlTcHNaM29RempUME8zWnZG?=
 =?utf-8?B?dWZjeHdBYWZyRGxxbkhleExPWW9YRk02c212TENKblBRR3duSm9SdkFYSWh6?=
 =?utf-8?B?NXp3ZXNsTUlaUi8zMTNtMHNneExRRUxpUTU0YXRhUTJ0ZVAyVWV2eGpNdU94?=
 =?utf-8?B?UU5taUhDemx6NGJ4QmswOTVpcXh2MHY2RzduYjFBRng5QTVrZTEzdmJqNTMz?=
 =?utf-8?B?MU8zRlEwNGRDT1d5K2N1V2tBQkRKL1NhOFpWQUxhenNmQzU2bVU0RGRydFEz?=
 =?utf-8?B?dUxuTXVGMnFpVStZV0dCaWh2R1k4aGdIbmtPQkxVb25hdldMTUdUK3lXY3RQ?=
 =?utf-8?B?bkU1MWpKbTNBcHpiV1Z2TEpKakxiVUxyaDI1QVRqdTVMNnBKVFN2NktGT0c2?=
 =?utf-8?B?OG5Sa2NuUUtNUFE1M3EvOFlZYitZNGxaUVdjWHg4NzZValZ5Y1oyQmpqWUQ1?=
 =?utf-8?B?WlRaOHFLdDdyS3dDeU55RXErMVN3czhpL1VadS9Vb3htaHFNcHpVN09tREtX?=
 =?utf-8?B?NFprRTl1SjdLWmRpMjltVFZESVVkcTUvRWVqUTd1OStwaXRHWEpPSm5WZS9h?=
 =?utf-8?B?ZkdzdXR5UVFWMmVScVBXUEd2N1lvQzdWQzFvRGdFMGIvRWVhNENvWC9TajFk?=
 =?utf-8?B?bzBvQllzbGx2MVJMbm9QZWxKL29nVWxDV3NHc0x6N1NoVC9scjVFMUgvNTdq?=
 =?utf-8?B?Y2lxWGZSTzZUNzhQYTVwSHlpcnl6RDQyODNRSUJVLzJlQzJSRlBpSHpXUVdB?=
 =?utf-8?B?czRkbzN2VlNBZVp5NnZ5YXdlc3E1RGFPS0w1WVBGUlU0ZkZlN1gxM0xsUHhU?=
 =?utf-8?B?RkV2cFdCT0czWFhPdHJZNnFic01QOFZBS1RlMmFrNjJFVzZuUTUveTJhVi80?=
 =?utf-8?B?NkQ3Z2dCNDB0OWVxM3owOGJmdGhHU3M1bGtjbUpWbjhBZy9GampFaGtUaXpG?=
 =?utf-8?B?YkhWUjFaVWtJdGhMc0p6MGYyQTJHWEpnNkJLMzFvTEhKK2M5T2szMHVSZ2x4?=
 =?utf-8?B?MEZPYXFkNXFkTzNKQnFiZlp2SFlWL1lWZWlWaVoxNUZ0akF5RUpKbHVVa0ly?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fQYBy+e+bC7Z1EKuklPqZ3EQbAaR1yO+Nw/fBYANSTnKPae2Sgmrokq0zCG2pzdWOmCYEWkNT3m4bUQhQZh+lWHkeaKO7/0UYEOBA+h6mZ93KnwvOKXCPAdf3JJQZNnVuCKePjL/50hYDpd+w4oFp9DuM4NJVGdPplfzEXyCcY8cdOOedkyAcJz4aMPPpu35wLAYIV7UD/rxVdgFuz0kejQ0t831W2nrS68/SmiZ9cei9QAYa/6WLJLjvrKNyp7gHB55M6WhzMWgT9petPnGTpHd7z6gh5P8K4/3BvERF7F+jijd4SYOHnzaGt8qmr9R7lwJNndInYDqqa9GF/XTqPbdoFePf24UsM/+ZIEgLRJtON7YrE1QcJd6C/saM6JAZVwjy2CpjBw9jdiNp6DQOo0AJhjHq31w6QDKKGKG3PWfnKUSwOSDgDW+9u6vzwns0FF/eGLnKAfQ+9JqgtfcB0w5Ug7qhKxz7rmyhl1Y7lhxujSSuaeM0svOvzaQZA8FA0+x3tJyC1ytbtT5RI9dVEqNNGdR5nJ8Jtq4IGjts1au2A2BgcgnXwf0g7rImKVu8RtKm5vNdadu+fIIkXzYxJt53/Srk+i3GPlQYKbOGFU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b107ce-89c7-4137-85b4-08dd96eaef32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 15:36:33.9253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKIbdgoibEunu2h9D6mfp5zfewiOhC8bSGh0Co5iWYI6CKsdQm/QSot11T93KOHZ3PA5DkbAcVxcaItG/hqRDJDTVEwAfUBraGLBQBeP/SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5063
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505190145
X-Authority-Analysis: v=2.4 cv=UKndHDfy c=1 sm=1 tr=0 ts=682b5005 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=8b9GpE9nAAAA:8 a=46gdUF0BwODXBpbTPswA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 cc=ntf awl=host:14694
X-Proofpoint-GUID: 6ULdI_6WSjzUePZQfpjCxLZqMch-w06B
X-Proofpoint-ORIG-GUID: 6ULdI_6WSjzUePZQfpjCxLZqMch-w06B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE0NSBTYWx0ZWRfX8LNWRELkh7yb Lbkq+r4L0uQ1yRYY6pL+LhRmD2qAE20NSFtoZ33Bg0J8agCq8/1gXUKg27YTHMjYGP5WyJJcVqZ s2HvaduTX6CxTTEy5v9G6QuLTe03nLJZhkytr+YTD0WULl2ynaE/OMsUiHnD71tGqw5I4lBcVe7
 g3ZFXK2HXCbKuOu4xJsgiwSMfFmqQDsvwUUukrWMF9UMtzEZZYKp9X4X/K4bA4jUL/suZWbU9ds CH7qXWmoMHEYQZ/6b9atUtMmkXQ1Bm4HYgTHklx8iKSWVbZBdC8iaocec9G72n3J5BamjZRY/Ca AICDu+JVswWYg2leEQqFffMwAC99U/Lzvm4UKwv/ymu7/VZi1g1ykRw55KEAeU0zSxau8yHuP9Z
 OEEDwNNX+Edq+AYDHJAc0ATcnMcavIJ2wF0eP2EVZfnd0dByewjw1gvv7O042I/CJlej/cub



On 19-05-2025 19:50, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> This driver is intended for the STM32MP21 clock family.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>
> ---
>   drivers/clk/stm32/Kconfig         |    7 +
>   drivers/clk/stm32/Makefile        |    1 +
>   drivers/clk/stm32/clk-stm32mp21.c | 1583 +++++++++++++++++++++++++++++
>   drivers/clk/stm32/stm32mp21_rcc.h |  651 ++++++++++++
>   4 files changed, 2242 insertions(+)
>   create mode 100644 drivers/clk/stm32/clk-stm32mp21.c
>   create mode 100644 drivers/clk/stm32/stm32mp21_rcc.h
> 
> diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
> index dca409d52652..12396f1c5cec 100644
> --- a/drivers/clk/stm32/Kconfig
> +++ b/drivers/clk/stm32/Kconfig
> @@ -25,6 +25,13 @@ config COMMON_CLK_STM32MP157
>   	help
>   	  Support for stm32mp15x SoC family clocks.
>   
> +config COMMON_CLK_STM32MP215
> +	bool "Clock driver for stm32m21x clocks"

should not be stm32mp21x?

> +	depends on ARM || ARM64 || COMPILE_TEST
> +	default y
> +	help
> +	  Support for stm32mp21x SoC family clocks
> +
>   config COMMON_CLK_STM32MP257
>   	bool "Clock driver for stm32mp25x clocks"
>   	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
> index 0a627164fcce..e04727b59449 100644
> --- a/drivers/clk/stm32/Makefile
> +++ b/drivers/clk/stm32/Makefile
> @@ -1,3 +1,4 @@
>   obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-stm32.o
>   obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
> +obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
>   obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
> diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
> new file mode 100644
[clip]
> +#define RCC_R30SEMCR				0x124
> +#define RCC_R31CIDCFGR				0x128
> +#define RCC_R31SEMCR				0x12C
> +#define RCC_R32CIDCFGR				0x130
> +#define RCC_R32SEMCR				0x134
> +#define RCC_R33CIDCFGR				0x138
> +#define RCC_R33SEMCR				0x13C
> +#define RCC_R34CIDCFGR				0x140
> +#define RCC_R34SEMCR				0x144
> +#define RCC_R35CIDCFGR				0x148
> +#define RCC_R35SEMCR				0x14C
> +#define RCC_R36CIDCFGR				0x150
> +#define RCC_R36SEMCR				0x154
> +#define RCC_R37CIDCFGR				0x158
> +#define RCC_R37SEMCR				0x15C
> +#define RCC_R38CIDCFGR				0x160
> +#define RCC_R38SEMCR				0x164
> +#define RCC_R39CIDCFGR				0x168
> +#define RCC_R39SEMCR				0x16C
> +#define RCC_R40CIDCFGR				0x170
> +#define RCC_R40SEMCR				0x174
> +#define RCC_R41CIDCFGR				0x178
> +#define RCC_R41SEMCR				0x17C
> +#define RCC_R42CIDCFGR				0x180
> +#define RCC_R42SEMCR				0x184
> +#define RCC_R43CIDCFGR				0x188
> +#define RCC_R43SEMCR				0x18C
> +#define RCC_R44CIDCFGR				0x190
> +#define RCC_R44SEMCR				0x194
> +#define RCC_R45CIDCFGR				0x198
> +#define RCC_R45SEMCR				0x19C
> +#define RCC_R46CIDCFGR				0x1A0
> +#define RCC_R46SEMCR				0x1A4
> +#define RCC_R47CIDCFGR				0x1A8
> +#define RCC_R47SEMCR				0x1AC
> +#define RCC_R48CIDCFGR				0x1B0
> +#define RCC_R48SEMCR				0x1B4
> +#define RCC_R49CIDCFGR				0x1B8
> +#define RCC_R49SEMCR				0x1BC
> +#define RCC_R50CIDCFGR				0x1C0
> +#define RCC_R50SEMCR				0x1C4
> +#define RCC_R51CIDCFGR				0x1C8
> +#define RCC_R51SEMCR				0x1CC
> +#define RCC_R52CIDCFGR				0x1D0
> +#define RCC_R52SEMCR				0x1D4
> +#define RCC_R53CIDCFGR				0x1D8
> +#define RCC_R53SEMCR				0x1DC
> +#define RCC_R54CIDCFGR				0x1E0
> +#define RCC_R54SEMCR				0x1E4
> +#define RCC_R55CIDCFGR				0x1E8
> +#define RCC_R55SEMCR				0x1EC
> +#define RCC_R56CIDCFGR				0x1F0
> +#define RCC_R56SEMCR				0x1F4
> +#define RCC_R57CIDCFGR				0x1F8
> +#define RCC_R57SEMCR				0x1FC
> +#define RCC_R58CIDCFGR				0x200
> +#define RCC_R58SEMCR				0x204
> +#define RCC_R59CIDCFGR				0x208
> +#define RCC_R59SEMCR				0x20C
> +#define RCC_R60CIDCFGR				0x210
> +#define RCC_R60SEMCR				0x214
> +#define RCC_R61CIDCFGR				0x218
> +#define RCC_R61SEMCR				0x21C
> +#define RCC_R62CIDCFGR				0x220
> +#define RCC_R62SEMCR				0x224
> +#define RCC_R63CIDCFGR				0x228
> +#define RCC_R63SEMCR				0x22C
> +#define RCC_R64CIDCFGR				0x230
> +#define RCC_R64SEMCR				0x234
> +#define RCC_R65CIDCFGR				0x238
> +#define RCC_R65SEMCR				0x23C
> +#define RCC_R66CIDCFGR				0x240
> +#define RCC_R66SEMCR				0x244
> +#define RCC_R67CIDCFGR				0x248
> +#define RCC_R67SEMCR				0x24C
> +#define RCC_R68CIDCFGR				0x250
> +#define RCC_R68SEMCR				0x254
> +#define RCC_R69CIDCFGR				0x258
> +#define RCC_R69SEMCR				0x25C
> +#define RCC_R70CIDCFGR				0x260
> +#define RCC_R70SEMCR				0x264
> +#define RCC_R71CIDCFGR				0x268
> +#define RCC_R71SEMCR				0x26C

0x270 and 0x274 , not here
is this typo or intentional ?

> +#define RCC_R73CIDCFGR				0x278
> +#define RCC_R73SEMCR				0x27C
> +#define RCC_R74CIDCFGR				0x280
> +#define RCC_R74SEMCR				0x284
> +#define RCC_R75CIDCFGR				0x288
> +#define RCC_R75SEMCR				0x28C
> +#define RCC_R76CIDCFGR				0x290
> +#define RCC_R76SEMCR				0x294
> +#define RCC_R77CIDCFGR				0x298
> +#define RCC_R77SEMCR				0x29C
> +#define RCC_R78CIDCFGR				0x2A0
> +#define RCC_R78SEMCR				0x2A4
> +#define RCC_R79CIDCFGR				0x2A8
> +#define RCC_R79SEMCR				0x2AC
> +#define RCC_R83CIDCFGR				0x2C8

Thanks,
Alok
