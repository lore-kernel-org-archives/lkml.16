Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB32036F3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583326; cv=fail; b=M3FKkI6hR1XPme5E9IZlfDjJedHkbSLddlE7XLsVzf8eCUTYs5gnCZ8US6cDQYJR/OwDd9yOmAJdkTfQGnUNct202BE5R8qFyLCPi7526+TF8upJMxULxQJ6xzJHoZcsbverkcVm9TfwwYubwR/+cOvSN1vtodavn1hkAnOetfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583326; c=relaxed/simple;
	bh=sikthtVkgxV1kU6FYXsY5FYz+nIvkVSsGknXZ6dPByQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tjhExSDI6HdOW/RUX6lbScjXQyNm13ee2xVDmp41Apu0UoK92T6NIKuN4nfFo+ZNUhxhuGJNx55ZYpOl3vBrskVR90tpKkPZ+nJsoz3FdNtewywcOuMHoc5E/0bWGRdnT+44HfLN5Dz2e7Xeyhpkl0krSr4W7WSoRPKo86nkZbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wnrn1gW4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mgGMRTWL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wnrn1gW4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mgGMRTWL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5138Mi1n028819;
	Mon, 3 Feb 2025 11:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=sikthtVkgxV1kU6FYXsY5FYz+nIvkVSsGknXZ6dPByQ=; b=
	Wnrn1gW44BrfEb56aPBhXirs+pI3RHBX9Qg2Z17/wAHspiN/3t2M7WhaCyTMZ5ui
	tI8Q4xHyICJKs7TgRdxE7o2INCrSww9SVdhdZAycjzr67WRj+ICCBXK9YIbE9lup
	FR2MbtLSpAC/xqHul7xEO2dvkkrvSSU6D7CaZSPQdKpR5ijK4B3YTWbI8uaMhJlj
	UHq6OZ2eQJc+wYJyBVZfGSOCiY2LEYJJ8yFCBTLN0D92g10HBoqX9NJX23/t1wVA
	A1eyT/9Y9hOsGSMAFNEi++rIJ5qfhhjAhYXnsnnjX+cEVBS2vODj9leMboOXA2Ai
	XoAePjhjFaOconqaMV7MJQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhbta3d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 11:48:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5139hkxw005072;
	Mon, 3 Feb 2025 11:48:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fmhqrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 11:48:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePv46sUId53SYj/UUMo8/xKjTdCkuK/kWYEkn56+X7lshnrG2oPYoZf/JQrjWICbuuPwoT2HHXv2eFkcHsSEyIQs8z3XkdQLoVA8NzS8bOujcwyptzM6LcpnNylGyrNFtADYhSeNLbjFHPWzks5qKuN2fWpRG3JowtLn0GqSI8qr4Pi6HZQnWHDnfvr4e5VWTXMTrid3YEhRDo5tqArAbCihD8t78NL56lUAZLAPmpFKa1a6AubPtFGJVNsKcYKsMyitLOlu9m0KnIp+UekVwUlB9/pDLzqYpzL7/hHf8ycIoZuxGyXOlgIn4GmIUB1Kg8ywjCveJ56vcwTpI7IyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sikthtVkgxV1kU6FYXsY5FYz+nIvkVSsGknXZ6dPByQ=;
 b=lfLcwPLUKyWfovx+RUzfFVqBatJkMs59d0OGadtSpKPEriRwYFvBQbpeRxCOYB98AaWlTQGnVa6YO89Zj30xI3FI29IUn5AM8hgak1tFP6skbMi17NzT69cWEtlkgTk738uLEyhRBtONCkKDG2c5XQMExsTwEowFY8HwL3XCRABK3+wdZN1/pQ/MWvFMwq9UsZwqvHSYTPqc/xImF/8/xgItpSFf2oIi11eFLpDqUyo0BNkw2Yujb2tzLid+eAWMTDTegpix3uQ4KAzGDbaLMa2MC8s5EYuI+mWdURQnoJ2sR8Dj8l2CjnhCO0ICSKbBQFluqGvjbACPN46HKvJBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sikthtVkgxV1kU6FYXsY5FYz+nIvkVSsGknXZ6dPByQ=;
 b=mgGMRTWLe+OY/xheIjTbrZCrLn2aO2YRBBYkPLtWeRTQOLVNZnund94V94APTtWX381vvR0nH34C8E7OKDvf8FHWn3a/HLoKzi/hiPqFPYqKxorp8My9OsyJr5HwCZgYZ2LakyGNx7nqo0+g6T9Me1/5VcEncaGekHEC4o9zDWQ=
Received: from CY8PR10MB6826.namprd10.prod.outlook.com (2603:10b6:930:9d::13)
 by DS0PR10MB7901.namprd10.prod.outlook.com (2603:10b6:8:1a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 11:48:30 +0000
Received: from CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::b3df:777f:7515:d04f]) by CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::b3df:777f:7515:d04f%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 11:48:30 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Imran Khan <imran.f.khan@oracle.com>
CC: Tejun Heo <tj@kernel.org>,
        "jiangshanlai@gmail.com"
	<jiangshanlai@gmail.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] workqueue: introduce
 queue_delayed_work_on_offline_safe.
Thread-Topic: [RFC PATCH] workqueue: introduce
 queue_delayed_work_on_offline_safe.
Thread-Index: AQHbdi/+k4JzHyUGp0OwmZSG9rTjGrM1dqmA
Date: Mon, 3 Feb 2025 11:48:30 +0000
Message-ID: <28ECBC8D-FD58-4A32-A9DE-7839BD2A77D7@oracle.com>
References: <20250113043540.2396426-1-imran.f.khan@oracle.com>
 <Z4VZsFBn13nBnGjb@slm.duckdns.org>
 <eab73ac2-d9eb-4ac7-9e0f-9a02b81a31bb@oracle.com>
 <8715d5cf-1f63-4c57-b855-8abae8debaa2@oracle.com>
 <08fd6f46-1e85-4642-b2ca-17013cb7a9c9@oracle.com>
In-Reply-To: <08fd6f46-1e85-4642-b2ca-17013cb7a9c9@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6826:EE_|DS0PR10MB7901:EE_
x-ms-office365-filtering-correlation-id: 9e93de32-bc3a-4b9d-ac62-08dd4448ae14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWRpTERqTlk3ekRva1h1LzlTRzlrV3ZQUHZRVDNtRUtYK1dHSncraHlSZDlN?=
 =?utf-8?B?SkF3YW1Oclh4MlZSZFJhOXc0Z2Vic1dud29qUHFpbktDc0VyVmYvWWxoTWVS?=
 =?utf-8?B?L0ZZYzN3aVE2Nm1JZm0vODJtUmhsV1lFOXFSVjduRjg2YnlPalhndnhlYUsx?=
 =?utf-8?B?M0hWb0dCcmRYcGNOWWFBN1NGemFTRndyakVvbWoyMUM3R1d5cU44dDVmTnU1?=
 =?utf-8?B?M296SjV2S2d3ZWpXL0FyQjJkTUNEMTRKWHBGbDlqcEN0OEZEWGNNSzRkYkc0?=
 =?utf-8?B?RDc1MTNTSGcwdFhpRHFaZURWYzR0RlBnTXpJZTN4V2ZjVUdRR1IwWHZwanQ2?=
 =?utf-8?B?Z3NldVFzamQzNlVZTVFYcUR6Ukh0ZWpnYTdzYVlUa1JhOStLWXo1ZEtrampN?=
 =?utf-8?B?eHp5elhHV3BtQzExTlZXTWw5MUlZSXpCaTk0dVd1czRsOUlHWFpLRFpEQ25v?=
 =?utf-8?B?T0NXdnZtMDVLVHo5cDZtR1dZbmxxM0NKRlVPeDJZVzB2Mm5GYTF1RFMxNmtM?=
 =?utf-8?B?Y1BvakRkV2pFbmRQWEd2Z01tSkd3VlFIWktIN3RDTk1LMm5ZVVI1M21xUlE0?=
 =?utf-8?B?aXhHTnQwLzZLcDBEaFlMb2p2TDkxUktCa05GWVZmUHJPUDJKZENuS01PaEwx?=
 =?utf-8?B?dG9FY085Y1R6WjJWdjBXT0ZHWGUxcmg3aXVRMngzL1dwOUVxSXM4czZuaVF0?=
 =?utf-8?B?NVN2RXMwZU5uV0tJUWpGSndza3k5WUwvUmRFS3YxUWs1UTBEV29VTks4TXNE?=
 =?utf-8?B?dDFIc01nWE5id3V4VG9VSUd2YWVOSi9XampKSWZoNkRjYkhieUdFMXV0RSs3?=
 =?utf-8?B?MDkrWGJRaWtZc0RqKzgrOFExU2FDRk85clRPcnZSS3pRa29oS0V6LzgvTWQy?=
 =?utf-8?B?OHMyKzNyZWRjODJIaExJSnYyWFpzdUt1Qnk4K01XRStJQTVBb3p3Y0w2RDhJ?=
 =?utf-8?B?blpRUkRtUmZSTVZNamRkNU9hdVprY3hYYnRObWNzaFMwa1pXeW1BK2QrVGh1?=
 =?utf-8?B?OFhiUzQ0NDZSa0pKOEpBMERHRVIrc0RUR3AyR0s5alRXS25xQmVDcEJ3Z2cz?=
 =?utf-8?B?Qm95QnF1TisrdUxLZWJRSTRpVStodnQ1T25TcDloTG53UVBWcm9jSXVnSXJ5?=
 =?utf-8?B?NEhNZUhvMzAxaEdEUkM5bWxlMCt4T2Zod2RsMmo5SkRISEFRb2VwZGNReC9B?=
 =?utf-8?B?d2xjbW1FSkE4MzZnSDFsblhqRk9XOVE0SkpFdjluYkpTRlNOaWZLSloxbGgw?=
 =?utf-8?B?QlZ2R3EwRG93MzM5REYyelpJaGp6MUw1MUkzUU5Na3c3MHhEUFFOK3ZEb1NQ?=
 =?utf-8?B?TU1Kd0E3OHpxWTc2VDllZnIwTmFUeHVPWnRyMUxVcUFRSy9JcWt4cU01SUM1?=
 =?utf-8?B?Vi9sL0x4SUZybElIQkh2Y0pmZHpSSkk5cjhFRDYrd2N0em1QbVoxTEFKZEhV?=
 =?utf-8?B?QWhXTmhjMVVTVnVKcFdiZmtQbURNUFNvcDZyRE8zUm1SbEdZL0ttZXZCSVMy?=
 =?utf-8?B?QzVXRk05d3ZNQUt4aXYyVHh5bndxYXc0eSttMXN1d21UdDQ5MmJXdEtueXZz?=
 =?utf-8?B?YllvaWZwZGt6TGJkMENBVndQYjhJNDk3bjlGblpTSVlReFJDc1RKeWpjcXNW?=
 =?utf-8?B?Qm90WnZXZ1NxbXBzWFJTODJLM2RSZHpLZmZmL0IwazJMT01DckgrN1g4ZXpD?=
 =?utf-8?B?THFjb0dtaCtKNFNPdUFkYXBJUlpVbStTeHhDdXA0N0FLcU9MeXBuNzlISmhT?=
 =?utf-8?B?WE9ZQnFGS0lURnFMb3pXc3ZzWm84WEtXR051dUJlaS96VktHNFFTeVN0Z1BV?=
 =?utf-8?B?VlMyekFUZUJMSVllNmlWOEtQNkxlS0h3cDI3bmVUS2RiV0xxS2x0TGlKWWZs?=
 =?utf-8?B?R09XSEI2R0VkdXE3bmJrcVJjL2RWR3c4T2JuSVAxVnlKZVJwcC9CMjViOWcw?=
 =?utf-8?Q?ut1fr4XdK+WVTrDuGkpJDalZkVynupd0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6826.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T29RTnAvSVdYZFNBOGVZOWh6b2hGTWZacVNUeks1WFdOU3p2N1h5MGRCZ3hi?=
 =?utf-8?B?Ti85Ymh0SUNRVHpGNU1EMEtRbUgxTTRqVWwxc05CaFFTejJ5eFYrNjNET1JG?=
 =?utf-8?B?TjM5cTVBOFplamt4NE8vbmdJOTJNL2JNeHpiUlF5RHZmQWJKVGE2ekJrU1FG?=
 =?utf-8?B?NjJUK2Rsdk1BajVTWWE1OTh6MlJ6VW51TU1iaHAyeVdSVXpQcFEvQmhuU25t?=
 =?utf-8?B?TGMxbEczWnBac1YrMnNLRkR1aWROV0NxNjludVdQRkFCOHZFTXJCdm5CdTl1?=
 =?utf-8?B?bXdXcTN4bkRCTW82bE9meWtBUlVlWnE5SVN6dTRYaUFVV281cXpPSUorZmp6?=
 =?utf-8?B?YWZBQ3ZLL1gzRGZlRjlqanJINVBmdjROOFA0K3VRdUVmeGFoWGxoU2pGNi92?=
 =?utf-8?B?VEdDL3BWcExhMzM3aFRYQ1cxQ1dGUmVyODBwTWJCV3M0VTVlRDlGUGVEL0Np?=
 =?utf-8?B?ZWdQUEI2VGRWTjAzV3doTjQzWWF6anNqSTlObHE0elFPdmFuZ0hpK2hSTkpw?=
 =?utf-8?B?Q3RhM0c2dWhaZXViQTNweGlaZk5idkd4cG40QVE1YmhaclFIRloybnd4UXBx?=
 =?utf-8?B?M1E5Z2xMaGJjaTBZbDB2eENxMEFjK0hjWkh6SjVPK1pxZjJhWSsyZFhsQkxB?=
 =?utf-8?B?cXFKdWRsUGZhM3ZXOXNxaW9vWWc0bzVUT3l3N3N2d2U4TlpYYlFBdFpDRnlV?=
 =?utf-8?B?c3VMOVdZaXVBNkQxTUltVUYrMElrRjlnb0U3Q0U2OXhST0FGdWE2UXpXR1FW?=
 =?utf-8?B?SERZS0xHUmY2N0FJNExZZjdyQlBORG4zRytrUndIK0hYVVVzM3FPdmpRNS84?=
 =?utf-8?B?T29sSXNXVzU4aWw5c01lQWpubTlPUTB6TWdwMXloYVdyWWlQbkdaOUl4RUN0?=
 =?utf-8?B?enE3c3RiOEE0LytVT0ppMFR3cEZMcnU3d3JjK1dsM0l6TDNRa0ZPU2syNHQ0?=
 =?utf-8?B?UjlGYVYvR05za1R6T0VNbkEwUy94Z3k2TUc4bUhJSGt6eXUzQWNnZFJzZTB2?=
 =?utf-8?B?RWhmWFE5Q1Y3VjdxVjRrVHBBeGpZclVvcVNuU3c5YlcxVTR0QjZ3ckwyK0hO?=
 =?utf-8?B?T0lTZTl2bloyOEh1VGtNMTYwcFpMY1pURG9XR0g1Zi9XTjR0S3h5eFl0UTYv?=
 =?utf-8?B?T2l1WkJpeGpNMzRHOTExMnRtTVVRWDl2TXFxUWtBd2xaTHdObkNUVUZJam9n?=
 =?utf-8?B?dlJ5K0hSaW12OWRHbnBSUWZ4WThqb2oxRHczK0RqWmwrV1hrUU9QWDd5ZWJq?=
 =?utf-8?B?dTBUNkttWlBGMU5DNmlaVzRXOHZOaTZzeWFZZURmWTdGbE00RzVobUI0RUR6?=
 =?utf-8?B?R0wyc25TNjJLR1ZoTTZYLy9XempXcDNpK2ZzZXFPcTgrL0Q0SjBsQ3Z1cDB6?=
 =?utf-8?B?cWxvSnpCZWFZa3F2dHE4RFEwRWZnZkRsZkJibSs3aTdVZWphNENtZVJMZDls?=
 =?utf-8?B?L29XUFEwVzRiLzI1ZWJIYVlKRmo1RDZzN2NVS3RxZVArdjQrRmkrVk9ybmVJ?=
 =?utf-8?B?Nm42ZXEvN3NrRmFKVmRKeDR4TDl4TjgvbjkrUVBSWEk3d2pkejRIR2tpQUJO?=
 =?utf-8?B?Vk1leHdFSDFIVGY2c2t0UHZIemIraFBOUzhxUjdtaUp4RjRZZGtyQnNNMXQv?=
 =?utf-8?B?OEFIQk0vN3NyM1JnaFY0SklCMjNXSnUwT2ljM05nbDJUVnJuTUgzVGJxYjZL?=
 =?utf-8?B?UGNUUFFvbjNxcmJnOU1iMFNhOUtLZmhDSWlDQlZkbzFiUnZYRmVjSm1xSVFR?=
 =?utf-8?B?cU1Oa2lqMnNSYW5GcEVtV3VNdW9ZQTJCd3Fmd2xPUUR0S0hhcytxTTRyeGVT?=
 =?utf-8?B?NTYxQWowOHkzNDNxTnpjSlBIaFFEdjlrdjhRNGFTVnhmbTJrbm1xNm01eWU4?=
 =?utf-8?B?T1ljckVEOC9iL3paMTlMbDNvcDNGaDdYNjV0TzhjcWJXV1ViNk5RWVhZS1hN?=
 =?utf-8?B?bi9obWNxTWk5WXpqSWNMVW1ydlBsSnZsVUlNZ0ZCQTk1RDZ0ZkkwQk1VSU1S?=
 =?utf-8?B?ZEh6d1RiT0lFQlVxRktzV3F4djlTdmtXS1BMQlZNc2owWWt0QmNMZVB5amQy?=
 =?utf-8?B?Q1dLODZ1U3N3K2hkNWxrdnplclV3eHU4RmxtRTVKUHZtYmdGZ2tyWDdYVERR?=
 =?utf-8?B?S1l6eEh2VWx3UTNYbmxOMEowNkRtNHVpMUN3a2Rtb3IxblpWeWpodWZTbEJP?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8618403A6A493A459DF8E5306BA938F7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8JQ/NFXI6iTFUKxzppCvg/DG0jR/zmnEsGiGwYQmsaneWVG/tZ7MVqbtX35GcKtqcfW6Zx4Fw+cCuvspaBaLDdWztrA7/kKR7uJRgcRGpv8nMUueUNGprrJxnEF6jONd15xgHmOpuCgCpjorJtzgm6MF1U9zmLCECbxNwjx+kzrQ6eMuX5ZcsPhCUMWeqUpzlEwoIYA8hvG5Y9BzhFqKKP2XttvKxHlIxL6HAo/UMARo+2TC6HHD7uYb1VGZovGd/JOeovVnTU89TAeGV0BeixjkDe08F1PKHHeYbwsSByp5tzLEOz9O1HWbmHzW9+WUU8ZEZMRHU3rQ8akrYu6XPYihRaKrDZhGZSXLP8X2JY6enVY6mNuVDvAZDheGZATegsoVsnI4tuco1TQpwbLYNQ1M+h+2EE4EHuokyY7Chgms/Q7q64YqnK3YecRw7b8E8+SguHrMQEHUujFR0+7sdf9DOFeqBABGPQ2DsovXXl5/L7Bj5PGEAfo/EVOWciVp2aPSVqu4unMuXdGt9R+EdIjxPjf741A8JA7BTSEd//2mfq5ADXDbk33Hbyqezj6Owrczrhv3EsLmZKcXAlTFEuy8kJlh2wudHrbNuC/fyr8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6826.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e93de32-bc3a-4b9d-ac62-08dd4448ae14
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 11:48:30.5029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iE0Q+vZXQ/ObkwGZLN7Q3OSqiqjCnoiPI0C7SHlIFT03mW0CV0gZNQD+xlCJeDgqJIUGeQs29e/VlGEI1LwqKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7901
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502030089
X-Proofpoint-GUID: lA9kKJ8QqTD8vIcSHeeEf4gfwE-f2IEC
X-Proofpoint-ORIG-GUID: lA9kKJ8QqTD8vIcSHeeEf4gfwE-f2IEC

DQoNCk9uIDMxIEphbiAyMDI1LCBhdCAxMjoxNiwgSW1yYW4gS2hhbiA8aW1yYW4uZi5raGFuQG9y
YWNsZS5jb20+IHdyb3RlOg0KPiBIZWxsbyBhZ2FpbiBUZWp1biwNCj4gc29ycnksIGp1c3QgZm91
bmQgb25lIG1pc3Rha2UgaW4gZWFybGllciBzaGFyZWQgcGF0Y2gsIGl0DQo+IG1pc3NlZCBhbiB1
bmxvY2sgZG9uZSBiZWxvdzoNCj4gDQo+IFRoYW5rcywNCj4gSW1yYW4NCj4gT24gMzEvMS8yMDI1
IDk6MzcgcG0sIGltcmFuLmYua2hhbkBvcmFjbGUuY29tIHdyb3RlOg0KPiBIZWxsbyBUZWp1biwN
Cj4gDQo+IFsuLi5dDQo+IA0KPiBDb3VsZCB5b3Uga2luZGx5IGxldCBtZSBrbm93LCBpZiBpdCB3
b3VsZCBiZSBhY2NlcHRhYmxlLCB0byBoYXZlDQo+IHF1ZXVlX2RlbGF5ZWRfd29ya19vbl9vZmZs
aW5lX3NhZmUsIGFzIGEgd3JhcHBlciBhcm91bmQNCj4gcXVldWVfZGVsYXllZF93b3JrX29uLCBz
dWNoIHRoYXQgaXQgY2FuIGNoZWNrIGFuZCBlbnN1cmUgQ1BVJ3MNCj4gYXZhaWxhYmlsaXR5LiBJ
ZiBpdCBjYW4ndCwgdGhlbiBpdCBjYW4gc2ltcGx5IHJldHVybiBmYWxzZSBhbmQgbGV0DQo+IGNh
bGxlciBkZWNpZGUgd2hpY2ggY3B1IHRvIHVzZSBuZXh0LiBTb21ldGhpbmcgbGlrZSBiZWxvdzoN
Cj4gDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC93b3JrcXVldWUuaCBiL2luY2x1
ZGUvbGludXgvd29ya3F1ZXVlLmgNCj4gaW5kZXggYjBkYzk1N2MzZTU2MC4uNTdmMzk4MDdmM2Jm
MSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC93b3JrcXVldWUuaA0KPiArKysgYi9pbmNs
dWRlL2xpbnV4L3dvcmtxdWV1ZS5oDQo+IEBAIC01ODksNiArNTg5LDkgQEAgZXh0ZXJuIGJvb2wg
cXVldWVfd29ya19ub2RlKGludCBub2RlLCBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd3EsDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7DQo+
IGV4dGVybiBib29sIHF1ZXVlX2RlbGF5ZWRfd29ya19vbihpbnQgY3B1LCBzdHJ1Y3Qgd29ya3F1
ZXVlX3N0cnVjdCAqd3EsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRlbGF5ZWRf
d29yayAqd29yaywgdW5zaWduZWQgbG9uZyBkZWxheSk7DQo+ICtleHRlcm4gYm9vbCBxdWV1ZV9k
ZWxheWVkX3dvcmtfb25fb2ZmbGluZV9zYWZlKGludCBjcHUsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICp3cSwgc3RydWN0IGRlbGF5ZWRfd29yayAq
d29yaywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBkZWxheSk7DQoN
CkhpIEltcmFuLA0KDQoNCkkgYW0gbm90IHF1aXRlIHN1cmUgdGhpcyBzaWduYXR1cmUgd2lsbCBi
ZSBPSy4gU2VlIGJlbG93Lg0KDQo+IGV4dGVybiBib29sIG1vZF9kZWxheWVkX3dvcmtfb24oaW50
IGNwdSwgc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKndxLA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkZWxheWVkX3dvcmsgKmR3b3JrLCB1bnNpZ25lZCBsb25nIGRlbGF5KTsNCj4g
ZXh0ZXJuIGJvb2wgcXVldWVfcmN1X3dvcmsoc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKndxLCBz
dHJ1Y3QgcmN1X3dvcmsgKnJ3b3JrKTsNCj4gDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvd29ya3F1
ZXVlLmMgYi9rZXJuZWwvd29ya3F1ZXVlLmMNCj4gaW5kZXggOTM2MjQ4NGE2NTNjNC4uN2QzYjgw
NTA0MjJlNCAxMDA2NDQNCj4gLS0tIGEva2VybmVsL3dvcmtxdWV1ZS5jDQo+ICsrKyBiL2tlcm5l
bC93b3JrcXVldWUuYw0KPiBAQCAtMjU2NSw2ICsyNTY1LDM3IEBAIGJvb2wgcXVldWVfZGVsYXll
ZF93b3JrX29uKGludCBjcHUsIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICp3cSwNCj4gfQ0KPiBF
WFBPUlRfU1lNQk9MKHF1ZXVlX2RlbGF5ZWRfd29ya19vbik7DQo+IA0KPiArLyoqDQo+ICsgKiBx
dWV1ZV9kZWxheWVkX3dvcmtfb25fb2ZmbGluZV9zYWZlIC0gcXVldWUgd29yayBvbiBzcGVjaWZp
YyBvbmxpbmUgQ1BVIGFmdGVyDQo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZWxheSwNCj4gKyAqDQo+ICsgKiBAY3B1OiBDUFUgbnVtYmVyIHRvIGV4ZWN1dGUgd29y
ayBvbg0KPiArICogQHdxOiB3b3JrcXVldWUgdG8gdXNlDQo+ICsgKiBAZHdvcms6IHdvcmsgdG8g
cXVldWUNCj4gKyAqIEBkZWxheTogbnVtYmVyIG9mIGppZmZpZXMgdG8gd2FpdCBiZWZvcmUgcXVl
dWVpbmcNCj4gKyAqDQo+ICsgKiBhIHdyYXBwZXIsIGFyb3VuZCBxdWV1ZV9kZWxheWVkX3dvcmtf
b24sIHRoYXQgY2hlY2tzIGFuZCBlbnN1cmVzIHRoYXQNCj4gKyAqIHNwZWNpZmllZCBAY3B1IGlz
IG9ubGluZS4gSWYgQGNwdSBpcyBmb3VuZCB0byBiZSBvZmZsaW5lIG9yIGlmIGl0cyBvbmxpbmUN
Cj4gKyAqIHN0YXR1cyBjYW4ndCBiZSByZWxpYWJseSBkZXRlcm1pbmVkLCByZXR1cm4gZmFsc2Ug
YW5kIGxlYXZlIHRoZSBkZWNpc2lvbiwNCj4gKyAqIG9mIHNlbGVjdGluZyBuZXcgY3B1IGZvciBk
ZWxheWVkX3dvcmssIHRvIGNhbGxlci4NCg0KVGhlIHJldHVybiB2YWx1ZSBoZXJlIGlzIGFtYmln
dW91cy4NCg0KPiArICoNCj4gKyAqLw0KPiArYm9vbCBxdWV1ZV9kZWxheWVkX3dvcmtfb25fb2Zm
bGluZV9zYWZlKGludCBjcHUsIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICp3cSwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRlbGF5ZWRfd29yayAqZHdvcmssIHVuc2lnbmVk
IGxvbmcgZGVsYXkpDQo+ICt7DQo+ICsgICAgICAgYm9vbCByZXQgPSBmYWxzZTsNCj4gKyAgICAg
ICBpbnQgbG9ja2VkID0gMDsNCj4gKw0KPiArICAgICAgIGlmICgobG9ja2VkID0gY3B1c19yZWFk
X3RyeWxvY2soKSkgJiYgY3B1X29ubGluZShjcHUpKSB7DQo+ICsgICAgICAgICAgICAgICByZXQg
PSBxdWV1ZV9kZWxheWVkX3dvcmtfb24oY3B1LCB3cSwgZHdvcmssIGRlbGF5KTsNCg0KTm93LCBy
ZXQgd2lsbCBiZSBmYWxzZSBpZiB0aGUgd29yayB3YXMgYWxyZWFkeSBxdWV1ZWQuDQoNCj4gICAg
ICAgICAgICAgICAgICBjcHVzX3JlYWRfdW5sb2NrKCk7DQo+ICsgICAgICAgfSBlbHNlIGlmIChs
b2NrZWQpDQo+ICsgICAgICAgICAgICAgICBjcHVzX3JlYWRfdW5sb2NrKCk7DQo+ICsNCj4gKyAg
ICAgICByZXR1cm4gcmV0Ow0KDQpJZiBmYWxzZSBpcyByZXR1cm5lZCwgaXQgaXMgYSkgYmVjYXVz
ZSB0aGUgZGVzaWduYXRlZCBAY3B1IHdhcyByZWxpYWJsZSBkZXRlY3RlZCBvbmxpbmUgYnV0IHRo
ZSB3b3JrIHdhcyBhbHJlYWR5IHF1ZXVlZCBvciBiKSBiZWNhdXNlIHRoZSBkZXNpZ25hdGVkIEBj
cHUgY291bGQgbm90IHJlbGlhYmxlIGJlIGRldGVjdGVkIG9ubGluZS4NCg0KSGVuY2UsIEkgdGhp
bmsgeW91IG5lZWQgdG8gZGlzdGluZ3Vpc2ggdGhlc2UgY2FzZXMuIEkgc3VnZ2VzdCB0byBrZWVw
IHRoZSBib29sIHJldHVybiB2YWx1ZSB0byBtZWFuIHdoYXQgaXQgZG9lcyBmb3IgcXVldWVfZGVs
YXllZF93b3JrX29uKCkgYW5kIGFkZCBhIGJvb2wgcG9pbnRlciBhcyBhcmd1bWVudCB3aGljaCBj
YW4gYmUgdXNlZCB0byBkZXRlcm1pbmUgcmVsaWFibGUgb25saW5lIGRldGVjdGlvbiBvZiBAY3B1
IG9yIG5vdC4NCg0KQSBuaXQgaXMgdGhhdCB5b3Ugc2hvdWxkIGhhdmUgYnJhY2VzIG9uIGJvdGgg
dGhlIGlmL2Vsc2UgY2xhdXNlcyBpcyBhbnkgb2YgdGhlbSBoYXZlIGl0LiBCdXQgZXZlbiBzaW1w
bGVyLCBkbyBub3QgdXNlICJlbHNlIGlmIiBidXQgYW4gb3JkaW5hcnkgImlmIChsb2NrZWQpIiwg
YW5kIHRoaXMgd2F5LCB5b3UgY2FuIHJlbW92ZSB0aGUgZmlyc3QgY3B1c19yZWFkX3VubG9jaygp
Lg0KDQoNClRoeHMsIEjDpWtvbg0KDQoNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0wocXVldWVfZGVs
YXllZF93b3JrX29uX29mZmxpbmVfc2FmZSk7DQo+ICsNCj4gKw0KPiANCj4gSWYgdGhpcyBsb29r
cyBhY2NlcHRhYmxlIHRvIHlvdSwgSSBjYW4gc2VuZCBhIHYyIG9mIGVhcmxpZXIgcGF0Y2guDQo+
IA0KPiBUaGFua3MsDQo+IEltcmFuDQo=
