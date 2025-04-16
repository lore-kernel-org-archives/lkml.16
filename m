Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512B1B4235
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838049; cv=fail; b=EB+c4LMYV10MkO+4WlBG/zsJaW2HXv22YP9dJgFN1AKZsAxc84daAQo/ErFuYZGWrkB/hHTrGPzukHqPikIgbYIDUMGTMAzvAQpnV9w8ZLkA5E0tgLy5FTqZlKm98eTESw+ztVmck5KjKe4Jsbo2FyJcX/lSzp7FlDzrGGl2kEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838049; c=relaxed/simple;
	bh=XCfAWSq6Yt8y3xfv4U57m7umSWtRA6PMPCjqr4xf1Dw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J/umrRtfjBF1J214EEaF3TtltdaQr921Fgtc+wNg+iuIWmEylU+BNqFJRUtbHWZWO2rblV4dAIfRFhsfzQ1ECUKesS7wVzKgpzfzJp2A7iV2+uIVBHnRb9HWMMSEmBKcirDkmAUf8Zn3E6722FdZcsIjNbJjNHuXOb0TgNNJj1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V6mXCDpH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VyPsREJn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V6mXCDpH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VyPsREJn"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKv6kd029484;
	Wed, 16 Apr 2025 21:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=agkNA8uIz7vbpiXvOL7Vc1lfNyswbFo7HdYsVQjGlII=; b=
	V6mXCDpHCAbhVyyq0CBpzi3DUx/V+SUZC+SbP2tH7BnLgzf2lCOcg5KsYX2cpuae
	ShHDjgS1pGfGcUNQVsIjNrud8jR/J20mgmsZk7MIKzPUt97uj5iFX7kWMBtmQcO5
	qQh6GIp336M2jvzfir8Fk3+44GXRiP5SfGZq3dgghtHMiJ6rXDU6JPcmdpJhaqdN
	NN1viMT+2PXm/1IfcDL2gTLcZUhxkGCxXoJvMjN6V1dpNcIO7KIuSK3KXNxgskvF
	QFPcNPHXQDbVO7rfLGapPaEm2+RGdH469rEH0HY/ylZQMaFhhHWnQtVkLJVHV88C
	bZ0Iwk2JhG2jPbRyl8PkFw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187xw1vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:13:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKgOph038779;
	Wed, 16 Apr 2025 21:13:48 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4tj8td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHN4/bMnvNpb4Ivo9zRJOeu3AUnPuLM3rQi1UktJHCH1LH9OVJ7Tzp3uaz8G5E0EG55sM7U4ftARKHX+WcUIXWC9Xu56Ak5c7b2kpwD8KscZei6tEA0mM3zPSdBO3CrCr81RCBtt88S8Gm/KZm0caocIe0e+P/UnY+h/dvu5YpuMgoGZBWlrg2dvAcv0J6c6DhxwQvoG6GdZaobKzayww+4sIx5cho0cpTJ89WWk/2p1wsV0WsATyQPHO6l/d4RZkjn5G/U/+LAs53eojJ+8pc7aq2v0DK+8j1HhjSiz0OFoG1JfR8A3LpZ5bNXem+gDSYV++3XnIR369iU0FRv/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agkNA8uIz7vbpiXvOL7Vc1lfNyswbFo7HdYsVQjGlII=;
 b=qgdwS9lpseX1XQkGNyFGjKpJyRnv0ijv+Iw4lGkCek4nFAyBcSe5mYC5oAB91kMgfUZaLLrPqiLLV2TQvhPR5CcyCjSz1rV0YPnsKfTWikxUMuw936cY1ruxiDRLpvOB4KZDlGeT2t6rSCrdmfEVCU93uqJhx6q0xTv6yXU7vXKJOEYS+DMO4wWrk4zKDkM/fKkMsrvSPAhMxO6fq5hjCSTdAXlYsMtaFBis3JFwyJQFV4MTeNCQu7+339CS/qVgeiu0bTGQepx+/d8OcbVMLlMrNpuQ9U6QpCSAhF9EolTMHE9gio25JWmiqz/wmePQoxTKezMwK95UZii8HJpBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agkNA8uIz7vbpiXvOL7Vc1lfNyswbFo7HdYsVQjGlII=;
 b=VyPsREJnf2zCH+730CmyrA1C8BJiitPjDjI5eP7nGLNZ2T8cqUhRF8K/f0ZP6KMAlIvreJ7XPlHb1VSz29pgFtq9VEbRkpZnehU9OcLA4sD9ejvicilf+JnW7w3RSQR59xUPdWRXofO7VGmn9h7jSCck3djXQPK82IDFNa2lazA=
Received: from SA2PR10MB4714.namprd10.prod.outlook.com (2603:10b6:806:111::7)
 by DM3PPF8EEA8AA65.namprd10.prod.outlook.com (2603:10b6:f:fc00::c36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 21:13:46 +0000
Received: from SA2PR10MB4714.namprd10.prod.outlook.com
 ([fe80::11af:3046:4a54:f62d]) by SA2PR10MB4714.namprd10.prod.outlook.com
 ([fe80::11af:3046:4a54:f62d%3]) with mapi id 15.20.8606.033; Wed, 16 Apr 2025
 21:13:46 +0000
From: Chris Hyser <chris.hyser@oracle.com>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
CC: Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman
	<mgorman@techsingularity.net>,
        "longman@redhat.com" <longman@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Hyser
	<chris.hyser@oracle.com>
Subject: Re: [PATCH 1/2] sched/numa: Add ability to override task's
 numa_preferred_nid.
Thread-Topic: [PATCH 1/2] sched/numa: Add ability to override task's
 numa_preferred_nid.
Thread-Index: AQHbrabQw/kcdGpt50+BsIplhbwksLOl3xIAgACtEAQ=
Date: Wed, 16 Apr 2025 21:13:46 +0000
Message-ID:
 <SA2PR10MB47145047CBF0AE1B6E099E299BBD2@SA2PR10MB4714.namprd10.prod.outlook.com>
References: <20250415013625.3922497-1-chris.hyser@oracle.com>
 <37d018ac-ddb2-46c8-908e-9924f0f74e0c@linux.ibm.com>
In-Reply-To: <37d018ac-ddb2-46c8-908e-9924f0f74e0c@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR10MB4714:EE_|DM3PPF8EEA8AA65:EE_
x-ms-office365-filtering-correlation-id: df9bf6a0-adc3-41ec-abe3-08dd7d2b933b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?P2lC72x+86j5PjRJDfZvlDaMHzlMzqz+I9P94LiPhH2a6V0F5txLVxUhfW?=
 =?iso-8859-1?Q?Sa7gLLllcJfPPffjp11tyfwwe+zu8cWJVWmhtoyoZAVMT65DEj/eqWcVlt?=
 =?iso-8859-1?Q?cf6w6CfBzsgx2QzpyaMb4nHFQc1NKchoEiWwDQNCg5aLV3eiotJpdr3Xf0?=
 =?iso-8859-1?Q?FwD9J2YBn9ZaTS0/lkhbvzUtiFA7fJkc9iaMkLvD5LekRVJzlLofMGN5dN?=
 =?iso-8859-1?Q?2JStkPgGFiWsaUi0s+09/RIo8/+ebOrRtWqpGxDEOZqtssFRyum/z2b4Wh?=
 =?iso-8859-1?Q?VcPfmZevH5b/AN7bTTiVnNVuBXF5d+pt3pzjX5s4/nkqjlDN5VxfCNWiys?=
 =?iso-8859-1?Q?8jhiq+0dYs1Y84udvoO60smBBk7dEBvMe4bCwIRDrQVYmjUVjyS5Rp0Yya?=
 =?iso-8859-1?Q?KqQrN976kLV8zBEFLyOTFGRkkN/aQwmzaEHAVo4dGaYEf6N+V8rSq8dNjw?=
 =?iso-8859-1?Q?iQbd42RhgiFHkHKA2w4x2I3ATh1tCwXcXtzNJQggfrPPgENiGN6qFKL8e3?=
 =?iso-8859-1?Q?Ki1T8C4dEP5NKdZGaWbYpoy0DQyKArtgMWmTgJpdHFqAp0Y/6dPcI/4JZa?=
 =?iso-8859-1?Q?f/iz7VuK8W+m5CI6sBkvsItKC1hdWRIloQXN28h4KSJw4OKwkHER6H6JPC?=
 =?iso-8859-1?Q?sUNV0RPrSFcHVEGaAbAkWOIU+po8TgVCQvtYJMYi+hmtW0yVzmPI25kHYR?=
 =?iso-8859-1?Q?Ix+/KdN9QtqHtVZZ3I/QO2lZolFvrLwLN35f41WjOBTMnWuXVVl7Q6Fmob?=
 =?iso-8859-1?Q?yN3yaWnNDxCYQwqezv8VCWCew2oHnQ7r7gILyoTrQnxEVe9svStUzpt+NP?=
 =?iso-8859-1?Q?GuK3pQ/+6SHOh5wmmYecTuWDCtus3OVRf10e+ym4lIINfWhEGsBPMNMJ+T?=
 =?iso-8859-1?Q?uI12hdVvTmqb/kvEflEkBA1yOOroOK60l4oKkTjyFg+OiMOBWYtb2r3qHc?=
 =?iso-8859-1?Q?UcJTp3IqEjdqPdvVBkWFVkoDPKaUir6tMvCO9V3qpnZghcMykNwNf/zZVL?=
 =?iso-8859-1?Q?K15oBA2gXZBB2JFvnGnlfh96ap4tHYR7QX+6x1Jk6+tDspLEkBdLvHFRw8?=
 =?iso-8859-1?Q?Jo1g/nxsaOX1pj+uiAdjRtfcmTDL95dAcrSK9CGKI++c6I5qHWaMJarWap?=
 =?iso-8859-1?Q?vmOoKNNLHdFK6XeySwNyg6MCVZtzbjxNYBopYh5hpnRkA0lQx5tL4JZ23g?=
 =?iso-8859-1?Q?QReeg9ZR7QLuxo0RjYV1kFXI6YKBkJH9wLNMfg2bpET31/vucafOlWndNO?=
 =?iso-8859-1?Q?RLZI7cYP5AjBcejHAlG9fRE9I70NUqxADZXFz3D1TJBuuVW1Eedd6ru316?=
 =?iso-8859-1?Q?bLxoAqB+Bcuac7Y19JwSKLEUe+7vEHvPBab0I67GUW5UdH2npwOq7oZBeE?=
 =?iso-8859-1?Q?Cy4qzZ9MqmRA+zIlC277S19sVbY4sQIWs3RfOgwSu8YGbVlyobh0U3F+5t?=
 =?iso-8859-1?Q?Ex3z2sK+GX9w2qXlFX0vi8qTsM9lLfSM5GJ2UHbVkCSNQkNMM5qEwIu03r?=
 =?iso-8859-1?Q?9Kyybv49SxB7G26Tjj2zgHvtzr+zxj6XwNO9qwalu/Nw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4714.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ovLcQdqJzXGDWPe3QIIQoi05i2PNir1jm87xuKFJxX80GBdk0CZsWfvg7M?=
 =?iso-8859-1?Q?PR0jWhhvyAgS/6poC3+khcSuysbEwtyF+Sf8CC8EPV0LLsfd+N7dJmbBMc?=
 =?iso-8859-1?Q?JRgs1XVMxmp56MMLy2hshQaAXrWIWhiGtXOTeLfDZ1tvNHF2bKYZpzxyc4?=
 =?iso-8859-1?Q?LrFNj+gZY6wT2e9X714hPfqMjGTzimRN7cY3Lw9B6EHAFKgBuXSvSVLrBN?=
 =?iso-8859-1?Q?h6VPVw5KPwrOomO1SpUJDF6DEjRbm5GccZCJXvWGOY2q5zYw+qWVbRm7Z/?=
 =?iso-8859-1?Q?HsHRqNrztfIufhIJ0yoBpMvgyNpYiiZSEcn9Nv7mlGQex6gFe26Gou5lbV?=
 =?iso-8859-1?Q?/CTv03lGGxQluqZTMjl2IrjRwoDmlY+mPII1wnjpsbMr74+sjJaWB8btRq?=
 =?iso-8859-1?Q?uOIB37s4wS9d6pFbXkJEFpsWky2OoLAziaQJCJvK3sL6TKO8o2Yf8vNwS2?=
 =?iso-8859-1?Q?Eh8jnkGRTRK2354Pc5as+4EGZeINcgKjvcY9Ete0SMwyU3cFr0uMNjKyYt?=
 =?iso-8859-1?Q?8iV4b/kHkI8V/nBbM5xpBXxh0FPoU295r1EVdQUAcR43Qq++Y8eyiZbz+w?=
 =?iso-8859-1?Q?e1HF3a3EBYyGZQEgBlZC97zec/0oN+FWkb1REx3cOeHsKa9YPk8hFGpaiu?=
 =?iso-8859-1?Q?F5b94ZvTvB+p7jBuLt59JHZFT3eb9Dir85zb2kIKAncezF7EL5szd6GU2H?=
 =?iso-8859-1?Q?bJBHLI3x3buboBmx4Y+eNrE/0lrxwCqDnLLaYzfNsA+3SDxQmYrkFjnxgt?=
 =?iso-8859-1?Q?g1ZMILFoeTDBOz8kYH6T+Vf0ZweVPWTCSZpcZ18IIepYnFVfaW0354xQiX?=
 =?iso-8859-1?Q?aOW5I0+2Qi0+HWvY9EHvADf/RB48TIeKYXXHKOKIKeguNyRzTsFVEn74Lx?=
 =?iso-8859-1?Q?niHxA3ClHpI/4cH10mTkhSQF4hw/q1iVFa5/h77J0IFLA7Xe1YsPA54Bsp?=
 =?iso-8859-1?Q?vf1UIOoBOP1Szj9jGHElhmoMxqh9rIqrO00EXZCEE50USd+R/psohPOYm5?=
 =?iso-8859-1?Q?EOGxqF+D85WU1QmUVswFefYgzc59xxPdpYCOGX0tUrbUjxiwUCkJdr4yEy?=
 =?iso-8859-1?Q?STkf633FrxBDkjwm0kJYzFWxTrhFqvrGvdmUvYD7o5u0LgVEuF/xdn6o+p?=
 =?iso-8859-1?Q?Yic7SwhgVLK6O8XJ217WNUKiSOFPX4QdoVb8BZXCvZIU33zPYDU31Js4k2?=
 =?iso-8859-1?Q?fFyLQ9JLYl5nu3LCKT0vN/dFMEQ+VeilZ6XxL9jjOhuH57LqT3cXDWzTjk?=
 =?iso-8859-1?Q?dUnbe24PWUrHEMIBIDnrCN/nObp9/FIeNnbxL16HZ5XNy0QKgt6Me44xAb?=
 =?iso-8859-1?Q?YaU7hyvdMr6effP5Vs2PUR3ELjfPN4V6ab1Md2dhL/op02GuFOpFxkyrim?=
 =?iso-8859-1?Q?i4MjqnoZNkhLIBMqgwmRKcdUOA6kSXc2eq54U3qi9aj/DtQa68aRbdpNrv?=
 =?iso-8859-1?Q?PGPs+7nvWE6GPcPnawQa+4bxlUuw6IKsWBThtKtvK7SAr+TbMKCrMf0X8o?=
 =?iso-8859-1?Q?gauN4I1D7MJEpZX3SpHoW33iEOM3j+FKPTHKwMMIQuro2x52WmDFonoT7q?=
 =?iso-8859-1?Q?Alcr98RdLgAeM7U6yXJsv2865lnRNLxWjrt3xxgNyvDn0Uz/IRRlneMlaa?=
 =?iso-8859-1?Q?P92IxqXJ0WsqjmzDUZSnbeFdNuqeznk6HN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UPlcixgRjRf5SIcuFTUycukSO15gRi6BNdELoIpyIN/c3s0T3DmSrBoGxggzDvKujfVdRjkPhPgdUszglp0ZRwVrUEVc50lSRtrbM0KGVwuSow6q2z3HjJKe5n+opBIksSGqWoFNbTaJVPGU5Ti4pjF9+kJWX2ff/vZHeaCn8k77fqrhzXvlE5UOmcF6DuN1L7Lg50KjIOvhcHp5c4JYhICJp91KjDvWV4+nmic+Gpqpm63nvzSjSekfxyKFYIkbxzKjp7WgSxqnLC2ELdQ2VUOESGiJXDbxldvpFMb+d0SPqK24ugrL8wpeaGqVanrGJXfIrNIVS/yfOyNQjYIp6TpDQPPuFcjJah4x0zLbvaYbxiGY4q/meixtBAQxomGXEMKNZtW2XbVWEhEcK88OkYAgFy475ial1aSrUUVKe5zJDYbqBXV+vSJSCSaGMi9TBst6Az9h7qZR9vMAlLaG8X6rh3mwaZkRSAuetMDsvs1eUTLqhCouS6Zj7A1WAfmqYlwfHRN9a464LEr8HcvyRw8B3X+avwmyuoG9W31Ht41RANMAyu2qGb67spXJpm6I69zO5I8ihbzPqMpskEsJpoaRkYFGOdpqREl0baDkSC0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4714.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9bf6a0-adc3-41ec-abe3-08dd7d2b933b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 21:13:46.3075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J8u0f61dnambZH7ZRskUaIK5+oqEoHpgNEPaxQ6efzR0nl44uTC/GCbVMQSER4HTjv0Znj6bD+6BBIru8ihMkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8EEA8AA65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504160171
X-Proofpoint-GUID: DQrKxb-1KM_3RHDMohKuF5OY5lpDxOgG
X-Proofpoint-ORIG-GUID: DQrKxb-1KM_3RHDMohKuF5OY5lpDxOgG

> From: Madadi Vineeth Reddy=0A=
> Sent: Wednesday, April 16, 2025 3:00 AM=0A=
> To: Chris Hyser=0A=
> Cc: Peter Zijlstra; Mel Gorman; longman@redhat.com; linux-kernel@vger.ker=
nel.org; Madadi Vineeth Reddy=0A=
> Subject: Re: [PATCH 1/2] sched/numa: Add ability to override task's numa_=
preferred_nid.=0A=
>=0A=
>=0A=
> Hi Chris,=0A=
>=0A=
> On 15/04/25 07:05, Chris Hyser wrote:=0A=
>> From: chris hyser <chris.hyser@oracle.com>=0A=
>> =0A=
>=0A=
>[..snip..]=0A=
>=0A=
>> The following results were from TPCC runs on an Oracle Database. The sys=
tem=0A=
>> was a 2-node Intel machine with a database running on each node with loc=
al=0A=
>> memory allocations. No tasks or memory were pinned.=0A=
>> =0A=
>> There are four scenarios of interest:=0A=
>> =0A=
>> - Auto NUMA Balancing OFF.=0A=
>>=A0=A0=A0=A0 base value=0A=
>> =0A=
>> - Auto NUMA Balancing ON.=0A=
>>=A0=A0=A0=A0 1.2% - ANB ON better than ANB OFF.=0A=
>> =0A=
>> - Use the prctl(), ANB ON, parameters set to prevent faulting.=0A=
>>=A0=A0=A0=A0 2.4% - prctl() better then ANB OFF.=0A=
>>=A0=A0=A0=A0 1.2% - prctl() better than ANB ON.=0A=
>> =0A=
>> - Use the prctl(), ANB parameters normal.=0A=
>>=A0=A0=A0=A0 3.1% - prctl() and ANB ON better than ANB OFF.=0A=
>>=A0=A0=A0=A0 1.9% - prctl() and ANB ON better than just ANB ON.=0A=
>>=A0=A0=A0=A0 0.7% - prctl() and ANB ON better than prctl() and ANB ON/fau=
lting off=0A=
>> =0A=
>=0A=
> Are you using prctl() to set the preferred node id for all the tasks of y=
our run?=0A=
> If yes, then how `prctl() and ANB ON better than prctl() and ANB ON/fault=
ing off`=0A=
> case happens?=0A=
=0A=
Not every task in the system (including some DB tasks) has a prctl() set pr=
eferred node as the expected preference is not always known. So that is par=
t of it, however the bigger influence even with a prctl() set preferred nod=
e, is that faulting drives physical page migration.  You only want to migra=
te pages that the task is accessing. The fault tells you it was accessed an=
d what node it is currently in allowing a migration decision to be made.=0A=
=0A=
> IIUC, when setting preferred node in numa_preferred_nid_force, the origin=
al=0A=
> numa_preferred_nid which is derived from page faults will be a nop which =
should=0A=
> be an overhead.=0A=
=0A=
As mentioned above faulting drives physical page migration with the usual t=
rade-off between faulting overhead and the benefits of consolidating pages =
on the same node. =0A=
=0A=
One issue I've seen repeatably is that if you monitor a task (numa fields i=
n /proc/<pid>/sched) some tasks keep changing their preferred node. This ma=
kes sense since spatial access locality can change over time, but you also =
see the migrated page count going up independent of which node is currently=
 preferred. So on a two node system, there are pages being migrated back an=
d forth (not necessarily the same ones). One possible effect of forcing the=
 preferred node is that it isn't changing and migrated pages should be goin=
g the same way. =0A=
=0A=
> Let me know if my understanding is correct. Also, can you tell how to set=
 the=0A=
> parameters of ANB to prevent faulting.=0A=
=0A=
Basically, I set the sampling periods to a large number of seconds. Samplin=
g frequency then is 1/large is ~0. Monitoring the task again, it should sho=
w no NUMA faults and no pages migrated. =0A=
=0A=
kernel.numa_balancing : 1=0A=
scan_period_max_ms: 4294967295=0A=
scan_period_min_ms: 4294967295=0A=
scan_delay_ms: 4294967295=0A=
=0A=
-chrish=
