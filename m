Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117347263D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751574701; cv=fail; b=FiRyFIuyXjAWzYfoHTNSalQQju/QRYX5SWJQv9kmTXWDHXCJA/Yrp7kOFVNy/ojYcXMlJ+QaSDESajBdjDX6cL0IDrh00HMwMQ6NJUANG3eX9JmulnyAonIswZXvTfGKYb8E0cEcDsuq5beE7cdREeZ+A4zn6EzWGNQIrQBsbk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751574701; c=relaxed/simple;
	bh=X4rni4OsIkJrB6sXhqdbAHZ63iMTwfB5HYeAVApqTb4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SawTaVBIhz0rLitiWmiu2uikJOcGZ3qDb3msch8EBBa8MgR13GHWGR9nkedeLqyRumls4+hAeJbLnvNGzUXk34e2slwtTvr9cmHVmUmnbMrZ1wTvD/fFpSomdJGBgsNh4SqWUkl58e28Locp9JECBC/RGy6Vf63NGfHAprfiXrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ht5Ajia1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ToH8h51G; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ht5Ajia1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ToH8h51G"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ4de007610;
	Thu, 3 Jul 2025 20:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=XuJ/jpCDjC4HmR7w4L03fdNc36UD6gsZe/xU46kkyhU=; b=
	Ht5Ajia1qlSQAewms/NRQFUlqySr/Av23+m8bGftNFygcDN5Icph8aLY/NUL8ASL
	jwRlRV0gf6cwoiPLgscGvJoABkSBeHUliJ26uOoyvHkFL7uKPEyJeKs+FOfEa3yQ
	EnU2OE3bRH6BTFgaP//yzV8+kcT7ps+YklxANzmckfekeuYM8CwdRTA7efGOsTpd
	BPDQsbkpM54Dv/YrkjOjTXmDC0cJbuX9taky2+pc9PgixWTIfmlTPhNn/zSlAj0r
	/EaSa3IdR91n+ukoLDTmTy9SfAs3Iwwl2IjrHihKi77ZldtjR1EbULO1jro9eaHr
	8KVQf5fLxZe/mlSCOXv2vQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfhq5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 20:31:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563JNWW7018759;
	Thu, 3 Jul 2025 20:31:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ud3a0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 20:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8RvhRFO9pvQrNWHNN11nyrkC0/BIqSESkIWlleo1yANkGIdRX7wpqj5Yy/ESO7Mr/34xDPyQgzsDKKYI3iyhYQF2QlLn56q5nobu824D14VEQdKswlOUM6yKRwInyQLeUR7D3UGfHePY5m1RFDsBWoXoaXEZOtp2M+kwSNKh6+069ib/HSQpsJcKicSUFQOhTP7X6rX4jK8RQEfdJdXW4MCH5zU11x8gd+vxDIUUoypeywsSI70DKBWSa9sH/3lbKNH3d4JsYfV+BEav9DJ83Nye7K+LZQcHw0crGXynCoZMfsXawKaElc1JC90xhCVRjvA2zQ5FU1J4sfNnaLz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuJ/jpCDjC4HmR7w4L03fdNc36UD6gsZe/xU46kkyhU=;
 b=Nk/PC8UWxV59MPmuSRjAKWJ0UXNzgPxzAVoo6YjIKZdxEy/e3ZVzIMB52Fc1SNrA1hbbUBWIaC1kVsozDjF+YaKnXbvIPPbjdgVc/3ZvO4rRBBOHh41Nou6lH0aUL371zGHf34va8iEBXMIo/sk5wtsA514XtQdH/57YFCVslkqtXp0lRHFNRMZ4Sl5ZwE3ulOeFB4eJyuHhJYuqQLcDk5jbXkc/XrF4uqG74C8kceMtxycpZFKq+YEg0f9kwMwtqvysEV3WgXBdSAFfEIVpZoSNpNhe7lKZ4DV2+ac7vzhjg1kjrxVhSi7vPm1S7O+dkk/Zvew9+N3no7WKCX8row==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuJ/jpCDjC4HmR7w4L03fdNc36UD6gsZe/xU46kkyhU=;
 b=ToH8h51G2b9uHm84wPl0cc3Qs+elgt2duAbO84P+m1Lt2/0npOs21BvFaAvY7sQIjSzoiZUn6Ki4DMTDIv/2zMHCC7xLChLgBPjb9FkjS/AkVuaQP2SlHzfYQwxJbz+CxVNklB4bD1PYwlBzuyET9ci+LiYh/xQTLB6P0K3xsiw=
Received: from CH3PR10MB7959.namprd10.prod.outlook.com (2603:10b6:610:1c1::12)
 by SJ0PR10MB7691.namprd10.prod.outlook.com (2603:10b6:a03:51a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 3 Jul
 2025 20:31:31 +0000
Received: from CH3PR10MB7959.namprd10.prod.outlook.com
 ([fe80::2c43:cb5d:a02c:dbc2]) by CH3PR10MB7959.namprd10.prod.outlook.com
 ([fe80::2c43:cb5d:a02c:dbc2%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 20:31:31 +0000
From: Himanshu Madhani <himanshu.madhani@oracle.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: System hang with latest kernel v6.16.0-rc1 (rc2 & rc3)
Thread-Topic: System hang with latest kernel v6.16.0-rc1 (rc2 & rc3)
Thread-Index: AQHb7FEkaNC4t/2C90um6OEloUUqtbQg2DIAgAAB8gA=
Date: Thu, 3 Jul 2025 20:31:30 +0000
Message-ID: <32ADEBBA-B7CA-423B-8C06-44F460D84209@oracle.com>
References: <bf397c89-bd76-4559-908e-cc921e554b71@oracle.com>
 <875xg9t44d.ffs@tglx>
In-Reply-To: <875xg9t44d.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR10MB7959:EE_|SJ0PR10MB7691:EE_
x-ms-office365-filtering-correlation-id: fd4e4674-edba-483d-1325-08ddba70983b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qFM8MMO8Ev4+hlSmHxRf3LOubhUSnrWxfIPFrKZyiLrvSRt6e2PVVxuUj5Uq?=
 =?us-ascii?Q?9JYsS6xgPEVRVUqeXHxeCt0iKijniMkJA2x5+AdlQmQuNL1CGO8jySS1bTye?=
 =?us-ascii?Q?wm39mNy7lRk4GH0skuoeCpI/RyHuJ/rKRTG809UN/jdTJGMAvvXkQ7in4h8n?=
 =?us-ascii?Q?o3cqdsrttZ1URgWgnCkZd+ASbQJR8IcZTnLaeXSNaIF+Mu2Yr+y/MgDeSu2U?=
 =?us-ascii?Q?+IW+eL4WNiWIJPRQAhL5ttoOzUNZ/u7+KhGUJlZdQ5HWRqQl672RErml767w?=
 =?us-ascii?Q?DQdxSwwy0ywil45dt9rCJi5hcHzQoKJrsmX9sUqe+dWAKbIvD3y0eYQqhWsU?=
 =?us-ascii?Q?Ai4F8YR2VQNw2LxCAltm3My02sOYr3l/TUKQgKtMO+Pgf0w5JgOktFip1QEw?=
 =?us-ascii?Q?KUpHwyTq1vjaySGypC/6NpQU17aT5ZYyKxR+R9Dw384CS1+i08ZZ1eOIEAMg?=
 =?us-ascii?Q?NAoAdCiNQFnaCL/7sXEZWGreKMpoNBEjth8WwZ7zy6e6MH8SmCoCfZ14ay9y?=
 =?us-ascii?Q?n+8T8LHhhq/bkdz1htGIYsedNfw+VvCYm6X4qoM4UeCfBO7RNorCfivdwYat?=
 =?us-ascii?Q?m5Sdo6795WjuwkB6jV5lqx3LFmpUt+TfTdr/NSQeQytXrW2XY+ufgGOD8+XR?=
 =?us-ascii?Q?4ab6hbUrtrO7G7wB6u/s6QFYd1rjTXWZ+asc6YTVYfaA5WtdEDcXN5LmaFsm?=
 =?us-ascii?Q?I9WzE/KepWj2FC4GBEQ7p2p0VMVvFT5RTivAecRTIKm4PoKwL5rL1eUSt4v6?=
 =?us-ascii?Q?XGG5+0WzTFdtSBcfChYs9T6fGPqQHGekaSBrRPOK1bR389Qh9m/wnUJqWlkr?=
 =?us-ascii?Q?EUimhglIeMNXYhHWPi5VTtg8LzHwJxw9sv8x0+PskSvNfxtTTZ5r5S8B7+2Y?=
 =?us-ascii?Q?NL+h/HIzXr8XWnxVxSTk038Atg5Ur5PT7kt5XNBH7iu0l5wgZdSqNaekUUuB?=
 =?us-ascii?Q?1mhe11unpYoadKajzy05XQsbpIOPjoeaEuNpurwGMGuiSdiW4Ahs005Gg8jE?=
 =?us-ascii?Q?lUe1AN4vq02KC6xFkLztwHy1qjI0caBtQsmCxW1IcvnQ7jg/DsrIyDMF88Xp?=
 =?us-ascii?Q?Ex8/eBbyKY4rbLS4ZJk0HZ1rrlIE71m7lQmwILjxHCwlwS1K9KX45oCkh6fy?=
 =?us-ascii?Q?MrQ85CAW+bkofP6EEsfO5zs4LJykgu6ixwvOsZuW4aA7V8Y/IDUcXvdmmmZT?=
 =?us-ascii?Q?ZZRWoF3nqtzXXu4NAVymWca9vTXhygxuTKJryhZtQElcfi9fwbQX1hNNe0rm?=
 =?us-ascii?Q?CNjaowO3BnjI6+gV1Ltnev15ziwZKiBMYbFKpRYYonnbxSp4vdcwHdL+W26M?=
 =?us-ascii?Q?Bp9QUSx9oaBFcOM5bbd9N/cpBc0/ADwNp21A/agGEXgDhMZ8NvTkB/Z0a+id?=
 =?us-ascii?Q?4LM72iRWB2JxeIbHiRNN5z1sYSuWC+p9r9xJcT9o0ksiwCGKW5thUoY9X/7g?=
 =?us-ascii?Q?na5/FCcHlbpQAA8BKG7rpA8KlROKo4SYcctudRC7H0wpMzRPVUMyCA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7959.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zEkAtnyrDFXOFMoXNQHe7VkIMzlcyND2jplm36qihJG8Xv/0hKCQVqZcUhY+?=
 =?us-ascii?Q?j2L7fz6Gng08SC05cB6QMbpB/xhTkvPztUHDmqyl8au83+CDbJ1/ukvB4cki?=
 =?us-ascii?Q?FcP1Rlg3csHTb78LCBCFO5VE2/IuOHAEm5B8Qgl5Vp9xmvrSCt3k6PqL9OCM?=
 =?us-ascii?Q?tsYU3gUkRpjufZ9giVQpUxi067Ry8bfVtru9vLEHCi6cUBrdvCJAJ4eV3vRd?=
 =?us-ascii?Q?9pGaJr4ByB2VAyxwoCjbHtbS1ICPYN1j7J77/01tLQdm9zJhe3Q6R/jpFdBN?=
 =?us-ascii?Q?IWh8mQCCj69Hkms8T0gj7RDdCsA5G4kKY5knsQUSzHXi5BfmvlxHTBUlQ8OI?=
 =?us-ascii?Q?K0rqp4c7SJku/ZEFlmJpsgN5ssBV+h7yxk3hz5FvVFiM0AFDtpvZ1cZOgYT7?=
 =?us-ascii?Q?VMH5cy4f+rsK3yGqlxNBrwVIYmqfmi7Pt0rt87P2L+0qkb4RyP9WU9CjNoI4?=
 =?us-ascii?Q?Muo9XMARyu5AJFb8oAO3RKWBseNRrTSFB/oGWF7DvMSHCvIkJ+Vx/OvwNbLY?=
 =?us-ascii?Q?PD77trBoXNbTxG/mLmQR59tcaiEh2XXd8TRxeaiqPtVru9UOhmHpKAb0MerJ?=
 =?us-ascii?Q?eDxlCVASmU7ALhEvy+e89IHSOot9hofGve9ajvOiPIsFJzVRGKKfFji4Rd2f?=
 =?us-ascii?Q?/JAk6KItIoSX3RKo3kM9uEnHXskgDlFx9tz8nOHuZ/Ge7fLk0ENU5xbe19+H?=
 =?us-ascii?Q?+SvmOwSvINsjWkInFfsPe5eUUGBcH698qu2h1v43t7QKvizwv/roaotuNi81?=
 =?us-ascii?Q?/HF0/N7sx16eD+5vquKiTKXkUOHs660QEfgEr7K5HhtuBAP4dk9RjJqjBjCT?=
 =?us-ascii?Q?eutoMl2QoYaNLpKPo/ixTbs40fkdtiV7fRs5sjMdd+3DuIOmIziQtHejRzK+?=
 =?us-ascii?Q?6COGDj/6/NLHyR0rVBnBx/bKgXIt7CpOH+30qHPpnytV8SzRF+qr8gS8IXIM?=
 =?us-ascii?Q?W5YJnP/zzZFnHhu64qmYOKMG8tr037zKZjscSDIG1YRYiT/KGXYdJUPkiRMQ?=
 =?us-ascii?Q?JNKTzkZAKIGyMMEkAm6B8PXw3TaNQyAWkoxDVRlOZx4Yg5ZfPfQUgaOZGgMk?=
 =?us-ascii?Q?KxC4EkvcAgHWJml3fHvxYiwdjS01OdYrEo6X26y514jxuvVnrcXgMtUFSvBu?=
 =?us-ascii?Q?ac8/VNOpOV8ayCMYd7dO1WDP2EbEjA8EgzX1vZCZkYLrv+B5vwVttUXOAnCk?=
 =?us-ascii?Q?IIpV62CjpZZsqimQuIS+Ea2QA5Ff7C9k+QfxSoXfTClDpoC2Bs9WlpVqXjdz?=
 =?us-ascii?Q?eO6ufnQqepH1rC0JUCxrNqCYNTtza2zZ4Ugq8qyW94bdIc/FVG3GBO2XxZ6p?=
 =?us-ascii?Q?f4JI9ChhXtt+In0RpeHfyt6B4GseVyyw69u5Bc5qgInkjdGeEGVoh3xeJtUp?=
 =?us-ascii?Q?RNQLk8+ux76o2Rd6hAkm/f5q3v3+tkB9uR6b/uCMTc0IL3W9A5pqpdAOuMXh?=
 =?us-ascii?Q?ucsZOfOJMnNthAhhzl6DNHCw3BS+kFcDyV6OmEYjxbDk5mnpY8DpxjY2Ogy3?=
 =?us-ascii?Q?JXk0fFg32zsRUfdAhZNH04tdD/SZ2s6dSmLvklPJzzMoHq5YOJH/xCDTGLtC?=
 =?us-ascii?Q?EkEM9JPMkvf/pRaw/1x1K4WBOhwpnNf/Z0Et/f6AUTvagZO4hswGpSpIyRCv?=
 =?us-ascii?Q?Cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F47E62CE47865C418709F28FF21DF05A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rezPl/nwnWtN1WrnQE05snpVyPc3DDETW/qza7q9Kk10mP97HfnR0Ve2YVerYCdTJ6Qyma1QPYOyPx4IHJ4P7ghfgkj9EDBmXh55XaImPf8OEjD4rcjX9UDsdN+SzA9pLetdarY/hpyVE9rnL1wxgizpDj4khLOtm4Y30hx05A3prk3Mpmn7Q2PCzz4agK+LfcxQEL4ExnL20IHEkU90RYEmpDNm7htgjSNh70pDW4vcdkRkPGF1vxfnMMbDOYJGRPQRmj5ijnz2xakAEl65aFGxgDiCznos4DAkOzywcgyhreTs/u2oVx5P+1wmBjxZxJbSAsWs4OaOBEPwlYp8VZru4DqEkppovSnYtvO4SE2J/KWVZX5uHb7eD1iHsY4Afm/js14oGamiPATV1G1OJT86/OOL3kipZU8W2noOlu/MmZDrthcBiVvbw5AJ6WIUzvtHVWqEHrFLqaDYYAwWHqBkwCz1vyPJGgiBFGPVak6z6IgKHdLREHgK8pLV92ONhoAI8V6l7TBhtsfyKrZzILtlAq6qs8U9iuRpuBCf8GokgPAkOSBUOLyai3HK1LZ3r7RDyFQMASqBstkk8mfRAHJDVy8soU7Ymw/74n9vUtI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7959.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4e4674-edba-483d-1325-08ddba70983b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 20:31:30.9531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +M6nBDDj25OoVGXhV50WK4dRkXWVDZDxEBpV8rfu4MvpIorSCd+xf725Ic9C2PC4iXgnYnYAHqOdLwM42MDo6i7P1fQcnkHLVxId6AHNmiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7691
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=718 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030168
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=6866e8a6 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=IJPwXGGiq0S5DRcFqf0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: wxY2FNjdekJtnpGZcn9Ay4_7vFIGG32M
X-Proofpoint-ORIG-GUID: wxY2FNjdekJtnpGZcn9Ay4_7vFIGG32M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2OSBTYWx0ZWRfX+I6zTaI941Su St8h35bl7o30W1iI5ZRS06qHVBCU/xc84Mh9u3lpMSaUl64N0cQjPJ+iBHtIOH8xIyEsNzQAKvm GvkvF7XMJq1DoqX92pvSd+n0BlqZP54EWvHp3eMOL4R6X5wclZikcXOADssTGx022MY3Yjg4NVu
 HCi+VARCs+EdGE6rrF7ZCLhuVgNgpng4yiPo43PC+AUg8bqndS/d98FGwZhVITPbJEnmLRyhf1H thDmCowSuTcTA0c89A1c6Jq4FKJp7xbIscWM9T/b+eTRE3OnMh0qSvDON05N38I6MFe8056xjkQ D4QarzGA9QxtCtKHEWSe5bAe6kJkFvOvB4hmfoYNSHscnkJl4v7KlT6s9h2sdP7901P7xDz4Aoq
 1PuqFwovUyzLIepS1Nq3Zc0jaWAH7OYynpwKFfilQciNhsdJxKtmqGUWH60TC5YAeDILHrb4



> On Jul 3, 2025, at 13:24, Thomas Gleixner <tglx@linutronix.de> wrote:
>=20
> On Thu, Jul 03 2025 at 12:31, Himanshu Madhani wrote:
>> We are seeing kernel hang while booting after new 6.16-rc1 kernel is=20
>> installed.
>=20
> Please don't resend stuff within a few hours just because nobody
> replies. People live in different time zones and are not waiting in
> front of their computer for your important messages.

I got mail rejection notice from kernel mailing list complaining about HTML=
 format.=20
So I fixed it as plain text and resent. Did not realize that both mails mad=
e it to
Mailing list.  Apologies for noise.=20

Thanks,
Himanshu=
