Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A91E8337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051411; cv=fail; b=D+QunVnexWro4Ef1HTTZCgS0diV0badgpu4nGPGqslPy6327zJFrsoVwfdP2qaIdBnZxHdce3uc2IPUBGVAX6KkgJKBJIOmQQ38z4TnhicjX0TB8/PIfEvpiXNr4vnBLkVwsl14tgvaMQ1XfP3JYDWkN4DIVFqyATVTSoON01Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051411; c=relaxed/simple;
	bh=GNE+k2HxzjpLoak97g9Qzz8e9y5Autjc6EIr1Rr/Ows=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t2zoeCv7ARF8UlxZq9QUAQkQUaXJ5hObZ8spKcJyGbjxoXfG6254pjPsRiKGYlL+70j8Kllnl+w3n17d/2j7QU0doWoN5hGPoVogudxAoqwZSRlbSDtoMcm05B+T9k2Lw/dlcMQCYVBZe0goMTgjWLKZvD4hD4T19J2Ij93HPWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aaCeT6aI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fHtrwSO8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aaCeT6aI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fHtrwSO8"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNv8lx010468;
	Mon, 16 Jun 2025 05:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8SoyGJVOqklQa0HZ0nfoXgzivBuxZod2NOUpkl/xEYk=; b=
	aaCeT6aIWbM/gmc3qana6geLeyOA3x0Lf0lEH4dLD1lMRw/iOOM6RUJiwDoLMAX2
	tBQkYj7q3igncvLimt5pWRWwGSd43+DqZR40KAFQKof7makTtOhQXInoY3mcCG34
	fdF3720SvpX86p0DmHrSY/KUd5JkGjljdfIiwDi1/FP5JvkQ+aXjUTXDXk2Ixh9n
	yZAFHMmSAahqkEnGHefyeqa1T0sPGRdW3ckN+05l7nhLassnuJbrVFtog0tKU5jc
	4riD6VZC9gUNhgHQKAusmmKvKeaY+tI/EioL3+3eJRKE3Gtx6bkrB4edWhrCnagZ
	0NCaocTmeBdTD/Vl38G67A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914ehp55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G45IGL034394;
	Mon, 16 Jun 2025 05:22:43 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh777cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9JHVZlrWeyvSFUfIAUKnmv+c4+byq5QB2EKLBy0cLbkUuZza/ny+nVCzUWOGT3OjbYAiTrA9lREkbfhQwrvFBV2Cs2K6yVXFkGTFCRhUn3A5L9MxKA3IlysDFZzB5s653n1t8CwH/YVSB2uRHsQcgxeypUhlvhTOgsjyZJrU/Bt0aSXmWLfEXAHOK0Pjtz1189nHhjwSXSB+vEoknsvjb+7j9Fmm5aVUDHmVzk4w1tp6+QRK4hgModIzLQilqqQW9KeonkvYbiWvNnh2/s6TlfQiOyWOMXETffM786ASzX9Gqf6sOGJYEMK+c0otKekFCSBtpQ01XDgYBKDXd16JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SoyGJVOqklQa0HZ0nfoXgzivBuxZod2NOUpkl/xEYk=;
 b=bIzK7xmRC6UU1AuYejWMyrVfKY5YXCk7LJ2NNevZeoeHOkY5ZUZimTGVFdqfkJWszS+uIRXdpGDFhAbxZ4fJjw7WhbLj5XU1oYuvILKCCLgjBJaLlj4lTHpyhQAXS5UTHlpicqt+XSl2a55OqzO2ksyDwZunQpwJpedhgNDHDnsGXV+ATbro+P07Ii5qtGKXHYru9yX+wQ7oz+mmvGduInCIgNo0L0AhzcRMYyVtMxqzxCQZ4mQcZdGUWsGzhlj6M137hL7/0SwK2hXuZYyW0Vmkspv8nv0kzF0cFHQGav4R0Fco0N1+vTIG3Nm4YPPoLFpjChWNNm+Zky8/AwHyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SoyGJVOqklQa0HZ0nfoXgzivBuxZod2NOUpkl/xEYk=;
 b=fHtrwSO8hbUhfAAGzBdrOrB8Csr3OiYc6jTu09A+9pSMi5rDsEenIUJ9/PGM/hYFRUmrSevCBOpc8WvHi3FSIEvwRbMxD0gxzyQocRzJ8QN31j8CyxT8r9xiGQV080PKsrb7G9+H3qxKt3zl+SYUBgWnNCWealI5RvE33xaVhlw=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:39 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:39 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 06/13] perf bench mem: Allow mapping of hugepages
Date: Sun, 15 Jun 2025 22:22:16 -0700
Message-Id: <20250616052223.723982-7-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 81aaf856-8d24-44d7-c59f-08ddac95cfdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZTS1PCYqZ5egO8M/nIHHrF5OlyJLGy4Qs+Lv5jXh5x/HqYut0zaCCDepfRPn?=
 =?us-ascii?Q?uW4u+OOgntqexZCXjhNUBA2G7AlfAI8jghtPGH/Yws+T0GG6qOQyjGqlYoLr?=
 =?us-ascii?Q?2LW/mf0FEGE0a2PcPgAwYlSEuKCgHWua2z4mBLLu5VHsqkVgMvTSNjKKWSZ7?=
 =?us-ascii?Q?HwzXciKQsvP0qg+yS4ivxKn6M3jmEz30NL/kybKeKP8wODFP2vE1owrUBxQQ?=
 =?us-ascii?Q?vJDZfSZAiCYKfWLZsbWCcuGsHHp0AGmKDR+EfJFncg13oV4VCdLP88W4LPdG?=
 =?us-ascii?Q?ai4/RAAX+LgG9i95/MaHDf8ieDyOFSSW/j881vkB/P9A0hVnBJEbtvz/VPXb?=
 =?us-ascii?Q?v3xbYHGdTdHNV1DkvkFnaAUrnaRAe+Vnhvkau9nmK6OMxPysheIx8jZib6R2?=
 =?us-ascii?Q?MYnDnQkQg65aAiRR3/JWHw2b3OQnJwKSFYcZ8DvaSwGdXBw2Bc6eCCxGcaH4?=
 =?us-ascii?Q?RxdNUd5+eWa7yUKRQqFD99yVDuu0LjxQnmdZ34qtv8Z5FnhUuqkuyjqnUXxr?=
 =?us-ascii?Q?uuQPKZq8rLv6vYUPLW9Szl+loKrkfNadWrEY4iETB7m2bseuvk/JZEQkFJGj?=
 =?us-ascii?Q?aQoeLvc/VykCsYFAEhMSAb+PvG6onFxdO0dY3+oB+t6B6tN/6uGOu5pZr2x2?=
 =?us-ascii?Q?H2BNKXYYZKY/wq/jrnM+pfs4ysKQ1LzjTh0ASDIH4qbxxCw5kIFRbJ7aAHKK?=
 =?us-ascii?Q?FRPzL6NiHLaIcpvIWrtajl0cPX6IfnAPCgJDP9w3HqRVi9kwg6FHaPK8xNjl?=
 =?us-ascii?Q?LGj60tgno55awzf9Mm9yo8KJP9XvX5O8BFAdTmhG6W411BC+QFcvm9sH9D4Y?=
 =?us-ascii?Q?BQyFVfCylkbA12yHTUv89elJX8zaiLQMRWFA7FfH4QzdO2sR3eVZcZ+5OS1C?=
 =?us-ascii?Q?DjV44ENGtuMmQEkMJAKJMkxEL/NIbj3o/9AGYLzTiqYOQbAdQhtd9Cdz567/?=
 =?us-ascii?Q?j6Tr+bIStNCLzSbgKTOdANWrvarbvz/yHDA+PuvBIw/XX+DqhWy/JrY9ckSY?=
 =?us-ascii?Q?U/R5CIChj1w5Qcyyud4MAuVBFR2tKGjaf1IubQn4jAIR6J30tjtHHSCIuOur?=
 =?us-ascii?Q?+LFKNBVA1l0khrlKBv6nAUYhuvsbqmVRsrL0z/WZIIeMzS/1Q9VDFiM7Ko7q?=
 =?us-ascii?Q?OkYsJw/TwZUkH+POtO3ZA9Bd0at8evTM0BqioCQihG9YcVYR901mzFV6F4r0?=
 =?us-ascii?Q?8HH/GYULm+IbwWsOkrM+Gm5hN0t/A2MqqWBHjX3aMd6FTJ6ElVZWkJ1EYqRX?=
 =?us-ascii?Q?pgoG1/RWTN85MU6Ezorrpiurb2aE9pJ4VejiP9xU9TLCTdlYbTXBHtJN30cu?=
 =?us-ascii?Q?39wrtkZBh8nHdm01NOvGrXGVWXLUZvoT6z/WoAmiiK/fQCrgo+7+MYCnVFWY?=
 =?us-ascii?Q?B2W1HW4uNfAetTRCcZvLhzEj+NUtytZbggz5/MXWciwTVEL+yg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7sIwyFdH0bNuoFxMMs6Yrf1yrQyCio6meOBeIFJhYnPKx3N7vj9zan9MzeGV?=
 =?us-ascii?Q?0O2Nb53y/jw9A8t0lFUvwcsh11ZTiVKuqxj35IBY4bdJBO65g2TB5PCE83gf?=
 =?us-ascii?Q?CsKuqOklTReKZvwV5HMa1c4xMOdxQDGzY5mQyeFRrpMImrhQvG4QNCSpmmhD?=
 =?us-ascii?Q?Gcu7D1iMw3nNjaYwYAQx2KCJn+jrz1tZKe5+DVY/swH6NWqFEDfTyexwMZak?=
 =?us-ascii?Q?TrRAuedfBOfEdVanaXU3zdiSE/yk94GZaDCzYJwJxZH/cQ0XActjBIi71T+l?=
 =?us-ascii?Q?lhD3Ot2DxLYddfvYgIkw+OXw6086seDGwB3xckDuBsqTR2lG8hUhWLCeunhv?=
 =?us-ascii?Q?VpckkmBBKblb/qDmOr7ingdwFpyS6Uiug8z5k9wB3HTQF9iuL+iBEHGxHt+h?=
 =?us-ascii?Q?A52xlpWFemOzJLx1WXiKd45BLxtbXDhCxSVVGx5cNekqoDCK2omK+FO4tcPN?=
 =?us-ascii?Q?bO+BXmvQqe8Q94ejYMe3kofThgiW3nNkJLuQkZyQH/mPLwEuL/3s6iVrLP5Y?=
 =?us-ascii?Q?HdmNb0kUrqtVs7AUW/9e8I5l+YCxPvUN3AsvFt3aT/x/SgsSQ78P2sk5iioS?=
 =?us-ascii?Q?MzSHnQGCm+FIWk8rzJlC/79ijHHmOzJRNVeRzsZg748QeUrgFtc86K8j1ded?=
 =?us-ascii?Q?AbJZbr60QHCCvH6aCh2CMhlDaWU+IYDKjXMpsBStzwHZRie0Tci6kQ+JEkJ9?=
 =?us-ascii?Q?ijGQIbkziSkrETVqABxAPJh5549/97lTnv1sgm5j3blKz33WWOHAd4Gta02p?=
 =?us-ascii?Q?kkSKA/vaoql7GGQnqmM9dVkP0UUgPlmZQmjm/ZgS7HZEdRspzGh96ymkmTQo?=
 =?us-ascii?Q?1pVzgIdSWR5WJzXqdiLGeaO9tQaefflLl2CeZMmQI6hYlB26a21GhPnSlWEe?=
 =?us-ascii?Q?B/5aZ0S4234/dmXZhaqRme+vQGLuDkJWv67tWPOMoKhZRPk6QqlKgqukmDjc?=
 =?us-ascii?Q?PT25ZG4HqofwWzgmZuJLzU9lkIG4WW9BbYxRKHDDgOTEN1wxro0cYcDeCfJe?=
 =?us-ascii?Q?jEM6Nr/Upb1PvY6+357dH2mdRcUyWUS8xHrJ4kgR9O2jOAjl45K3AIDCGVhP?=
 =?us-ascii?Q?6j5/lf+Ah2dCh8IlciLlZQGqvllLJor8jrBQpQHPFnFJCpAD1tS2bxQ7U473?=
 =?us-ascii?Q?3IArYKy5UO965MDiJLuktRfzPocleLWlmfPDUn1HWAFsOrZcIpsmHKvWVCdw?=
 =?us-ascii?Q?KX0ecVMB/esOut1wCoLAxrw3MhXuMdde8ETscDirgUhbDhs9uHdAxqluzfju?=
 =?us-ascii?Q?MmXTGuGSWZ1I0vLY3tVvu4hnGnu+5AAsH8Y2sW1Fz30C5m9DXFuvzK3JJfbW?=
 =?us-ascii?Q?1nFz4ScC3HJv6CrllaXBBe4o1nZE/ZHBiXm79te/6JnkNkOo7aTH59jNDf6Z?=
 =?us-ascii?Q?w5WhIOW6rUGNsrCj9IKSll1ndm4QSuhbjZwKYixT7GYcJw3O+M8LO39qmOZl?=
 =?us-ascii?Q?AuhH3KF65b9RHwY+qTWj+xyIvXKWCm3O1cUitor6PzHUKFfgzGWFTNTd6wyH?=
 =?us-ascii?Q?wp1a/xzuH5DKjELrLjU7Pzpq+bhZLQoNI1Z42g/he6WZBBXGJ1q95JpCIZhF?=
 =?us-ascii?Q?dHrP8sFe58TjdWboWP2O3pVNiL1QTXe3/WFt6ANewkqR9dkol80qLzAzCfQe?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	deeOVgTV1ye7BHTShu2evRSXgG5WkwmFkYx6fY5+vF18HcyrEYEq6ydLfMR0lraGMKabfADRO9mTE7dZkPTIdsV7p6QzmljLKJ8tV5J+6kf+6N7GteeMsBKk8esb6HrY8HPhS50Umia7zfw8OwmzblYBJKT222p4Lsk9GjRr6xcsZlcKChY3/48X3DFAMEgzy6K4Kd8i1+YlYZvUZ4vdNgF/ouGdOh42Cbli+IED0t/JN/oX53Tjoi2KUfzzLyIobuyDZU6byhu1OmYK/Gma6Sy0r38iAPH3glehHPPZuxiyK3jNVUocHlu9lyzJjAnZ3dmHiGH7pyVVeonubRBv0ej7PCv4XVrZbctZ6alJKuN2qbx3RkJRNgyZPo/yubBVPN8QACDbe2zUYVF+1D+HJF6DBpbgiRwWDpihCVxU1iTVqDnkRAfCD/DXGtrhYFYj5RRkISrNmcJViQvOPx8g5rmnjXPVY4xSQRnrKTMffaALngD5Nyo3Ng3eIFljxmhrmENxARA9dQgxkHLpr32+op7FY93jaPrWMmcL9PM3qfKMX/CBkIrwse51SDyieUCQT2Iv1JPUZtbWMYxoQHML1L+hafGbRKrniPLN6YX4yV0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81aaf856-8d24-44d7-c59f-08ddac95cfdd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:39.5073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljPohdSN8U+QlcJiHytuyqnIeryw9M6h8HPehvnPFj4oQZhakx+JvHAfYsiNDCpmAEWCdZvNnpF1u8XNdd0uGvZSN2F0H+fCNRn1HkggZK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX+wdx9/ZP2GQ2 4PUok9vBH2sydhybM3yCK/t+3ZvMm+tL5OGDM39Da01zgwUYE3csuUWCzmR3olBRW8KldwEgKAc vX/VNDXBeBB0nBcdVIX7Qo/lRlzfSmvTfRkSd63xneaQIQW0matCydQ/gEzFP6adXN5SntWk6gq
 8XYPTUAYF+aA6uCItPbWc4yXqo0xBhtFxUub1X7Z9Av0CZv6V8EAjFA6zS89N9/HgRTAot7qBGp 1GT47nqMHcuTGC9sX2ULhAhQCNjUsMY4aQ0K/WLiUcB3GztxfWJueZBoKbssWejN0mfa/G1icqA H4Z7tUnb5noi9I3Xj75yLYzZqqY6iT+hyq9lE4hK1T8eXEASqVlvoO4zENb8KlTdpjLZQFSmfjJ
 mz5Mtw8e9bSRKvfCF1vsywooaFB6NrRnZ1NA2yJqs8RxJhQ2DTvzjiqmMvdsNqJeOe6jLyz8
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=684faa24 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=2txnUkrh-zOa5si45iAA:9
X-Proofpoint-GUID: OkYLj0arew8tsuLvOZZhRyxxnVxPCg5o
X-Proofpoint-ORIG-GUID: OkYLj0arew8tsuLvOZZhRyxxnVxPCg5o

Page sizes that can be selected: 4KB, 2MB, 1GB.

Both the reservation and node from which hugepages are allocated
from are expected to be addressed by the user.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/mem-functions.c | 33 ++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index 914f9048d982..e4d713587d45 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -25,11 +25,17 @@
 #include <sys/mman.h>
 #include <errno.h>
 #include <linux/time64.h>
+#include <linux/log2.h>
 
 #define K 1024
 
+#define PAGE_SHIFT_4KB		12
+#define PAGE_SHIFT_2MB		21
+#define PAGE_SHIFT_1GB		30
+
 static const char	*size_str	= "1MB";
 static const char	*function_str	= "all";
+static const char	*page_size_str	= "4KB";
 static unsigned int	nr_loops	= 1;
 static bool		use_cycles;
 static int		cycles_fd;
@@ -39,6 +45,10 @@ static const struct option options[] = {
 		    "Specify the size of the memory buffers. "
 		    "Available units: B, KB, MB, GB and TB (case insensitive)"),
 
+	OPT_STRING('p', "page", &page_size_str, "4KB",
+		    "Specify page-size for mapping memory buffers. "
+		    "Available sizes: 4KB, 2MB, 1GB (case insensitive)"),
+
 	OPT_STRING('f', "function", &function_str, "all",
 		    "Specify the function to run, \"all\" runs all available functions, \"help\" lists them"),
 
@@ -60,6 +70,7 @@ struct bench_params {
 	size_t		size;
 	size_t		size_total;
 	unsigned int	nr_loops;
+	unsigned int	page_shift;
 };
 
 struct bench_mem_info {
@@ -202,7 +213,8 @@ static void __bench_mem_function(struct bench_mem_info *info, struct bench_param
 	if (r->fn.fini) r->fn.fini(info, p, &src, &dst);
 	return;
 out_init_failed:
-	printf("# Memory allocation failed - maybe size (%s) is too large?\n", size_str);
+	printf("# Memory allocation failed - maybe size (%s) %s?\n", size_str,
+			p->page_shift != PAGE_SHIFT_4KB ? "has insufficient hugepages" : "is too large");
 	goto out_free;
 }
 
@@ -210,6 +222,7 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 {
 	int i;
 	struct bench_params p = { 0 };
+	unsigned int page_size;
 
 	argc = parse_options(argc, argv, options, info->usage, 0);
 
@@ -229,6 +242,15 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 	}
 	p.size_total = (size_t)p.size * p.nr_loops;
 
+	page_size = (unsigned int)perf_atoll((char *)page_size_str);
+	if (page_size != (1 << PAGE_SHIFT_4KB) &&
+	    page_size != (1 << PAGE_SHIFT_2MB) &&
+	    page_size != (1 << PAGE_SHIFT_1GB)) {
+		fprintf(stderr, "Invalid page-size:%s\n", page_size_str);
+		return 1;
+	}
+	p.page_shift = ilog2(page_size);
+
 	if (!strncmp(function_str, "all", 3)) {
 		for (i = 0; info->functions[i].name; i++)
 			__bench_mem_function(info, &p, i);
@@ -285,11 +307,14 @@ static int do_memcpy(const struct function *r, struct bench_params *p,
 	return 0;
 }
 
-static void *bench_mmap(size_t size, bool populate)
+static void *bench_mmap(size_t size, bool populate, unsigned int page_shift)
 {
 	void *p;
 	int extra = populate ? MAP_POPULATE : 0;
 
+	if (page_shift != PAGE_SHIFT_4KB)
+		extra |= MAP_HUGETLB | (page_shift << MAP_HUGE_SHIFT);
+
 	p = mmap(NULL, size, PROT_READ|PROT_WRITE,
 		 extra | MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
 
@@ -307,11 +332,11 @@ static bool mem_alloc(struct bench_mem_info *info, struct bench_params *p,
 {
 	bool failed;
 
-	*dst = bench_mmap(p->size, true);
+	*dst = bench_mmap(p->size, true, p->page_shift);
 	failed = *dst == NULL;
 
 	if (info->alloc_src) {
-		*src = bench_mmap(p->size, true);
+		*src = bench_mmap(p->size, true, p->page_shift);
 		failed = failed || *src == NULL;
 	}
 
-- 
2.31.1

