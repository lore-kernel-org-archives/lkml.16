Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B630E26E6FE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396707; cv=fail; b=tddW4QVysQTbs9zEf3vYHPHFa+5f0uMKhgNN9OmQBnFiEE5rVf97yM10Uot7hQ8phc9xa7hJfCVOGRjepirbLT/HAXsCoxfwlUEoa/axdyG4LK20m7ohiwa/Npf2OLBneORZhImSvLxpQCDynrQ1R4GpRg9SZ4IMImxtCj7eRIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396707; c=relaxed/simple;
	bh=iU3fw0UE9Gkb6GlyJYwMmF77L5QvV5Duz/8XD5umGIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PkhTSbYrGbu9XuVO2xYclkdhXmSVTQU+iLIuAy+xZCXpn6Z5XkY8hy+zuaFx31A1TMo6a3E0xERfW7w6AVhZJjEQXCskw+R2h9eXaJK2QK9SBRNZ3XSkYsgnWV/a8FKUVsF5+gsKv7MFX7rORIrO4GFcP1AL9xnZB09Mfod7660=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k4yIbgR3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KhErgmad; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k4yIbgR3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KhErgmad"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561GfkO2020013;
	Tue, 1 Jul 2025 19:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iU3fw0UE9Gkb6GlyJYwMmF77L5QvV5Duz/8XD5umGIQ=; b=
	k4yIbgR36qzQb8Fy+a0kR5lERPqhast/KUzz6hm0VzzDuVHixVJnxCXSpHjHeNDV
	8xIsFEarRLvOY2laUoEmGJ3dUM1xfv2hNeUP+YWnd72i1SaoFtgpyDKjzOw02MTh
	rmrkcM+dppuyWPc6ee9prqV6cFSCK//wIo4LeYEN8djr0w4agAF7lyY6g6kGh7q9
	7vavnfOMEEqR2BcD/FRnKO+LDRQHmbiaI1l+zIdL4KOJfySVTgicqLYaoKlrC89h
	At49VcQFDH/HZIp8zXhSu+65+gsSn+ioPOZ+d8H4fVUm2/DLbw9ZFvIle545VEJE
	xGLg4CV+ccIBbYLwOhfbCA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef5g4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 19:04:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561I0oKD027539;
	Tue, 1 Jul 2025 19:04:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ua76tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 19:04:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvyQuAk+H99QqLhsOedifYHbzIpH+Au9Y9bI2mpNyTXWAy72a/L37c4GL/qugKGkD8e636bJ+kroutxdRRxaZ2TJJXXufb0LPt7itIkKE5yYV3qDl7Qn7gcRNtTp9GsWOSkbl8PPEeAFZdoDIuafba+Ep/nYb8QutFNZ47NPB46+IA/rIroGUFBjtiTkOysHt7tEVGhhoxQk7kOgMBFdqZYDC19tUdMtslaBKKhM82VtNHsngnbWncPpqcUkq+mgcLbvg6/sCHp03FlNqJzlkEY1Cobbrc2OEAK6zBYbTDsVovDWfUoL7JM8da2whh8P0aEuM2qw6uaxL6WeG9zjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU3fw0UE9Gkb6GlyJYwMmF77L5QvV5Duz/8XD5umGIQ=;
 b=r7kQ1ccq35OoYxeStkLaSe4e+/muFkDA+BSzve8SuPqhh14fIucqp4DMQYdJ13x7bkZieuiVL7IvjPb0doOYxA8XUi5/m0VIz43TtfCuy7gjaIHrJLTYgAZUHzdUr7jnjomJ4Yq98I5q1DilDsS41MqUiDOZi0xPJjhiWkh2hWcHIeplWwLIFNXz/FK3qL1CvOOhxXOihdhJXnXiig+ZhLBlHQP4GyVnZxYYvlCs4QX/3QhrrbYhiEjdTLeWe93WMv+1tV6VwtdKlKsIvYMs18gEZVC0ugPSxWV29LFlZJGx+/0mqvVw4aetl0VzXiFOp+ty9pF7r78KmfsV0c9ISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU3fw0UE9Gkb6GlyJYwMmF77L5QvV5Duz/8XD5umGIQ=;
 b=KhErgmad/xcHS/hKXFlq5pnf86mJ36rz/lC0H2w590KA5pTYMBS5vQx8jE8jGA2OYq+I0qTfPx/1ENUBcId9FB8ngFk7Hnjbib8joPvRt+neliiXVhMO2EVnKoLHp/SFf5zaps1k3lPCUypPVoWURbyLz8oWhzlRFavj4ehboKM=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by PH0PR10MB6959.namprd10.prod.outlook.com (2603:10b6:510:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 19:04:53 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%2]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 19:04:52 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "bigeasy@linutronix.de"
	<bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
        "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V6 7/7] Introduce a config option for scheduler time slice
 extension feature
Thread-Topic: [PATCH V6 7/7] Introduce a config option for scheduler time
 slice extension feature
Thread-Index: AQHb6mSxQPtmxCBqpkmPPh/M/KDfcLQdoTWA
Date: Tue, 1 Jul 2025 19:04:52 +0000
Message-ID: <EDF923BD-849D-4307-B2E4-FAED853EB6E9@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-8-prakash.sangappa@oracle.com> <87a55omh6q.ffs@tglx>
In-Reply-To: <87a55omh6q.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|PH0PR10MB6959:EE_
x-ms-office365-filtering-correlation-id: 89f9e6a0-cca3-4435-3004-08ddb8d22923
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWtoUHBLMnJUSXRaL252dTRQWlFCd3VIZ2hjUklTMjFDaTFqYTR3RWZJRVho?=
 =?utf-8?B?QVdlNDhvR1ZKbGhUaG02dDd3WmZxaUZHQ2VISW95REE0dTNBZDB1RldHdmtm?=
 =?utf-8?B?QUhjeXdlM3VVM1VtRzlZU28zb1M3cWNDc0dsaWpDSlIxMmk4c2puUjdQWG4w?=
 =?utf-8?B?SjI0aGhOWDhsSHhtc0Z6SHA0c1Z6RXhSZzVYNjRPWTZDcm5vblpJNE5OT3I5?=
 =?utf-8?B?NjA4dGRja3RjTEwyTzdCMmxCbS8vYUs1MVJlNG11NndFWVJwNTl5QXpESGk1?=
 =?utf-8?B?UDkrQjYwWTlXeHp3Vm01Zy8wUXlEVUY3ZENaR3VGWlMwV3pFTkliS24wdUFF?=
 =?utf-8?B?Q0RMMkpxK1BsZTZoalZjcll4aWMwbTIyYTQ0TFUreUNuMTh1MkVpMFZGNXdS?=
 =?utf-8?B?QUVlSkx4QXppU3k3bE1mZk5rU2dnUWxPWEUycmdrTDBhL0Z3ZGFVT0l6SFVL?=
 =?utf-8?B?Zzlyb0tnNVVRU0VnOERHQkZOMDJHMHQwZS9qUWxBblc0dHFqZ1k1Rnd4Tlpt?=
 =?utf-8?B?ek53NXR5RVQ2OVpRTkppYUNwVmhGNklKWURXRElXVnp3UGg2VEpNNVNRQjNT?=
 =?utf-8?B?ZUtZeHF6ZjNoUU56djB0MjlmRkpCQTZuYnM5NkI2anN5WkZ2U2U1Rk9CTW5w?=
 =?utf-8?B?T1JCNC9TUUlMQXpJUU00MHc0V05TeUtsd2RYYXVPYlVxTHNoWE92UnBpbWY0?=
 =?utf-8?B?cEhPN25obEw5cXNyM25ZUU5OUTJsOHhPOHo0dlhhV3hqZTN1L0NRS0ttblZ3?=
 =?utf-8?B?UTdkZlp4KzdzSENzR2l2clRFTTJWc25xNkpxVnprM1NsUU5GcGg5dlR6bGp3?=
 =?utf-8?B?dUxIUUo0MHdrWThmVzNNUkdLOVBCS1hzY1lTQjMzcmZad0Zoc3YxQ3ZrWnFs?=
 =?utf-8?B?M0VlQTFvQnZaR0V0NW12V3lsUjI2eVB6MG1WQ1JJNmExd3ByNXo1U3ZjVVJJ?=
 =?utf-8?B?M2JnVHZiRFZsZ0czMmRsdzlqdy8wMTBQMHNuTzdJYU1VbFNybHpCWG9paEJr?=
 =?utf-8?B?SFJMZDU4M1RBMjVJdFlTcFZ1K3hPd0JEUmRFL1hMdlkxVHN2bzhuQkIvTVlM?=
 =?utf-8?B?RFFVdEd2enl3czZUekJkbTR3N3QzL3ljcTgxaFNjbHUvUkE2cUw3THZKS2pT?=
 =?utf-8?B?YlgwaWN2M0RLaytjNDVPOE14c0QyNThEYWtBdnl4WlZFR3gwbitCT3Z1Mkw5?=
 =?utf-8?B?aGdSYzhOZmtwempqbnJiMGp5eHJXY2FwY1dIVWJzbXZ2MWU4aFFwcTJXOEty?=
 =?utf-8?B?WEhXK3d2bG5QdzhVR3l0M2pUNDU5WUZ5aWFHTE9aUHdEcXpWMUU4VTFLYWhs?=
 =?utf-8?B?WFJTL3hpVXNNQWpKUWU2QnYrVEFQWkNrU1Y2MjNVY0FmVml3Q2d6cytCVDRs?=
 =?utf-8?B?VVVsbGhKSjM2bXhXaWFsYXRvSnFyZGhTNHJ3M3ZReWtVU3ZCNUNIb3ozOFk2?=
 =?utf-8?B?RTAvd0h2SGZxTVdJcjFqWWJGa0h2VkRZL1NTSjNIQndHSnE4NWFtSWtzK25y?=
 =?utf-8?B?NVRkakxNSTErRkFNMHFkTUJaa0VUVS85U3p3bU55NE5QbVZIVkhvTERYcU85?=
 =?utf-8?B?dEcvSjFMcG5sdkFEbXlFeXI3TkhISjFlamxhL2xVZW5vV2NSTm03bzZaMWtI?=
 =?utf-8?B?MHZyU1NvYUU5QTVkSzgzZkVBYWsrRXVONmpiR0lxUlZsMTdkMFppcW5IVmUx?=
 =?utf-8?B?RE9OYXFPcnhCY1JDMVczcTBUVVpCdzFmM0lUaGhnTFNrZWE3aDVDdXlJaG9Q?=
 =?utf-8?B?WkRrWkNiSHR5aTQrUE1ldjBOTEhJeHNLVWd2VjhSRHJja2xvOGxuYmppR3Bk?=
 =?utf-8?B?MjBTNkhoQ001OVhxWTF5c1B2ZllTS2dxc2UrbHpWVkxJVVlOUFJBd0NLZitK?=
 =?utf-8?B?V0xUcmZQc3JwRVFoOUhEejZYNkQwZlpsT0d5UE1MOUk3N0lCb1dvWG15RGxs?=
 =?utf-8?B?NVplRnFlUXNKYmZLTlVtZmpPV2ZPOFo0cGpGZTRzZTE5cXVnOVNoeldzZ2pu?=
 =?utf-8?B?RnpGS0lDZEFnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SG5lWE1JUVFBcGFMZklyMzI2K3NuckU2akZMTm5zWjRtYTZPWWk0RTIvMFFI?=
 =?utf-8?B?V0JwcDN2T1BZVnpiMURKeFc0b0tuRWJRL0JhekdvV0xLa0x2dnAwUThOS3hF?=
 =?utf-8?B?cFkrOGNBRGJGdHdjQUJTa2xsVnEvbnd2SUovbTd1QndvS1Q3Y0JGYnhtRWlm?=
 =?utf-8?B?S1hCZnBVWlBqRDZvZTI0dUh5Ui93eHBTYkNjeU8wMEhwdnp2S20wdHE2WW9E?=
 =?utf-8?B?OXlEb0FtY0ZsL1pYV2RLZCs1aG1nbkhmUURLWVhML0lMdkNmc3UwQVVESld6?=
 =?utf-8?B?M2hvL2Izd3Y0TmVXNjFrRGlyd3FBNmVOZXJWNkRtRWdxRm1IaVVQV1BqVkVO?=
 =?utf-8?B?b2libUswTHRLeTlyMUYvUDJoK0pSdVlrS1VsWXJtd2tVclB4cSs3NmIvTGpa?=
 =?utf-8?B?MTUrQkM2Wjcwd2NWRnZ3VXV5TEdKNVV6Qi8xMmZNL2JxU1I5c0Z2dW9FUHJG?=
 =?utf-8?B?OTY0QmdDaEJXVnhJeXQzZ1M0cDRQT2liOWY5SUtxL2FQa3ZFL1Q2MzBsL0Vr?=
 =?utf-8?B?U2llZm52dWxneGVFTGxBN2ZmVDZMdlA0UVVjMWRBaVc1T3NQYTVqeWZyeTU5?=
 =?utf-8?B?dU9zbjY2azRDZGZHd3BzaWR5M2pxVWRsSkt0aG9NMGdoMzhkMVlZazRwVjJF?=
 =?utf-8?B?cDJIa1NEMHIwT0xPZnlvSzVSbm85WVpqZUlpVnRvdGU4dHpsVXU1QUgyKzlw?=
 =?utf-8?B?UFoxQnFIZjhWNGw5aEQvKzJyQ21aKzVCamtzSnk5WXV6WkRjTzNmaDE5ZUxE?=
 =?utf-8?B?R20rUlJxWkp5TklqMnFpM2VPSzBrL1hQT0g1UFMxQ2laWG1wNS9tb1BsTWta?=
 =?utf-8?B?YmRneCtUMUNid1M0SG5oenNjb1JWbmhQN0VFOGNDdHpJanZzZEVRK0FUakxK?=
 =?utf-8?B?WjJoMlhPcUx2MTNmeWdiNWlSdjUzbkpmaEFQRFUzQzErRTFiRnpDdTErMjZ1?=
 =?utf-8?B?cU9NNlJTQjZHdmFVYzA0TlVTZG9jbWZCMTVFTStEcElDYnMwZktCTzZOdi9B?=
 =?utf-8?B?UFZwRi82SWlwVlRjRTNuS2xvRXh2UEtqdWZWVkJJa0xITnZUTzdTLzNnY29u?=
 =?utf-8?B?N3BCUk1ERzIzalZ6ako4ZXQxLzBRaEV3NzRocXgzeng3ZDBzTVZ0ZUFjbTgx?=
 =?utf-8?B?alBOVzM1Umx3RG95dHIwWUdXYzRjK2FGdFV2dDl2cURLSzYzM1NicjJxN3d3?=
 =?utf-8?B?V2hJR0FjWkk4VVZEak5aYmZqMzJLL0FDRUlqemw4a0p1WGNUeHJLcUVoVDZx?=
 =?utf-8?B?ZjQyUXFnUE5iZ3Q5dWhhZ3hoNEY1aFU0NHVjamV5UCsvbXVQQTZGSDR6OHNu?=
 =?utf-8?B?Yk5leG1lamhqTU4vQ3VVWWlUYjl6aHEwSXU5MXlVUHJOOTMrb3d6MUhhcjJq?=
 =?utf-8?B?MjVDcGRXNDFVUTdBbDI2QUEvd3JxdC9BeTI1MkNTaFJTNDB6aGtFUTJnMzl6?=
 =?utf-8?B?QlJhUGQyV0dpU0plaWxWanV2c0NnRlp3Q1NTZ1ZFaUxSZnFZeW1MWWFSNWMz?=
 =?utf-8?B?UlRBU3ZRTzVidUthZ2kyUkhPRE80V0duak54T1ArWktUM1lvQVU5b3dQZnYv?=
 =?utf-8?B?akc4bVRFUkRFdksyditpM2xhY1FzNDdHSmtuTy9JaUNSSFRISDI5Wlp6RldT?=
 =?utf-8?B?Z0VVdTVXenVDcElVY0ZyZm5NY00zcE9wencwN2w0eFhNSEQ0dSt5SVhJeTY4?=
 =?utf-8?B?cGd5bnN0dkpYeWxqaUxvQ3dZUVV5UW9rMGNOQi9PZ3VLRVJlc0RMbWFCNEsx?=
 =?utf-8?B?eVR1T0hXamdlV1RDWUVVOGRFRG1ST3ppM0JVYlFCcmNyY1ZpRmJkODYwMkcw?=
 =?utf-8?B?YnorTWZyd25YKzFaUWpYRTRRQzJhdlM3SlQrdWQ5NXp5YVprWDJXY2tKN2pa?=
 =?utf-8?B?UEczWWRNazI2cW5oR2lTWU9uQ1B4U3o2TnFDSTBJaHlGQXlxZUdEYklDRk45?=
 =?utf-8?B?WFVieTNjWkpydTVUYWdWSk9UeFBKem05WHBuVFlCNEkwYjRWSjhJWm5OeG9s?=
 =?utf-8?B?WTJ5TUN6Mzh6YU5FUVQzUlpOaWhmZ0h5Z0YyZE4zZitNTm96WFdZMWN1WmVJ?=
 =?utf-8?B?QVUrSDdBY1dUcjBDUCtJMmFkcS82eWZzOHA0TGpJSXRGQkhFaGlJNjArR1RZ?=
 =?utf-8?B?c0tkZktwa0tjMzRxYjdIaHpYeHh5cEdWT2xqWXFMa1NKa0c2aDBoT2o1M2JM?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8A1DE4F6322254187015D972EB3B3FC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EHDByBCmRLgzhru1O33kjhrvCNMqXLIq72z4zUVKPC0E85EWssKJ40MeU2c5k3HCoWtOq/mBL4nfcGFOeaWrtQJHh3cEeJXE0wsC6M0UNqNAM1mCrqBagWwkagKHm95SZFtdVGIHL29ybX2N7UePDkXF4nk0bbjT0JyKTFEfjF/DfYq2lH5wupP0vywg/eWCAcIAYe0SSL12BnBokj58ian/QnTOw9jeQF+9f4+9PhvLXTdHNKGtKY4AZoAuHHRUKbiRM33BN80TGiQLPcSnlQv+OP2JJouTMWJ3kaJhpoMuZ80/g7LYEREvEzowB+Eao2rfaR71tD4f0ALKrYQQEIOyupCX5FzEJEmuga3nVTLs1Ld64c3iY7MPnhTLyREVd/ITboFHwFoZXoA/c7Ty7Fk4pWROouLMz8FkfWP+gHre9kFiJtl9RXZfpYpFV+19nOt0C0kSWoFUxkmOrqnmpOR2rT2nqVemYExeFbBhhUnP8LGE+v/lAh6PWshqSbhWMXhBP1SR6PL5zhwd+BNPnZpxJ0Y4hSC7l3iUoAjoFHvyBArc2eCH1mNF2uwiijOi44VUMXvTBitzr9Lr+iuS3AEB5vjpbJHgZJRp4c+EqaU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f9e6a0-cca3-4435-3004-08ddb8d22923
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 19:04:52.8793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2PVgfogEuDA0I0CTS3FUqlji+ODODMQNDZ7/ku//8htnZtNYzD+mFro//wbCleKsGzinsJMzKe7CkFFfxlH9cAl61rvEaHHZJ/xbTzN443c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010131
X-Proofpoint-GUID: gXzaJ37ppT6bu-qq3vfF_LUG8TYfkohM
X-Proofpoint-ORIG-GUID: gXzaJ37ppT6bu-qq3vfF_LUG8TYfkohM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEzMSBTYWx0ZWRfX84RwO1OZOhkX XmqdKb9485zGot0hO6+2AvW9EUSRqKjsE2WJ/Lhgl3KC7SXjVEUgMmPQvcBhY2UXQvqa64MdE+q /km9oTASiGc/Ur34xE4Da+/jCM3EZsuPZ4B4Zyr8j53hkuICMYyC+iqzp8pqYQQvHyLiQsL0SjQ
 RM5wfKuPlHRTBNYLgE1tv+djfKfNT9hl8SxjDbtw9a2XbW0IMV+Ysqkgt/Ctl1ZFR/7fVkVyJwW fZuMVmeYeV1MOt+iww4kX2PoFUk4E6Z+aja1YpXpH+6JTOopqkip/Bv71BAJz6UCBKO40Xt3ukM tyVavBY7VWgvUhK4HJgfOTPKh3/qkONoGzeEQDh5ifbm1JhvWyhcjjuGRal30y0l741lv3yq7Dk
 Fm7zjX2VDtyVZ7B/jwMXyeaCYzSHmQmf79UAOcTeHBcJnD9p3EXl8NhBZGHYyg08kvLBCdyl
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=68643159 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=neaqprkmngWeDQ5Pkn0A:9 a=QEXdDO2ut3YA:10

DQoNCj4gT24gSnVsIDEsIDIwMjUsIGF0IDE6NDbigK9BTSwgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBKdWwgMDEgMjAyNSBhdCAwMDoz
NywgUHJha2FzaCBTYW5nYXBwYSB3cm90ZToNCj4+IEFkZCBhIGNvbmZpZyBvcHRpb24gdG8gZW5h
YmxlIHNjaGVkdWxlIHRpbWUgc2xpY2UgZXh0ZW5zaW9uLg0KPiANCj4gVGhpcyBpcyBzbyBiYWNr
d2FyZHMgdGhhdCBpdCdzIG5vdCBldmVuIGZ1bm55IGFueW1vcmUuDQo+IA0KPj4gK2NvbmZpZyBT
Q0hFRF9QUkVFTVBUX0RFTEFZDQo+PiArIGRlZl9ib29sIHkNCj4+ICsgZGVwZW5kcyBvbiBTTVAg
JiYgUlNFUQ0KPiANCj4gYW5kIGhpbGFyaW91c2x5IGZhaWxzIHRvIGluY2x1ZGUgYSBTQ0hFRF9I
UlRJQ0sgZGVwZW5kZW5jeS4NCj4gDQoNCldpbGwgZml4IHRoYXQuDQotUHJha2FzaA0KDQo+IElt
cHJlc3NpdmXigKYuDQoNCg0K
