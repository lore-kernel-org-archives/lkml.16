Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0122620C472
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614522; cv=fail; b=F/X7LksfZFXAjLLTs5qWbWjDP7O9gmVSh7JhxtWoX03gTk+g/Ukk4DTrnLFiCHdA0jxRL+n66sEj0qJeANllkVDPPpGy0y2WuYdXbM8daXI7GLNtZ7fsaWh7E1y4lW2reTh91b57mCvTyWUZmSo+tWVP0nQeFWTZFq1sMr217Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614522; c=relaxed/simple;
	bh=PxhcG9ZCO5DpmYT3Yg1pY1ypfqhsv9PVajCBpJaOL5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jw5Zx8UnMouATSyTOwmqi/FTA5Xl+ot2kNYzg+QlSEhi5nUwglaqcj1jKIFoLPWNHM2ocg65A8OdLhds2rq9mLxtbTtEJk97NI/xDK6tw9JYL0CNeItvo6BJoYQI2jWB+fQA4Tjipdc0DyA+MSsSJcQ1jfDl2HkF9rNiVXZrues=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cU/6aRyG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zLGWNs71; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cU/6aRyG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zLGWNs71"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JMrKx009091;
	Mon, 3 Feb 2025 20:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jMPu2nCqzrgTL1D0mKo+oiUiNf8ztBYRqv4qigX7aOQ=; b=
	cU/6aRyG/eWx29C2Uyrt0a4rj3zlwmAYt7afnched8mtpr1fABXB7TLJKpBbn3Db
	Qver5Y0EusCyqdB7KfZZAY+BsONehVZi/kDY2F0QH9oOB2RPL6DrlZ/0ivzyJfpv
	SksHXwL/kZgJBB+2qoDh9LjeInl8caLrlc9shV8iznKJVLDpmGSe3S0EfA+pxrFE
	qBvTfwy1FCEcEWO59dH+AV31GiJjmNJE+LvBMbxwrFo+og6przVJ1EWmvJWhE323
	4FsBrTjJWeDRhaBcNxMkQW9R2Rc5Ag1g+JvXuoHahkDoFOqjWmbuPs3JmUWm9zCs
	p/pJKs5zDh5Don/L1v8ZFw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhbtbjr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 20:28:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 513JWUfC038947;
	Mon, 3 Feb 2025 20:28:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8e6v49h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 20:28:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEXTa/ZW4icLy27f5IeL+Klo+X2cVyhoMFf+ImsihZhO7j6fCileHkLAusq1zKtqTLdx4mpfrpucgPNxvD+7ws6KJpHjkug54RjVrmnb58Ec1DsgS0XzS9TFu6PMKT1ww+5gCkCTs4Hs4KNyoiJ8pNEwvRuw/vB0ShmobcF2hEN3C6JiMHi5/n4RpwhKUh8z0zZwhsDmln5MQnuuRhF+Ynp2OGBGX4teP9D9D/khH4XQpRsYh91DCoa3WftPKMJNjPE61vPg4ZHZwhnhfP0CDVRNoBoRMEBh53xYpaAo9OxyXjamA7nBLfIw6oiJDtjc0ctvUi+WBCYwlZjvGy5MhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMPu2nCqzrgTL1D0mKo+oiUiNf8ztBYRqv4qigX7aOQ=;
 b=KfDhFV8lAmSH5dOrIPraTfQpqV6Mjljo0x5Q659agf7/7E6Yb9EmNlbrnlDUlptd4G6coFIoW+EZi46cSC3nEZ1QuZWpZeE8nDzkR3XyhoM2pc9by+aG/mEpmEtpFJ0cTSIPBCILX5MqnZCK1ZnR85H8QveSkQKBfcH4JpdcffLv4jtCo+oKOqyeu0Vdi2XMG6/Hs0pmxYyhEXjswk8vSTw8aYo5Jq8wEhfZ53YvONX/Bmxi3ylZdgRufrYK13fADRbO0PtWRbnvHqFFGOxBqkYCRFz43Ey1ANYPMr3ykRT+1osqLTt8wog42eTOJTILkUBRv3mUguF8KK/mhOJglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMPu2nCqzrgTL1D0mKo+oiUiNf8ztBYRqv4qigX7aOQ=;
 b=zLGWNs71JVfbV9E3yP8r3VMWU8IL1A4PDp83cgjbT1piUC6Zh8vu6ApfRMhPUmW/h+GzCHtf6MdnEw5DHz8SuAPSaHaftGuTu+2tmlgNq4jWcLSsHo45Fkp8o1o5hOkb6V2ALLhwYDnVNdB9H7tesU4xIP7G3L8rtAeOV1Q/s2U=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA1PR10MB6073.namprd10.prod.outlook.com (2603:10b6:208:3af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Mon, 3 Feb
 2025 20:28:27 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 20:28:27 +0000
Date: Mon, 3 Feb 2025 15:28:24 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] exit: hoist get_pid() in release_task() outside
 of tasklist_lock
Message-ID: <nkwn5nap777ebra37cubkxwqitrcx6ykjflz7gixmsvls3risn@4ss5ogyupi3o>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-3-mjguzik@gmail.com>
 <eqoac7dyanvez62nc5ge3lfxxxbjcln3k6nrz4tkrg67v55sdb@sosx2sguy5f6>
 <CAGudoHGXR-vnYm-wMs5c8EE448UeuEps3ecrf_g22Mw=9oQtLQ@mail.gmail.com>
 <2f3gjvg6zwp2xpkhb2e36ux2resnjdtxuinbbgnr57jdqesrm6@oau2dgx63fxy>
 <CAGudoHE4vTUQtSnp01ziqCXVm_qw9sBYnKe2Gbwp6Kz5NOp3Gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGudoHE4vTUQtSnp01ziqCXVm_qw9sBYnKe2Gbwp6Kz5NOp3Gw@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::21) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA1PR10MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: c6984233-9202-4dec-561e-08dd449150c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djUyemhVTGJuRmFoSmQrUW1GQklFRG13RFc5UndKY0pleFBoUlZqeVJwQ0ZU?=
 =?utf-8?B?QzFheUk4TFI3R2JmdXpXRjRkZjJRSXdFOHRuRVZsTFI2NkNUUG5RNmtGMXN4?=
 =?utf-8?B?VnorVDZENkZMcDNhdDl6WUpTenZLQ05Jb3I3RlEzL1ZPVnhWU3RVaGRHanQw?=
 =?utf-8?B?RE1NRGMyQld1dWpOSEFSdmF3c0pFK2tkdkJ6eTlxaGJ4ckNmWUtPS1pmOVVm?=
 =?utf-8?B?VEdZS29jMmZ0aEpGM1JTaFdScU9sWHR2VFQ0TWdBUCsrd1B4bU0rSlE1elFm?=
 =?utf-8?B?U0NvQkVhU1hHT1J3U2Nod08wZy9hSjF0ckw0b2IrZzlzRzZVcVVKTkw1TnNq?=
 =?utf-8?B?dVB3WW9LQ2Zkc3h6akZYUGNiU3R6MFJtcnkvOUk1dzNhUlRnYzBiZk1sSHg3?=
 =?utf-8?B?bFpGby9HQitPL25UQlBXNGZMQ0Z5TjJpeGxDUkpUOW14MmdtNG1MRWQyRThz?=
 =?utf-8?B?a2Q4NkQ3Sm9EYVkxV2RSRXBKSjUxM2ZyZ2RrblRLRFVHVlNEK2Z3TkdpU0o3?=
 =?utf-8?B?VStvTDlJM2NTT2htQTJ4QjBKemhhR3NMKzRpVUlhWkJuSGNJTVNBcXU5Qndj?=
 =?utf-8?B?RUtkVmVWOWh1L2ZvekNVY2dZcC9TZEpLV1NUWm96dUxkNDhQNVBNNllMa09C?=
 =?utf-8?B?TUlldXIxSXlGWGhCRTRIMlZqN0lNSHZQUGVXWmNpVi9qZCtVSUxzK3lHTEVW?=
 =?utf-8?B?ZmJpL2psTW5BMytNUHpRV0w4N2F3bnJ2UUZyVWVJcGFvSWxDd1BBV0x2S0R2?=
 =?utf-8?B?MTlnV1NtL09vaXppYnZxQkZ2eENqQ3dHejlKZjgzRmRPK2lpWFo3aXMvUTVj?=
 =?utf-8?B?enhjUE5iV2dtQ3BCK0dlblNwdGNYNWJVNkkzb3dZNGNMZW52bGx2dWZRNEFB?=
 =?utf-8?B?WW52ZVNHOVFMbFZwNjNNZHRxR050SFprSnV6MStDeFJuWDFCRHRTNkNkSEx1?=
 =?utf-8?B?OFN0RDdYWlV3VTRKUFhYYURTZGdZcWxlRVZnZnp5SmE1TGR0Z3NHM2tXQ2gr?=
 =?utf-8?B?YStSYlQ1SFRDbmhDVnJxd09TVEtqRWo2TUl6L3VmdVJYbzNSMEl3V1hrTksr?=
 =?utf-8?B?YmptandGd0RxZFMzVklpSTV1aEpwUmFlVXQ3Z1Myc094NnNIaWFKK3JpbTNG?=
 =?utf-8?B?c0E1YzZFUDA3QVFEblFSLzB3SXdVaVdVSGVEbE5OZTdocTdKTEtOaU84dEZQ?=
 =?utf-8?B?UlU4WDNzRDhZN3lhekN2c1RhUjEwNmNMNm02Y1pKL2ZkeTB4VmZ4M3dwRlJ6?=
 =?utf-8?B?S2lOd0gvR3dHODlYTWN5ZERDNXY5VytYL2tuOHlYTFlnN3k1K3FWTXlibSsz?=
 =?utf-8?B?UFpFUUczNDhGdW16UnE2OHFaZ0VWS1hIN091NU0xVTNCaFpoSUJSRFkvWk1o?=
 =?utf-8?B?VnROQTJNSy9XcEJaWUpJenlwWWc2Y09IMHVQVnRXaGIvY0tQakl6Ky8xSGZo?=
 =?utf-8?B?YkNBbWRLTitITnVTRjJIWVpnSEZtMmFCL0VRUGd0amRyZk1BRmJNUDNWS3pB?=
 =?utf-8?B?N2tnVERBejNLdkZjaDVTQ2U1ZUZQY3YwUFF2bzBCRHkzNUVmeHlJb05TMjlx?=
 =?utf-8?B?VWNDSWVSYVNNRU5IdklwNmVUMWtOdk5KaGJUWXdtMkg0ekdEa1JQVVAzakVR?=
 =?utf-8?B?cVlNcmhhRFZIYjhIT3JBRzNoT244NHkvOWZZK2lpNjVjMXdhWFpXNFJxR1Y3?=
 =?utf-8?B?RFZjdWs5MmhiSUxmRndYM0k0TDFiUFdvakRWMWZQZmk0Rm9aTXgrcHFTbHYw?=
 =?utf-8?B?eXNVOVo5QkFGQ2RPQjNsT1JBYnZvNUNkbVVKZVRVSlVMbDFZOEhCbWtOTjk2?=
 =?utf-8?B?QXdCS29QQXE1c0RRUTdaVlRrWEJyRHRZMmhQb0ZkUWxzRWM1Um1vVHpQdmE2?=
 =?utf-8?Q?zG8SMH5YOhFRi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnY3bUdmS0p4T1FOcjg5dmtGdXk2QUxXdmpHcCtzd1BKT1E4eUlpTEJHdk9B?=
 =?utf-8?B?a3ZMUmZRS2V6SXgvQ0o2eWxMZUcvTGZyOGVRR3NBQ1RiWTEwUG96WFVPb1Jl?=
 =?utf-8?B?UW1LdHo3WW1ncTRiOXdFeVdlYi85YzJiaTk0Ump1SXpRMzhzRzVjUnY3YkNi?=
 =?utf-8?B?bUJudVplR1plQWpielpTdS9FMUs4djg1QXZZdyt6VmEzK3NLaEhqTkpiSzBT?=
 =?utf-8?B?ZVVVR0lmY0NXeUtWZWZXSjZjMGk1bzFHakhuVW5raUR6emVQYzRkb29GSW82?=
 =?utf-8?B?eVJQN1JJdU5jc0lxb1phRkkxbE5IWXcrT2wwaS9COXpYMmRkRVZlZ2dZemlk?=
 =?utf-8?B?WFUyTEhEOEdFY00ycXJySHU3QmNDT3h6aWp6QzdRSVdSdFBlak5HN3FzMDIy?=
 =?utf-8?B?U2Uva0Y2U0d0VkVscytBcnJwM1ZDbG4zbzd0c2ZRWUQ0TU1QNFR1bWEwRkxV?=
 =?utf-8?B?cEJKZml2YWtKS0pNUUpMcFRsNTM0aEUrY2hNUEgwM3pyRTVXeUd2RGovRkpi?=
 =?utf-8?B?VFE4THlaTUVCK2dtTDJSeEhTWHhwL3ZFRGxQcEo2eXRnUElvY2NVNlhFT0Nt?=
 =?utf-8?B?YnNjZVNwWkppak5ZTmJQL1ArWXV3MEphRkk1UnZ3VC82UFBxWHBEMVE2WGti?=
 =?utf-8?B?d2VjWHcxdWwrSElRZGQzWmZFbDErbSttMjBrOVZuUlcrai9BMGZ1NmdPRkE2?=
 =?utf-8?B?ZXB4ZjBtVEhIVGYrQWhaVmpKMzFXNUNiZjlRdWpmSmF2d3Y4UW5uYkp3R0Ns?=
 =?utf-8?B?clY0MWRWSVZUWTllZVl0emlnQlVEUlE0U1FJbmQ3RlY2Y0xZREV5QkRpbWd5?=
 =?utf-8?B?YmRUSnM5dk9xcE95U1NOQ0RqT3ZLMDFsRlgxeVJyM0RIUG9TRXl6QjA1WU5V?=
 =?utf-8?B?OHFQbE1mKzNrUUV5d0JWQzcrcFZ3VUFxRjh1NXRtSVhtWmN3YVBYYUswMFg5?=
 =?utf-8?B?QTZpMHFLT1U3MWF4YktGeS92Q1NRczA3ai93aHQrQTBucWU4MXlQSmQxNS9s?=
 =?utf-8?B?S2hNMC9Hc0UrTFFST2luKzJnVTBScHB2bUwzaDZiZnhFeDFRWWVxRFZqR1A1?=
 =?utf-8?B?VVR6bVFsR1dkWGRCVVR0eXJmUUVVeU5vTHF5YTFybEVGcDVuQWxqNHZKdmdr?=
 =?utf-8?B?OUhwK01JcCs0cDMrcWxzM0I4N1pjL1gyc3VXU1NRcjlEeHdWR1dnancwY2E0?=
 =?utf-8?B?eU5pUGNrL0hobm1FdjViUEgwY2hzbUNvMjIvMFdGUVZTSGNSaUNab1I5QktR?=
 =?utf-8?B?enNSVkVvaFZ2amNBdzZTVUVRdDJ1VHlxN2k0T2RyNWV3L3VRYVR0WlNQODIz?=
 =?utf-8?B?T2FrQWxWTFFkWnNpNWVLcHc0QUxqY0hXNFdhS3REQy9EQkF0ZHdQVkRKMllS?=
 =?utf-8?B?MnYwMkRiajVZTmJKY0E4clRsbUV0ZWdhQmlVM2lZbXhUQXd4aTdDTURLbmVV?=
 =?utf-8?B?M0FHRGpCL2RlY1NTeDdxMXN3djExU0YvMHFvcUdDZ3pudm9pdFBBdUJHVS9w?=
 =?utf-8?B?elk1VUdvWmxpZnNLOUpOYnVjbjAxN3k0a1VRUWw3ZWtKUElmT2lhaXJreSs2?=
 =?utf-8?B?WmtxOXA4emhhZmxxZ2ltWHlqWHgwTFAxM0YvL0t5TnRpZUxXbjBJdDlWZXVM?=
 =?utf-8?B?YVU4UisycGx2WUVmTjBlVktnY1lUa0JrK3B2TFlmZHlIdEN4NXdjSnBwaFBw?=
 =?utf-8?B?YjNIa0pmTExTNkcveDFlYWw1MFh3S2oxYUxvYi9Yc2xqSEtGOFY3djY4Ryt5?=
 =?utf-8?B?MDA5UWdtdXk3OW04Z3grWXkzWHJINi9ueWpBQ1BudlJvK0x6U0dNSHJmd1Bm?=
 =?utf-8?B?T0U5bllKbDc5bXd0R0NqNnZ5MzVEM1l1NS93TFJzMWJoVjRYMjIyd0dNeEJS?=
 =?utf-8?B?VjFSbm9hY2c2T1lhRjAzOUhnQU5NbFREY2pIdlhuSE90Q3VvMXZFTGVkZFh6?=
 =?utf-8?B?am5tbUdBNG5HdFYxUXdLenZObm1XdlJEZ2U3cjNkZUJUNGNJYVQ3UXVRZW5p?=
 =?utf-8?B?OXRVNklMYWd1bEd1MVpTalVucUpVTGs5a3htMXBLWWNUUEdYZC94QnJBTDQ1?=
 =?utf-8?B?bzlzTXJnaXdmUk9FNWJocjhvTndCN0lPL1JNbjViN0lPS29rVEdPWnZ5ZjFa?=
 =?utf-8?Q?fTh7wAhv8gLT4Y5l/jiBkB6Yf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9pWPDERpIZxsYhCI78uUhIFjR2JuIUX+/gBioRiCvnVFbYeelddeiYI2vD0q3NEzxdQdfvhrtilhEoL/3mHpp7BewI2WhE0bd5B3qH94z6cnxA7zIoCU+/INlQASeqrZFUao0QuUMDbBJlucIPfhsA4GBynq0x1GVs/KYWJzEj1BejUFVTbmUQg6Dr420x/WiogDkdFsSS2TlI6d6U+dgwCAQUTB/GnD4LDjxCWKfSkrArOT3fO9upWDE32e1Ad4TOP9nAa9fgqIRbLIR3fPfQj+a5r/XzWShGwRpfStO0UL/10Z901FLX3XXnFg23mT4GJ9r8Jh1m3C5Q9ZCUJ/8oYZ6s/dATdLjC28UnwBgdg2gwLCysKezJO5s5f2sVNm/xXu0Etme5tAV1pe4QLRew4lJIsxXZneJLKGnBrtD6X5LHPTHtPAh76Hn5jH/LWHiGvsNxz1i+oHCuMK3TIB5ABqJ3lZaz0pM+nmQsXhNwLGfiF9I6fzL2LIN2DXvm1vcZGr9kw3arnkk40Iu6LfKBHhLetKahMVJKItSVOorhnFvvYDtodZt3djZ0bAztqtmMGtGD4cYSEKJXbGLjpkdd+vGOWGdYTlq1KXUgXNbwM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6984233-9202-4dec-561e-08dd449150c7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 20:28:27.3671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaeNLCRdMuK+PQfGA9XQgxsmWcamwdkkJvnEQLRMW+HR+vujQzhidHF8aiJ/sZ/vmzlOnFZbUAKaUWoIQnMFuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502030148
X-Proofpoint-GUID: El7xRL535AbO38irKchmCYMRUVJ73Usn
X-Proofpoint-ORIG-GUID: El7xRL535AbO38irKchmCYMRUVJ73Usn

* Mateusz Guzik <mjguzik@gmail.com> [250203 15:22]:
> On Mon, Feb 3, 2025 at 9:14=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Mateusz Guzik <mjguzik@gmail.com> [250203 14:36]:
> > > On Mon, Feb 3, 2025 at 8:27=E2=80=AFPM Liam R. Howlett <Liam.Howlett@=
oracle.com> wrote:
> > > >
> > > > * Mateusz Guzik <mjguzik@gmail.com> [250201 11:31]:
> > > > > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > > >
> > > > Change log is a bit sparse?  I get that the subject spells out what=
 is
> > > > done, but anything to say here at all?  Reduces lock contention by
> > > > reducing lock time or something?  Maybe even some numbers you have =
in
> > > > the cover letter?
> > > >
> > >
> > > I did not measure this bit *specifically*.
> > >
> > > As one can expect get_pid issues an atomic and that's slow. And since
> > > it can happen *prior* to taking the global lock it seems like an
> > > obvious little nit to sort out.
> > >
> > > I would argue the change is self-explanatory given the cover-letter.
> >
> > But when you git blame on the file, you will not see that cover letter.
>=20
> if this lands, I presume it is going to go through Andrew who uses
> tooling pulling in the cover letter for each commit
>=20
> but i'm not going to argue this bit, just provide with a commit
> message which you think works and I'll use it

Your comment above states why this is beneficial.  Why not use a
variation of your statement of get_pid issuing an atomic which can be
removed from the locking area?  This seems like an important detail to
capture.

>=20
> --=20
> Mateusz Guzik <mjguzik gmail.com>
