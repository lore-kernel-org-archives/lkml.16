Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BB4267728
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392717; cv=fail; b=niHgQwzsAMJPZGs8xul+zA2xpT2igs0m3PPq50zbwdMjYmqHewtoue79nIOHWSgGvf5n+6XKW+NqxuMA3zdLY22QtrTo05BTBZ29g+tsg1e58iI9sxNw1XwrrDEp/IX/4DGUnkkRcAIzC1lH+JEWN5TqRNSsG352qxH4hq8Iqro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392717; c=relaxed/simple;
	bh=8gT/ul8KqMU6rGy+RKNnCLOCv1McYcW8Y088PvZan4M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nCsjsZjSthtKzsL4XZZ8Tr8lw4AbRlRHj7TfCUndI/8sGEfKFSUpGcEQqbdCUKwtcwSh+DMfNweD6m9VB32h0CA0qLlQ74mUGYDyTDbI+5SMAUA55r1oRCLQC0SdEI2mxROzvfkwhOLibqIKVWyDyP26Pp/ccsXjq1Q8qZSPaZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=esaLlvJv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kACkNlNF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="esaLlvJv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kACkNlNF"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0uWKc026360;
	Wed, 23 Apr 2025 07:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZbwTe7auO3ZEh/pJ2SKhTDc+n3LUpMQPAd7dDN8Ob0w=; b=
	esaLlvJvvXjzMnqs4IjVFvJFsH+HTfu5UC1QnbSJtKbcOVCCteJFDfsGk8KcFQyY
	/nGAu1HhVFkJ1eQIOipM5TfY2MaRiEy4TwRvbWQ7R66d1L4HB6kVaWiJOr+hq1OK
	ozyiOGXjPFWjO5m5ve4dAQjZRzQLLu/x/Ovf7ckfPFG/amLXRrTX59jLbLUXL7MT
	hkLXx7MSIHEVZ1nqxWi49V//gAzccevLG7ToLaz7+j7bxr7SeQJ4GuE8KvinRgKm
	2CuG1LqapPBkFE1U+2de3VHKmkZA+ITDPen3BdwXtk/CQebaUtTcJCaKxPhZMQot
	ueB+fOIExXgyJDbNqyIbog==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jkjgm0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 07:18:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53N5gGRY028539;
	Wed, 23 Apr 2025 07:18:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jx5q7ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 07:18:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnkYoikFVRjBJObm6tLdiYmM8v9fBYos+jtWjnZrgDDr3rml/7B5R1Ek9CxJfIODduPP/DEBYOiF16v++XzNIwi3Z1woG8fOVz1i+h7Uey+EhPTi8daIJm4cgBr1FZEI/Jd/ML3EUZq+/TjNN0slWD1cuIpfJ0jybPYOJrH2hRjG/7zwbqXv8lsDHGh+TSTohdKpuSPzaE5wJLG9R8s9644m8JTu7jnHt+nYs4JRKzJ5yyvg4Sz+fGdOdEOVL+jm9rBCvYaqwHwuXjycVt2n0re4ZHwBSFaw5PiDfaDqpVjkXvP3D3C0Hi1AKS5vN2RvNbD456tBZmlI2d6nHzKcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbwTe7auO3ZEh/pJ2SKhTDc+n3LUpMQPAd7dDN8Ob0w=;
 b=suLAlcglcByGBG++nwcOOBAq6cIzxvqH6dTdfMBewPLlxq/0scsI5hWbz3Il8T2DOnxtbHqUArg4l3t6fKpmD337GaPeKP661Eh0z5ARHim01ALt3p/J/GN+BOHf6keovHQmfb9op1aWAG+XGC6+EI/B9A4dvCdkqPf//j4kKSAe1oFi+4do14dexKPphKo8Oh82rdQ4VdOrD/UtkicXQjeRPfWLsaqpHEh9Ve+HFVBtDsyhoVWzPEMbj2DwboN7Twind9gxakWqvW+Dj5IWIG7wPPn2V4Mzdajqq1J/ilEUn+SX8sTJy3BmLpN+PZ61BssXHQoKa6qSy7co7BBS3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbwTe7auO3ZEh/pJ2SKhTDc+n3LUpMQPAd7dDN8Ob0w=;
 b=kACkNlNFsvp7/Y7VTLZ0dQiKTIEPe9fik/lvB2pAhEktWYJuZBhVbVDaTJB7nzAUwusWqg7WQUnnEOFUZ1K7u8xio/XNgSzy1R+9OdHtqNXA0BFUV+aWQSVnRTy+6baPxi77bI1esSyhQTbrwzrFPDSr0pHeeBGd6rIApxdNXLM=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM6PR10MB4139.namprd10.prod.outlook.com (2603:10b6:5:21d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 07:18:19 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 07:18:18 +0000
Message-ID: <0c71d318-a7d8-4b40-8721-fa21a7fa806a@oracle.com>
Date: Wed, 23 Apr 2025 08:18:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3 V1] lib: logic_pio: export function symbol in
 logic_pio
To: Pei Xiao <xiaopei01@kylinos.cn>, xiaopeitux@foxmail.com
Cc: andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
        robh@kernel.org, xuwei5@hisilicon.com
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
 <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
 <0502a9cd-d13a-4de0-bc86-3ae0466695f5@oracle.com>
 <0c3b4a88-58b7-4088-a4fa-45f927ce0edd@kylinos.cn>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <0c3b4a88-58b7-4088-a4fa-45f927ce0edd@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::15) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM6PR10MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: 122ead1d-bf5c-4331-9d92-08dd823705ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emhkVSsyZTRtVzdNcDVFUXk1NEF2U2VkdWlMalpXeWpEMzhYYlVtREl1N0V0?=
 =?utf-8?B?MWQ3OGF1Ums0RzNsRUZ3U1p2aEhQSUhyK0w2ZTVZaHo3OGh6YldUeGs1MjNh?=
 =?utf-8?B?WXBQNlZ0ZlFqYkU1ZHpGc0NSYnVmTUQvcDd2blFzQzZhRmNINklUQ3B0cG5a?=
 =?utf-8?B?MlpzQXdxL0dCMkFEK1pUNmVzR1d3YVZqZFFYaUlISlBVN2UwREJJN1l0MjNC?=
 =?utf-8?B?Umpsek1mY0NpaDZuOHdoVlN4ZExMTWJOSzBMQ0ZSZHYvRi83RldaZm5xTzBY?=
 =?utf-8?B?a3UvU1RVaHZnUXUyb0lNV29wTXNycmhLWjgvL2hhTUFYNjczYitIeVJqQW80?=
 =?utf-8?B?OVpuUzJoZGZNcHBIRTJXblNMdm9YcGRBcEplYWw0WVk0UWpNcnMrM1l1Q0Jt?=
 =?utf-8?B?OUJBdC9YUitvS1dHbExOTXpWeTd5cVFmQVJwZmcyKzl5ZGt0OGZGc2tFc2Qr?=
 =?utf-8?B?ai9CeUc2SG9vdnVKcDZVaDFuZzhvazFaMC8rR0wxVDI3WVl2anNTeUVOVkR1?=
 =?utf-8?B?Tkl1WFRySDF5cGxiMDJaVWtpMjM5UnZzUWJGaE9iY2FzVHJ4UjZQZ0oyUm5x?=
 =?utf-8?B?K3dneW1Sd0thS0laMWs5eDNNQnZzeXN3WG9qVXlLdkJhSDNCbVNLNVIwK0Js?=
 =?utf-8?B?eU81OEYxSVZncWJXQ3l0L3ZldGdpYTRCU1VjdXNZemsrTFFxM2hKcGpoTk5u?=
 =?utf-8?B?Z01FSlduVnVSOGwyb0pRdDZxaHBOQXp4R2ZQNkpCb2czNEIrQVB6WUFMNkln?=
 =?utf-8?B?ZlNwU0VWNUthRnlnZ0ZlUVdwYTRxM1lWRkJBa0ZRTXV2VGxLS3AvNEE4emxI?=
 =?utf-8?B?d2tqdjdqU0VxWng0SmwvbUZwYnFwbVhDM1FhellBRWJQdlpHcVVGc1VaQ0Nn?=
 =?utf-8?B?Q1BHWVp2RnB4S24xaWs1NnRnMFRqT3ZHaHJObGI0eVZDQ2g0QnpLbXgzc3I4?=
 =?utf-8?B?M2NsN2w0MmJIMDBKbEFodWQ2aG4renRHdlFnUUJOc0J1bk9xTEczelJhc0cy?=
 =?utf-8?B?ZlU5UjNYY29rSGpqeUo3M0dPVEhBdE01V0hmeEJMeHNxdFVjQXFDRXduQ2Fl?=
 =?utf-8?B?K2I3VDVtQ0hoTFh3Y0RxbTErb2lCZXRlRkJCSnNqN002NnpyVHM5WXpwdTJv?=
 =?utf-8?B?RllRN25kWGh6ZzVPclFzb2MzL1hlTWNzN2MzMTNKc3lpUzFnVW9adFYyUklF?=
 =?utf-8?B?TlpWNkhZU05QVlNacEcrTFJZYUhlWCtjNlJ2MzJOYWZ3YXhqVGl0N2lkVlFr?=
 =?utf-8?B?NERWcm8zTVE2Rzg1TGVLM1pDeUpscmFQOWFSUDBpcGZJSzBoYW5aNGFndUF6?=
 =?utf-8?B?UXVSZjZ3Tm5qdytoQUdQbkh5Sm5mOWZIV0R5ZlJRcUhsZ2krSTdMaWZlV1VI?=
 =?utf-8?B?UVJKWkRIa1lDOUpwSU9uVEVYdll6TlZnSVdYcHhHYktia3F3cnhvSTVMbnlC?=
 =?utf-8?B?Lzl3V3FWODJHQitRWmxJaGlOREJ3N3VqYklpZU9SSWpYbUpEZi9VUzNXUk1V?=
 =?utf-8?B?RTlhWFV6aTB0UVA3eks4eXpjMHZTNWRjamR3VW1OSWZxQ0QzWW8yWXRPVnc4?=
 =?utf-8?B?d0hFMjZwVkR4UVQ0S1BYQmloK3ZDMnZNTGsvaGtrTFJoV1I0c2dsQ2F3S2Jt?=
 =?utf-8?B?dTBXa2VFcEpxNGxyN3JLdmtKUCtsbXEyR0ZPbmx4NXUwcjVrQllGeVVaY1J0?=
 =?utf-8?B?VmxFRjFWVVpFMjZvTGgreGd0K1pmNHdsYldna0psOHRoem9uL09wc3FSL2Jq?=
 =?utf-8?B?dHFOMkNYUUlhYW5KM255REcyQ0FEUXZoYzZZbWpZUm5WYUhYT2lCZ1dWQ0lr?=
 =?utf-8?B?bmltc0ZjN1JObFYwaWNuTithc0lHRi8wVDBhai9hcis2MXJDUUpPMHFGS2dm?=
 =?utf-8?B?OWZQMEZlYjN5cFlRajViU3BoaWZvTEMrVEpuaUgxRkJZcUNPTElYQUhSdzZS?=
 =?utf-8?Q?hbuq6dqVNC0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC9RZGp0ZnpGdlJOcGFwM2hSemJ4Y01mY0psRjhJZFVmc2lRMU9DdVV3MEdB?=
 =?utf-8?B?QytFeHRTU2FIWlZVdXppdTBDNy9Lbmlobms2VXdIeEcxVjRyQW5LMmZtRXpG?=
 =?utf-8?B?VUErTlNhSkJRdldmbzdVMVZ3YmJOZHcrRzhsbDN6ajhNakl0SjAvK0hDcElM?=
 =?utf-8?B?c3laNFYyL0FwUVFHN0pmQ2trbUduUlNiNXgxYnkvUUJrYU8ycStpUXI2a1lQ?=
 =?utf-8?B?bkZCZGlQd3RUcjJTR3p3cUtKM21UNmdKR3MvOFhWUGFnQXRGSW14N0h1NnAr?=
 =?utf-8?B?Y0o5d2lrMmNqR3RXTmsrWTZQa2ZaTTlIZWdoQ21FQW44Z0FpOGlQd3U3M0or?=
 =?utf-8?B?bk4vZWZYeUx5aVNrNnc1VjBKVytUSGUycFRsc3JtWmlwc3Z4NFVNMDdGQ0Iz?=
 =?utf-8?B?UmZ5ckhVaHJuK3FEVTBVU3RIbGI3YU5sZ3l0VGxpWTJGSjNWYWxuM2tKVWE5?=
 =?utf-8?B?cUxNdm1hSUdiODFkZ0I5TUp1YUdiK0dWTXdhbU9nRzBqckFhVE05TnhwcFRs?=
 =?utf-8?B?OWw1dnNNTmovdm8wZDAwWThQZDNQR2dwVUJ0T3NPOWNhQS8yN1NqeXE5eTJJ?=
 =?utf-8?B?dVREc1c4OFg2RVJ5bTllSnJ6MGpndDgvYlA5V0JkcDhGa0dUNkhITnJsVW1S?=
 =?utf-8?B?OUtiejkweXB0aGJIdko1MThPZWR4NU9SSlUxb0IwcXRzeTd5ZnRRQXl2WFVI?=
 =?utf-8?B?QUdTdlhnNFJZazBOM29xbEttNzZUd1pwRFp3dDRSbTNvV0hjTkp0MHgwVGhC?=
 =?utf-8?B?cWpXRjd3TTUzTlFqTFZJdG1sdys2TGthb2NqYTczQjhnMjMrc29XSWJ0S0JJ?=
 =?utf-8?B?ckZJa0ZZcVhCMnNJUWQ4cGtCLzNac3NjMytyZDlZdEk0N2duMVllQmVoWXRa?=
 =?utf-8?B?VjdaWDFQdS9YU2ZDano1azJSVmRtcFZlQktYT1FQV0RRWWRybzhHZW05TG56?=
 =?utf-8?B?d0JRUytTb0RzMEh5cHQrNHN2UE5EY3p6OU84K05TMzVBZTA0cTRvazdCZmFD?=
 =?utf-8?B?WHdVVE9BeGV6UDF2TlFyczByVUFDeTVlNWZxQ1owU25Qd1d5K0V2QmNESThj?=
 =?utf-8?B?dWdwbk5mOUV5RTduQmdPMkFUL0pFSjlGeTdaZ0lpWEhCRjRGaXlxdFRUT045?=
 =?utf-8?B?R1pLWG1yY0NCbERQRUVOd3NKRGR1VHRNTXhQb2J0MzcvcmxQTUtKRWpnUmxx?=
 =?utf-8?B?dnBZa1B3SDNWTml5YllESVkwTStQNDhlTkh1L3pGR05TQkZGOC83SFg3ZzR3?=
 =?utf-8?B?UWFiZEhWanVwSU1NK3d0MHh3ckh1SVZ3L0k0YUV0dXVBSlNmZ0lMWk11RGpk?=
 =?utf-8?B?L1ViUXY3RVJrMnJWYWJ1dkJvY1dmcmRlR3djM1cvc2g4bEwralc3MUV2dXZZ?=
 =?utf-8?B?V3NYM0grQmpNc1BkdVVnaDFxVlErQ0hkdVRFc1NEVFdZUVc2K2JRaWJPOWV3?=
 =?utf-8?B?bzE2SGsrdFV3NW1JZkJRR3dOdktaU2JHQkZLbEZ4WjBTTlRiOFp0UUJVamhB?=
 =?utf-8?B?RlBrR1RmNzBuZm5SaFpEYTlYcEUrVnN6WFN3MXNzaEN5L29IRjRQUEU2dWF5?=
 =?utf-8?B?NUMwbVBMMG5VZnd4Y1YyTEhTYTg5czd4ajBFd0ZCamtyTHBYRXZJRm1YT0xQ?=
 =?utf-8?B?SnFyNCtSZTRhWTNUdUZDZjFMME9pTGNXUE5EaTBzMFRmNmJnUVVJN0Q1QzN5?=
 =?utf-8?B?aFAyMER6bHk2aUJHS1h2Z1B3Mis4OUxRNmRaVkUxcW5wVTA0b2dqckgxOU5U?=
 =?utf-8?B?WFg5QVoxbVpXbTh6cVJzSVFMYlFUTXlqenlyQnR6cWZTTXNCa0NQRzRDQ1o5?=
 =?utf-8?B?MkdzbkVlYzFwUW1xNmM4STRjRHFhRkF3TStKQmVNbm5JVVhaOFFOZm8velJF?=
 =?utf-8?B?aFc4R3BHWlF2ZEZ4RVhKQzRIeitjQXdDMjdhOG5NQ3Rvd25IeXB4MWhrc080?=
 =?utf-8?B?aEVleUYyNFlDdFRIeEovNXNaeE9pdklyQmtMdVRJWlE2eWtqbC8yb29kTXcy?=
 =?utf-8?B?aXhtWS9sb2hTTDZoVTZMSkRxeUNoUktmUGRDRkdEYlVYdGdIeGQxMjV3RUtG?=
 =?utf-8?B?U2oxWDk2TjlINkdwWFU3cXkzMVFjYVZoWmlZTkpXWERWMEQzWG84emNUYXZT?=
 =?utf-8?B?dVVwanZMdUNhanJla25PejNFMVk4bElFbGMwMEYwdjRseXZaQW9uUE9HNFdV?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J3oMbLySE7PJTcIPqu4PXGa2Pyx9u6MjLAxEMnJ6IEvFf0X8PEilvJulWFczxzeKrQP7Ef3pUsaFtrgI09L/EQ6sKhMAnJ/NM8HxuOZu9tkAfUKkaBBAMPXCryDPviG/Ri3H3E36OgOEMRnInV86bWlyjQQtVUNRSUoYNDzjAT1YlXuPAsDJb2uixRVCTRsAm+1Mh1+FSRypyqs62lkHv7FgH74kjeswPq+D7iI/aVG0RTNFmVqqakSMsxIzCmJb8/sKZ/n1NWtRHRvdKtEoDPDFYsOZnCQ3+x2o8FbJJIEjL0EFRf0wuZS8BVrQsBJM17jj3BW5xxmgsAA5j1ZwaOcVOkc7wtzNleXV8P0Vjk8UgGrIcvB9JUE+7Qpu5CL9xmZtCOp8KVbwY+FAShYPGo+I/miEZ63jrIT7QGf/TOqnSeccsMvoflHtIYXv1eUTUkWRQg8f5RZDyRYHQVRqaOuucb1SS7zfk+D6adiyXOqVUlun6hLUOTVZHtFXLwie2sjyoDUTvBO7Q4UuuTRmqAQ3uQSRS+5FKgBjODKzRtjPSTnkyNl+OG5bqQ7qaPygTpOXec8Prf7W/D4NuGJjEXOnzhOALWq213bKYwa6WJA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122ead1d-bf5c-4331-9d92-08dd823705ae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 07:18:18.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHn09yjr59DgDdJq7NRG4SfHZkOtvVZ0aCHLBRlrh+xHHsyGQIRyZo8LlaQzP8UuaUm8yZas+ibp5AmQ09YudA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4139
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=914 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504230048
X-Proofpoint-GUID: -1kWaWX_fjsM0Lmz4roTWOTZAFaBZ-X8
X-Proofpoint-ORIG-GUID: -1kWaWX_fjsM0Lmz4roTWOTZAFaBZ-X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0OCBTYWx0ZWRfXxC9XyJ9l9WAO pAiSWdGF82TLW1dIeOIu1zQ03fsmMRBNQFwTdLish0HMpuZMxPZDdu7udqXmeL2xIiMxSaBDwFP owpj42bM8Z0nZdoqUhVo928ch+nwXnSgbSI/5kd3VmjyAdjreVpXnxqly9SWn8yliFWf14JUNAe
 LgXm9GfnUW893cTzSZ3iGXkZLtA62YZZFnMSsMKnEH4i6BKi5fT4A/5r0BWJJhg5q30zLS0qz9S YMJpEfYRgyguTiyW1P55Cn/hjQRn0/K/EamgCfTxd3YIMUjAhxvKT4M6arjTgTZ5Pr2WkpxxVDt 30AETDZPIEM2M8zTHVxysWV+xENKMDni2ABQmPR+miIiNph+IUBCA3ItWAM+yD9T7ELIkCCiP0x zh3Hv/yZ

On 23/04/2025 04:36, Pei Xiao wrote:
> 
> 在 2025/4/23 00:05, John Garry 写道:
>> On 22/04/2025 12:31, xiaopeitux@foxmail.com wrote:
>>> From: Pei Xiao<xiaopei01@kylinos.cn>
>>>
>>> export some function via EXPORT_SYMBOL, convenient to use in
>>> kernel modules in the future if somebody went to use this lib.
>>> This is one reason for this library exists.
>>>
>>> Signed-off-by: Pei Xiao<xiaopei01@kylinos.cn>
>>
>> No, we don't export just because someone might need this is future.
>>
> Now modify it，Might it be convenient for future people?
> 
> People in the future might be able to save some effort here.

No, absolutely not. The reason we don't is because it enables more 
out-of-tree rubbish.

> 
>> And, FWIW, EXPORT_SYMBOL_GPL is preferred.

