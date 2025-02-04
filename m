Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B312036FB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666983; cv=fail; b=nn9Ifk+fSARPaBY9ZAFgto0fMXPZhrjzkRO2pQKTmvun0293dmIElLYVCzg59WzKLvctXxqAVz9qqQOG/HB5+KJaoRw0ED/mERrQIyt8/Ggq4NVRlEuIGx8nen1NDaGwf1Y/uMJvLA/MHWBe7rq93LfLwkm6V31eOIj+aN9VpRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666983; c=relaxed/simple;
	bh=Czx2S63taFcy5cx2LSr++CmCpr3AAtKRHcLIU3M+84M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lPii6K/eClSTmwpssjeTg85RHIfRYMZbnKm6hdNBldLAZDSpGoYiJoH1aGEFsw6X92RMMZvzsXNwyNmmnzov5TvXVC2QicnmNy//qH41Dbwwa1k5ihT9hGi5nnzTHP+MOFij0/aa7jn9ceJHgybdcnQksWq2yyZCLdrGunB1JGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kONXwzWv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UbwxZ46m; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kONXwzWv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UbwxZ46m"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Ats3C019126;
	Tue, 4 Feb 2025 11:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Czx2S63taFcy5cx2LSr++CmCpr3AAtKRHcLIU3M+84M=; b=
	kONXwzWvyD8UzG+m9RtgXX/KFcsqeJ6J+DQ8lYOZburFGDP56aS7lgr+0eQWjzM1
	0g1q8k7hBnOJJJrWUAB7EArp8YcCCIQ79GEusyxBB6HKazV6iNKMqIWtalDZKJMl
	mg9n/0g4M7IL/6KwebszQ/ASBeVRQ5sUyuaMHnYVnIsF4vQ1h7PqC0OFq2QhCwet
	O9h9dXrEp3zG29Zoc9ypnF/OzJDA65PLQI2n9/vtqekiRUvzVzvymxKxNsRbTPes
	hUfAzgCPzNOFRZDJD/2EvG42cWXECDiW3ccBgOr/i+wn+yz8TSkcL35EmiWlKYnq
	Oma4MFcskl4qP6r//RkcrQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hj7v4e2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 11:02:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 514Af2U3029124;
	Tue, 4 Feb 2025 11:02:56 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p2ucn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 11:02:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtpgwvwa5LjWO8H0m1Svnh0Rf7oUmq6fhKQArCSka75GS38072DaKidyAI0csMCGOg5HmND2CcdwC8yr7QwoBOWkA3iA1WT2P97/f7YiJSDZMwSI6wr0xqQXABJe8BJOr4ply8MDBtnzeefEGwPCuEYqX713PzeDTlEfxbhZT6HwTWUn+ReeLJP4Ir1mftSfnWPvLcOWIGinLwdp6Fu2owXpGc1wh72OmlTadWbJRWsNiqwHmfvbFBUeTAKdNWHRklHqjX+/NeQgS8gurUeHeP4J5g6BcCHUFamD4S+iuNdgMZmPVYOUdIvD/yFOa9ho+PzDa181o8LsOYhxWzbBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Czx2S63taFcy5cx2LSr++CmCpr3AAtKRHcLIU3M+84M=;
 b=XQRBCLvSwGQKH93KMXPILD6WqqxG7fwUasX9BW8WXANyCDc4W7eGBTGw9mD5tDaXWV/zvQU7FcBPaEGLUqBmn7PDvwh95O+LVZD8IKlqosOWddWM8sNrZ+lync5E8zOz/d5SInmTEEh6oq4gZxZ41T5XccYK5kxMedXil6kudxjN2C71VQynX9iPXvCZhehJaI79e794i6oczJ9wt48Q7UkeJNPcQf+ZjZbAu5qBN+MTp5B0E9ieyISzlqjyDT5hYs3uu59HD7gFs32CiBA3CI0/XGMX9La4RGEnMPv2w0ay5Gxn/IKQnyc4nDT5m5sN+jJ3cdzISzgRJbVbBGx2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Czx2S63taFcy5cx2LSr++CmCpr3AAtKRHcLIU3M+84M=;
 b=UbwxZ46mdgPDfi9Sn6nl/5FN7/fzDd+VEFaE+I9av6GvKrPF3DWqqaQIHVsuFq9OfbTgKF5nBf1b/RTqN4KQj/QGZ6+cpgEG0RC8fF9w2fkEB1Go+oOg1S4K2odexrfk9DUMFm3KiHnVZ+rpXczyx/4ZRL4O4W3NwAh8XMSBsG4=
Received: from CY8PR10MB6826.namprd10.prod.outlook.com (2603:10b6:930:9d::13)
 by MW5PR10MB5876.namprd10.prod.outlook.com (2603:10b6:303:190::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 11:02:54 +0000
Received: from CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::b3df:777f:7515:d04f]) by CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::b3df:777f:7515:d04f%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 11:02:54 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Imran Khan <imran.f.khan@oracle.com>
CC: "tj@kernel.org" <tj@kernel.org>,
        "jiangshanlai@gmail.com"
	<jiangshanlai@gmail.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] workqueue: introduce
 queue_delayed_work_on_offline_safe.
Thread-Topic: [PATCH v2] workqueue: introduce
 queue_delayed_work_on_offline_safe.
Thread-Index: AQHbdsfU2495+/hV+Uyt7VrHRciUFrM2+xGA
Date: Tue, 4 Feb 2025 11:02:54 +0000
Message-ID: <7841E47E-8D54-4567-A660-4B108E0F4FFF@oracle.com>
References: <20250204054404.268888-1-imran.f.khan@oracle.com>
In-Reply-To: <20250204054404.268888-1-imran.f.khan@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6826:EE_|MW5PR10MB5876:EE_
x-ms-office365-filtering-correlation-id: 8d6ec836-ec3e-4035-9886-08dd450b79a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OVE5OS9SeFVvZFlkVGQ0UVVXMHZxa0U4dzY1SDM3dFlGYWdCUUprY3RiZFIx?=
 =?utf-8?B?VzdPOGQ1WXFVSkw1SHhoS3pZOFpQUDlUSlRGbU5QU2EvcUV3R0ZTTFk4aERl?=
 =?utf-8?B?d2dEOFljckFSU2JXejFiZkVGT3pnN1FmRDV0ZGo5cWsxdExmbnVkOFEwSmtP?=
 =?utf-8?B?cnA3OE80UGhrYlFQaHo2NjF3MzB6d0JjdkUxSVZheVVEcFVlQ1NnaHNxUXpC?=
 =?utf-8?B?OHhHSkFranlXMU9UWVlKSXRPWWVLMWdpTVgwc0pNT0NuZnMrZzFrTzFCeVBH?=
 =?utf-8?B?TnBtaVNLVjNoUmhNWlNia1FJVUFIWWVZN0YvWGJmbFNveE9iZTFCT3lMNlRX?=
 =?utf-8?B?VW0yY3pUbmdaUU9Ocm9rRUNiSk51aXRkOVI4ZHJTdzZIR0lYZHYwcXYwTWwr?=
 =?utf-8?B?NElWY2tLSnpKQmtDZTBXbHBNWUtmZGE4Zkg1ck9maU5sY2crdEV3VGowTWhG?=
 =?utf-8?B?L0RTcTlQUmszeFhDZTlYYTJzV3hDT2JaK25yL0c1bFZqUWpIbDdybzNCOXBn?=
 =?utf-8?B?UklOVGV4V1FacEVKUVJucWNrVm43c1Y3Q045cURoY1kydnlndFVZM2xpUlRE?=
 =?utf-8?B?bGc4ZlRvS2VvUmVDcmV1Q2ovekc0UGNyWU9DOG5qTHc4MmNCL0Y3SU8zMFVN?=
 =?utf-8?B?M05PZTBldlRkVzlxTmFYUWdJeGJoa2oyTlZXNUMvMGlnNFFPQ0pvd1hiTWNH?=
 =?utf-8?B?OGdqNXpOSDNSdEdvdnptTTRDbHlFL2FJQnQ2R2VnVXU4bWVIbnRWYm9BblFY?=
 =?utf-8?B?RjFULzNoZDVPZ3FuZytZYzVwNGR4eVdZZFhQV0JCQTFTOUpUaER2UzFGMSsv?=
 =?utf-8?B?T1RoL0o2dWl0amI0UGcxTTZmai8xTUNvSmlUZjI1cjBoZTBTMHdTZEFaemlS?=
 =?utf-8?B?bDNvNFZ3MVQ1SXFGT1kyR2J0WXRuNGIyMWwwWkxVcXJobWgzV1ZOMlBKUW44?=
 =?utf-8?B?eVRkOEhkOHJDOHhYdFdSbXFJb2E5bGtUSWk0SGcvV0tZVnBTSmRzSDVaTEJa?=
 =?utf-8?B?dHNSc29aVkxjVmpCSmI0dERpUVN1QzgzNTQ2dFFUM1NpMGg0a0RBc1UvR1J4?=
 =?utf-8?B?VFZ0ZFBXcUd1U3F6SU94R2xaMzZLYmtiYzVvRFlUZENSNU5wWnVlc2JHcnA5?=
 =?utf-8?B?MVdzZmFrNndjOWZ1c2s0VGpyTkFkWHRuVmhqZzJFUTdtcExpZVBYNk9SWE5v?=
 =?utf-8?B?dkpsampEbXFic29QdnNOa0tXZm5kZkhLaEdNNTBUVkJMams1ditCNm9ONGRh?=
 =?utf-8?B?M3pNUXVVaWxaaWxuL0Q0S0tpalZIaktrODdzTUJzZGVabi9CejltOW44VHBk?=
 =?utf-8?B?THd6RUNNK0ZiTE5Na21kTmQ4QzM5eUZsZnBRcnU2NkNHR05mcjZqQ09tSGlQ?=
 =?utf-8?B?Rlc5NFJGSGozSDlrL2RBdXV5QkZzYUxHUVNMamloVjBxaGdGZkJsU3cxcTB4?=
 =?utf-8?B?WlY2VUlEczZidkk0MUowK2s5RzlLeGpLVjNuWnJLcDJMMHYzZEhNZUphMWU0?=
 =?utf-8?B?bllmVmlXSUhDUWo4SGliOElpdnB3aVdBUnV6M0IrcEVPZm9TU3hjR0lsd0po?=
 =?utf-8?B?aVViOFpCK296cE5ueWI4Q2xjRlZxZ1prYVBFR0lWaUdONmNVUE9Qei9zNkJ1?=
 =?utf-8?B?QnI2VGVnVCtRYkZkK3BQRXExZVZ1UWxTT1NuZnVPYjdTeGxxaGJiMzZFeVRn?=
 =?utf-8?B?S216SU1Zb1VtQUpXV000S0lBR1AxK2paYm1OZ2wvcmdwalNLODJkTWM0bFV2?=
 =?utf-8?B?YkRSWUNHbnVDVGRTNzBTWDZjSnZvTGVXbVgxMTR1U2k5d0E1QkY1Qi9GNG1L?=
 =?utf-8?B?TVNXRkNCTlhQbUVZSFQ4ZzJYWUNsTXFTS2hHQ1ZLVTZxQlNwSFJvOFRITGkr?=
 =?utf-8?B?RTdTNzRSVW54QlNLRFExNnQ3dzZtUlN5U3M3SzZ5d2Z4bDJ4am1QdTE0SU1J?=
 =?utf-8?Q?RM+r74X6BLRs1iL+y5bTnkFGH8Zo7mvL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6826.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QTVMbmZVR2h3K3p1MWxhcmQyMHN6akRZbDZlV013WkNWVnQ0QU9mUW1WamRG?=
 =?utf-8?B?V3BWMktUc1U5bVVWUHZhRTRWcW9UVWNuUzJJdHhzd3lSand2azVuR0Y5U3pz?=
 =?utf-8?B?L0NYaGxaZkZtR1d3Z2NMMmtEakxZVEJkSjVMSEJDZ2ZSekw3aDl4a1Z6QURs?=
 =?utf-8?B?UVNtOGZCQjJ0ZGIxOEFsdVU5ZEp0Zk4xblR4dkh1QXZub21WWDV4QVkwaFJC?=
 =?utf-8?B?K2Z1ajA2elNIU3ppd25yQmFYN1U0eXQ1bU5odlhyRlJCM2N6RlQ1WVBkM1NI?=
 =?utf-8?B?SWhKRkpiRmxtdEx6RUN2cVZNSDJWVDhvRzRrQVJvOHBFNHdqeEE5aGUxK0Nv?=
 =?utf-8?B?dFpvRTdFdXhtSFdBN0R4cE13cmgvQlFsclloNnRmSjlybFRDRzk1eTJ3Ym1w?=
 =?utf-8?B?ZmY5d0NwRGlWVlNwb3VIRGVNb1dPWS9ibG42UUk3b1pQQ3FvdmJ4bUVhVmtn?=
 =?utf-8?B?em1FTjJxb3BkSWZ4WGRCYzczYUY5QVZSMVJsUTJPdHJBdDJJU290Qk53dHJJ?=
 =?utf-8?B?alZEeFR3bjVhcHBpWkpXb3NheUlJc2o4SnFiY0k1b0RxaTNnMlpLSHZoZnZY?=
 =?utf-8?B?anBxTVFZUDBJL0lWSXRLSjIxN2Jkemk3ZTd5c2o4cXYzNU5RVkkycG5Xb2pz?=
 =?utf-8?B?bnpaTzV0TnBmcWVHenR6VE5uU3NETmNFSklLaGtMVnU1Z2kzZFlLdzZRQUVZ?=
 =?utf-8?B?aytHeVlZSEhmZlZLSnlZTThGQmhTbnA4VWxDaFEwRktQY2JzYmo4KzQ1OEJk?=
 =?utf-8?B?clFWWmV1NDI3MFg4K1VPaHdiR3k3YnN2bE54MGk0VW01eGZNSnVDQ0dxN1JC?=
 =?utf-8?B?TjY0WkNYRVlyN0FuYi9QeUx4ck1UMUJCTUhraWgxL24wcHJPOVl6cU9welFw?=
 =?utf-8?B?QkZFWW1DdTh2dHFLQWxaOEMxM0RWMlhLL0cxT3phVkZlVUNjV0hWQXFyemt0?=
 =?utf-8?B?Y3Q4UDM2bHdLczBPbTR1OUw4RXRYdDRvcUl4MlZBOWtJQll3aWEyMDBsL3kz?=
 =?utf-8?B?L3c0VFFxNXljMzZBWUxwYnpFWVRGQy9aYUxmY0JHdmFZNjN4MTU2WkxrREcx?=
 =?utf-8?B?dlVJQ2pzQlEyd3JkWUZ6azA5WGZvcGRydmlKTjB5OUZYdjFHSDVnU3hlMWFr?=
 =?utf-8?B?MklYVi9yNHgvS09iRUxhUjEzUTUwQjRpK2hOSlBKYnpjbW9TUjNZMDNnd09T?=
 =?utf-8?B?L05kOXVOLzdyUDdaQ05QRERWcTVERzZoM0VSUUcrcEo0VStIVHJ5SG9JZmdN?=
 =?utf-8?B?cmtrMURTZlpOSGJXRXVDV3FkWUxNMTMwNWFZQkJDR0pOMFg0TS9oZFhxWXBF?=
 =?utf-8?B?bGE5azRFKzlFYVlUOStLbWozQmNncjVDL3M0QWFjbUFkdHJCKzZuRUVjRVY2?=
 =?utf-8?B?eHU2TU1TK2R4Q2ZNOGVKNU15WDdFNlNNTUNNUGVmVHV3ZGhKVHB4MWxTTmZO?=
 =?utf-8?B?R0lmTjJzcllQTmRkMFUvU0NZdTdOSVc2N3UzaTQxQ0Q1ZmZuRWRKSlEyQnBp?=
 =?utf-8?B?RTd1LzlDejE0UDlFeVNrczhINEtjeTFTMkpnY2Z1dzA4TVU5RXUrTjJ4RnI0?=
 =?utf-8?B?RWE2NytyRHN1MmpkT29nbmZ6YTNPNkN5Y3NTTGpwY3N5d1ptQlc1MlNLQUZT?=
 =?utf-8?B?VDkxV1lQc1lNK3ZmdkJ5em5mRG1tNEU1cjVLOERrWkxDU0wyUWQ4bW1NeVVG?=
 =?utf-8?B?eVk3SWhMMklDU0VpdEdGbUljbStkTE16SGlJSFdlcVFYOVk2U3JQSlBsb0JN?=
 =?utf-8?B?dWg0Z2luVEVpcFg4RnFrWGdoVHpzZkU1dmk4U3J6eUhCbEdxTnJCTklkTVBs?=
 =?utf-8?B?RTZQSUExQk1KU0JRS2hMcVZqYy9VdmNYT3VIalQ3RWRVNkFsK3UrN3lHeVZW?=
 =?utf-8?B?WGM3UWxKNGlIZ0ROdm1WS3VaWEJvUHZBdUNWTE5QYU9FaEMrcEJ0YXVQeHMw?=
 =?utf-8?B?K0g1TktnbVFXUittVVNxWEFWTlZEeTlNRENYTzdiSkg0b2RUdUE5M0hVZ1Ax?=
 =?utf-8?B?WGNMcjFFOGZFVmk2ampvQVlRRDRvOVFMRER4ajZtc3RDT2I1cWJLYjlvSEtY?=
 =?utf-8?B?dTYwYVlDYm1BamhUTmFZbDdLQVlaL0NTOWxCWnBrWlRTb0VSOVFwU1l6ODdn?=
 =?utf-8?B?V2F6VERvU0FYNHZQa3JVYmZXV2JHVXRrMERlR1JCVnViMFp4TkplWGhiU0xY?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED8E5755CEF9EC46A92735B7DA6144F1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lnhoW/8Wq0SMMXLPOvfO1AJVU+At34b+3ZgTXzsL81owFf4p9D98ZYEr1ELvfwMLovVvJpZcmc75YsohdkPF1jCFxMEdih/H3Vf/melGbIL+TEwU1OVwwJxhw13iRyTMkxxTHAULMwpBVjZNqKbRbAqL49/R+vwxDTu/PBnW0g/kCN8SJ894czSh1Cj/vcnf7LGQmcpSnzp1a/e7l8pqGVlW3x703gAOPIFABCXh8U0eUx6bmPO3uOCWszlnfbTh8suJs66qkUz3NQuPhg8TX+SzSarNtomBK9j/6BBE3hl0SPdOtpz6D6jYwc66qGDD5einmvhOsyqxlAlM80OIZrIJjidB7LtvoK7wK16WS7ILTO7TSOtmawOTzYNoRyhSovFrFNyd1pJNWCQ2SX0QBW0FUw0nWnDpke8Z7SetFrU9antI35D81dbJ1BO8nM2fYLrqLEyJuHytS8PXDXPdq/s6GUFTBfTJbInLwlNfLrs3vJmBJwEQYKnE45S6FwOCh5vdGDjsWn13dGdQLnqidYpAwcxR/4Jr1PZHc4W0rKF7IUaWrVa+GgvKhDXyvB+xIyMzbyWBU4/q3V1Oin5GZI+0g41DPkyzJbKRwi81jII=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6826.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6ec836-ec3e-4035-9886-08dd450b79a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 11:02:54.3941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDcUKy70Sinp7/enwUoZiqx4SD8qzHhbp19RZ2ex6BXjEIH5CfCQObn7OhDLY6KyokTmqw+AhS18NkQvS0YJcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5876
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040088
X-Proofpoint-ORIG-GUID: nVyyd58ZAad0eXHFE4mlRnGSoh10QXu_
X-Proofpoint-GUID: nVyyd58ZAad0eXHFE4mlRnGSoh10QXu_

SGkgSW1yYW4sDQoNCkxvb2tzIGdvb2QgdG8gbWUuIEp1c3QgdHdvIG1pbm9yIE5JVHMuDQoNCiRT
dWJqZWN0IHNoYWxsIG5vdCBiZSB0ZXJtaW5hdGVkIHdpdGggYSBkb3QgKCIuIikuDQoNCj4gT24g
NCBGZWIgMjAyNSwgYXQgMDY6NDQsIEltcmFuIEtoYW4gPGltcmFuLmYua2hhbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gQ3VycmVudGx5IHVzZXJzIG9mIHF1ZXVlX2RlbGF5ZWRfd29ya19vbiwgbmVl
ZCB0byBlbnN1cmUNCj4gdGhhdCBzcGVjaWZpZWQgY3B1IGlzIGFuZCByZW1haW5zIG9ubGluZS4g
VGhlIGZhaWx1cmUgdG8NCj4gZG8gc28gbWF5IHJlc3VsdCBpbiBkZWxheWVkX3dvcmsgZ2V0dGlu
ZyBxdWV1ZWQgb24gYW4NCj4gb2ZmbGluZWQgY3B1IGFuZCBoZW5jZSBuZXZlciBnZXR0aW5nIGV4
ZWN1dGVkLg0KPiANCj4gVGhlIGN1cnJlbnQgdXNlcnMgb2YgcXVldWVfZGVsYXllZF93b3JrX29u
LCBzZWVtIHRvIGVuc3VyZQ0KPiB0aGUgYWJvdmUgbWVudGlvbmVkIGNyaXRlcmlhIGJ1dCBmb3Ig
dGhvc2UsIHVua25vd24gYW1vbmdzdA0KPiBjdXJyZW50IHVzZXJzIG9yIG5ldyB1c2Vycywgd2hv
IGNhbid0IGNvbmZpcm0gdG8gdGhpcw0KPiB3ZSBuZWVkIGFub3RoZXIgaW50ZXJmYWNlLg0KPiAN
Cj4gU28gaW50cm9kdWNlIHF1ZXVlX2RlbGF5ZWRfd29ya19vbl9vZmZsaW5lX3NhZmUsIHdoaWNo
DQo+IGlzIGEgd3JhcHBlciBhcm91bmQgcXVldWVfZGVsYXllZF93b3JrX29uZSB0byBlbnN1cmUg
dGhhdA0KDQpzL3F1ZXVlX2RlbGF5ZWRfd29ya19vbmUvcXVldWVfZGVsYXllZF93b3JrX29uLw0K
DQpPdGhlcndpc2UsIGxvb2tzIGdvb2QsIGhlbmNlOg0KDQpBY2tlZC1ieTogSMOla29uIEJ1Z2dl
IDxoYWFrb24uYnVnZ2VAb3JhY2xlLmNvbT4NCg0KDQpUaHhzLCBIw6Vrb24NCg0KDQo+IHRoZSBz
cGVjaWZpZWQgY3B1IGlzIGFuZCByZW1haW5zIG9ubGluZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEltcmFuIEtoYW4gPGltcmFuLmYua2hhbkBvcmFjbGUuY29tPg0KPiAtLS0NCj4gdjEgLS0+IHYy
Og0KPiAgLSBSZW1vdmUgUkZDIHRhZw0KPiAgLSBGb3IgY2FzZXMgd2hlcmUgZHdvcmsgY2FuJ3Qg
YmUgcHV0IG9uIHNwZWNpZmllZCBDUFUsDQo+ICAgIGxldCBjYWxsZXIgZGVjaWRlIHRoZSBuZXh0
IENQVSB0byB0cnkgd2l0aC4NCj4gDQo+IGluY2x1ZGUvbGludXgvd29ya3F1ZXVlLmggfCAgMyAr
KysNCj4ga2VybmVsL3dvcmtxdWV1ZS5jICAgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3dvcmtxdWV1ZS5oIGIvaW5jbHVkZS9s
aW51eC93b3JrcXVldWUuaA0KPiBpbmRleCBiMGRjOTU3YzNlNTYwLi5jZWZjZjllODliZTZmIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3dvcmtxdWV1ZS5oDQo+ICsrKyBiL2luY2x1ZGUv
bGludXgvd29ya3F1ZXVlLmgNCj4gQEAgLTU4OSw2ICs1ODksOSBAQCBleHRlcm4gYm9vbCBxdWV1
ZV93b3JrX25vZGUoaW50IG5vZGUsIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICp3cSwNCj4gCQkJ
ICAgIHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7DQo+IGV4dGVybiBib29sIHF1ZXVlX2RlbGF5
ZWRfd29ya19vbihpbnQgY3B1LCBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd3EsDQo+IAkJCXN0
cnVjdCBkZWxheWVkX3dvcmsgKndvcmssIHVuc2lnbmVkIGxvbmcgZGVsYXkpOw0KPiArZXh0ZXJu
IGJvb2wgcXVldWVfZGVsYXllZF93b3JrX29uX29mZmxpbmVfc2FmZShpbnQgY3B1LA0KPiArCQkJ
c3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKndxLCBzdHJ1Y3QgZGVsYXllZF93b3JrICp3b3JrLA0K
PiArCQkJdW5zaWduZWQgbG9uZyBkZWxheSwgYm9vbCAqb25saW5lKTsNCj4gZXh0ZXJuIGJvb2wg
bW9kX2RlbGF5ZWRfd29ya19vbihpbnQgY3B1LCBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd3Es
DQo+IAkJCXN0cnVjdCBkZWxheWVkX3dvcmsgKmR3b3JrLCB1bnNpZ25lZCBsb25nIGRlbGF5KTsN
Cj4gZXh0ZXJuIGJvb2wgcXVldWVfcmN1X3dvcmsoc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKndx
LCBzdHJ1Y3QgcmN1X3dvcmsgKnJ3b3JrKTsNCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC93b3JrcXVl
dWUuYyBiL2tlcm5lbC93b3JrcXVldWUuYw0KPiBpbmRleCA5MzYyNDg0YTY1M2M0Li5iM2MwMzBl
NmM2YjE3IDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvd29ya3F1ZXVlLmMNCj4gKysrIGIva2VybmVs
L3dvcmtxdWV1ZS5jDQo+IEBAIC0yNTY1LDYgKzI1NjUsNDggQEAgYm9vbCBxdWV1ZV9kZWxheWVk
X3dvcmtfb24oaW50IGNwdSwgc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKndxLA0KPiB9DQo+IEVY
UE9SVF9TWU1CT0wocXVldWVfZGVsYXllZF93b3JrX29uKTsNCj4gDQo+ICsvKioNCj4gKyAqIHF1
ZXVlX2RlbGF5ZWRfd29ya19vbl9vZmZsaW5lX3NhZmUgLSBxdWV1ZSB3b3JrIG9uIHNwZWNpZmlj
IG9ubGluZSBDUFUgYWZ0ZXINCj4gKyAqCQkJCQlkZWxheSwNCj4gKyAqDQo+ICsgKiBAY3B1OiBD
UFUgbnVtYmVyIHRvIGV4ZWN1dGUgd29yayBvbg0KPiArICogQHdxOiB3b3JrcXVldWUgdG8gdXNl
DQo+ICsgKiBAZHdvcms6IHdvcmsgdG8gcXVldWUNCj4gKyAqIEBkZWxheTogbnVtYmVyIG9mIGpp
ZmZpZXMgdG8gd2FpdCBiZWZvcmUgcXVldWVpbmcNCj4gKyAqIEBvbmxpbmU6IG9ubGluZSBzdGF0
dXMgb2YgQGNwdSwgZm9yIGNhbGxlcg0KPiArICoNCj4gKyAqIGEgd3JhcHBlciwgYXJvdW5kIHF1
ZXVlX2RlbGF5ZWRfd29ya19vbiwgdGhhdCBjaGVja3MgYW5kIGVuc3VyZXMgdGhhdA0KPiArICog
c3BlY2lmaWVkIEBjcHUgaXMgb25saW5lLiBJZiBAY3B1IGlzIGZvdW5kIHRvIGJlIG9mZmxpbmUg
b3IgaWYgaXRzIG9ubGluZQ0KPiArICogc3RhdHVzIGNhbid0IGJlIHJlbGlhYmx5IGRldGVybWlu
ZWQsIHNldCBAb25saW5lIHRvIGZhbHNlIGFuZCByZXR1cm4NCj4gKyAqIGZhbHNlLCBsZWF2aW5n
IHRoZSBkZWNpc2lvbiwgb2Ygc2VsZWN0aW5nIG5ldyBjcHUgZm9yIGRlbGF5ZWRfd29yaywgdG8N
Cj4gKyAqIHRoZSBjYWxsZXIuDQo+ICsgKg0KPiArICogSWYgY2FsbGVyIHNlZXMgQG9ubGluZSBh
cyBmYWxzZSwgaXQgY2FuIHRyeSBzdWJtaXR0aW5nIHdvcmsgb24gYQ0KPiArICogZGlmZmVyZW50
IEBjcHUsIGJ1dCBpZiBpdCBzZWVzIEBvbmxpbmUgYXMgdHJ1ZSwgaXQgY2FuIGNoZWNrIHRoZSBy
ZXR1cm4NCj4gKyAqIHZhbHVlIHRvIGRldGVybWluZSBpZiB0aGUgd29yayB3YXMgcmVhbGx5IHN1
Ym1pdHRlZCBvciBub3QuDQo+ICsgKi8NCj4gK2Jvb2wgcXVldWVfZGVsYXllZF93b3JrX29uX29m
ZmxpbmVfc2FmZShpbnQgY3B1LCBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd3EsDQo+ICsJCQkg
ICBzdHJ1Y3QgZGVsYXllZF93b3JrICpkd29yaywgdW5zaWduZWQgbG9uZyBkZWxheSwNCj4gKwkJ
CSAgIGJvb2wgKm9ubGluZSkNCj4gK3sNCj4gKwlib29sIHJldCA9IGZhbHNlOw0KPiArCWludCBs
b2NrZWQgPSBjcHVzX3JlYWRfdHJ5bG9jaygpOw0KPiArDQo+ICsJaWYgKGxvY2tlZCAmJiBjcHVf
b25saW5lKGNwdSkpIHsNCj4gKwkJcmV0ID0gcXVldWVfZGVsYXllZF93b3JrX29uKGNwdSwgd3Es
IGR3b3JrLCBkZWxheSk7DQo+ICsJCSpvbmxpbmUgPSB0cnVlOw0KPiArCX0gZWxzZSB7DQo+ICsJ
CSpvbmxpbmUgPSBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAobG9ja2VkKQ0KPiArCQljcHVz
X3JlYWRfdW5sb2NrKCk7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArRVhQT1JUX1NZ
TUJPTChxdWV1ZV9kZWxheWVkX3dvcmtfb25fb2ZmbGluZV9zYWZlKTsNCj4gKw0KPiArDQo+IC8q
Kg0KPiAgKiBtb2RfZGVsYXllZF93b3JrX29uIC0gbW9kaWZ5IGRlbGF5IG9mIG9yIHF1ZXVlIGEg
ZGVsYXllZCB3b3JrIG9uIHNwZWNpZmljIENQVQ0KPiAgKiBAY3B1OiBDUFUgbnVtYmVyIHRvIGV4
ZWN1dGUgd29yayBvbg0KPiANCj4gYmFzZS1jb21taXQ6IDViYzU1YTMzM2EyZjczMTZiNThlZGM3
NTczZThlODkzZjdhY2I1MzINCj4gLS0NCj4gMi4zNC4xDQo+IA0KPiANCg==
