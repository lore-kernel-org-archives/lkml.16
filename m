Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B42882A2;
	Fri, 30 May 2025 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643339; cv=fail; b=M6IsEdPZ+uP78HSlHoN/TcBaeu2gnCzOVQO/CkoE8J8HPWe+qZmM0HCOkPJBPhsSHXZoShS+Csg7l0yiuDYzZAJlid4atVQzr8pWaZGcLX+hJULlRn3UCN7NG1YpcxnrBj2EbOFbJ+QRbvH4wcfxrAvOmx2QvbivxtpsjODaS6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643339; c=relaxed/simple;
	bh=rtcAbRAb/AWNFo1eMAHs3YZlRku2eoh6VmP1m3t0wVE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=cPYmZIX/nj6+o9+QC+V3DR4EhJ+Pm9Y3z5Vtbr5ECK/8EiRACg+0uR5yYVh1RRKGpLYuofoqlj8xRyVZWsYWcFZT3LE1q+6wKQ1ta5UllPaXfyi+ZemI1GuEHZepi5WcRCmKE7ew5Ahx5jQNwRMqen1s6+sug2ueFjQ7PuozlKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aNkd8Y3W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nevI1fi3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aNkd8Y3W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nevI1fi3"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJN6qF005206;
	Fri, 30 May 2025 22:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=yk2YFGv2mQikHDDX96
	943kPxo8n4Bkk9BH3mDZhYEGQ=; b=aNkd8Y3W/Vzd2tUdd7hG1/IgZ5uMK+5VXw
	Ur4/AvZmO70ZMKTCs7ZepdTagOMJ3EXvY0lOD/iS9y9hC7CVsju8dPk5gruoDRiB
	U4JswDW3ZmZRMZDfgT7oyMz1L7SNEYZe0rl+LNhSlHHRk9+MisY1Cu9erL2Qsyn3
	wLjswoNSKLBEL2SnQUEcS/R0XElKIXbgs+qU3gdttGdZ7bHa3WyXi1EVarN+S8QT
	3hf9644yQ/LWiCgX/lgtjHXupCg8ff1tfvXSUFQBBBc98fRk0jNMGsofu/VKf3+Q
	xrLPWwpy5WRDlJK9yT6gifDD0YFctT8ak0AJFpV0Y1E5uMIELRCQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0ym39fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 22:15:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UK8gdC023323;
	Fri, 30 May 2025 22:15:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jdjhpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 22:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru7232lTj9K2F+HWcUKhkxWZD9XXBPZE1hQ4P2VGFCK9pZqDa7f9S7txJLY7j+VuKdyhloQQ2rmxC7qOuQdxidzktsRMjK1eYeHGKMPM4dlbqT21ElAtbqdPOXezmFAeerGB0aMvX2sCx9PJI847ljo6btAcPrjmuoOmq215CCXL4qqckGKHpKjddmEtzFvsEgm4IfOpIidbV8GIH4wWXz/bCWtX61woR1ovTpFmw55/WasDnCC0lbzbH9zjhbUjG04PSZ5NneBSLUhQn2HltYRtRwfhRDwJErUajH+Hioozgi8/hdSu6fEqobp/Ahrfvoy/vxeWYejiln58nw65UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yk2YFGv2mQikHDDX96943kPxo8n4Bkk9BH3mDZhYEGQ=;
 b=rW8ZbQoqZxCHDFAzafdaxfCmu+SNm1/fKMH4aSJS2luLZtWd0piZi2yX2eWjfAzkObZYr00cbmzRgDX46ZfzUGiCtkEkO7H1gt1xh8AfqMDQB6OxVguWcY1LHKKszune9txsQCFXVRTiGPKbikIHmu9TPBl0dzJG6tGXwxOuBf1BRuzsEJnYwofiJsZUwPzGxczqFrm4EDsT4CWdagR8++hMLVNekLRm9Srh5/aHyzubCIiDpdCmWq+zoj06n5yuqwiK2nM4R03kEUehQjTLif8aIIHn3u3cjh8NxoPM2d2LWVUtiXu2Dq8wCJpfJ5hIa2sdL9hQ7nCQW65aTaF6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk2YFGv2mQikHDDX96943kPxo8n4Bkk9BH3mDZhYEGQ=;
 b=nevI1fi3Q+jOGxB/wIHKiBw+VrgWnoQsRZQYDKY7JlbgVD8XQtUlFY2F34/edZyuOzQZoeBifFBKYugCDS4wjG6+J85E4A3M8HrEjJPyJq0vlTCr77HAy/EBQtFSzlwlWqtVktbsyBED763Y1ZES9E4hc611rjOIFC0qyluyzGE=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by LV3PR10MB8106.namprd10.prod.outlook.com (2603:10b6:408:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Fri, 30 May
 2025 22:15:18 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8746.035; Fri, 30 May 2025
 22:15:18 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: SeongJae Park <sj@kernel.org>, Ye Liu <ye.liu@linux.dev>
Cc: SeongJae Park <sj@kernel.org>, akpm@linux-foundation.org,
        linux-debuggers@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-toolchains@vger.kernel.org,
        osandov@osandov.com, paulmck@kernel.org, sweettea-kernel@dorminy.me,
        liuye@kylinos.cn, fweimer@redhat.com
Subject: Re: [PATCH v5] tools/mm: Add script to display page state for a
 given PID and VADDR
In-Reply-To: <20250530200621.52327-1-sj@kernel.org>
References: <20250530200621.52327-1-sj@kernel.org>
Date: Fri, 30 May 2025 15:15:15 -0700
Message-ID: <875xhhagp8.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0473.namprd03.prod.outlook.com
 (2603:10b6:408:139::28) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|LV3PR10MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3f414b-4961-4b35-95e1-08dd9fc7758e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LCwdO39bGJeER1TvrVVgVpykU3/CsJ0pkHNj1KXhchdFezpmCg388m7bws0c?=
 =?us-ascii?Q?78mJya5ZkhCPlBTi7Ov25twlO55//k1Mz97h//qIvulgotScTuAglVWCtDae?=
 =?us-ascii?Q?6hA19uq7t81m2NMbIpesv04IOzvgGmBfHyhYRgi6R0j+jTnTYlmUGPN+mDsL?=
 =?us-ascii?Q?3nwv7BD5spGBLdUApMo42S9iSgPh8z7l2W+PhFYybxLNfaieGC1L1/J34r1a?=
 =?us-ascii?Q?cmp0Gy4k+Y2tWizYweoqzPc3e8G6msNUve5KSsWYbFTdXCge26XyY582kyTQ?=
 =?us-ascii?Q?J1o9//+di03pfcPf99dvE+JqeTPKtC+SSGzstPuv9u4KpnrFx3sq/CgOseYF?=
 =?us-ascii?Q?QmCz/2n3YuZfNbAiEW7SbBgd/KbX4y8rZNvylvXSHj2jvmAicgaLAFS8Fa1a?=
 =?us-ascii?Q?/JVkaCmhMnjJXcRoY4XzbkzU6bHlG64EuDIvobYQrITLGQgozVUwAZeCswdM?=
 =?us-ascii?Q?c0o5wsJhUldnPC1hkiGvGyKWI7Hm+DSxTLvwJTqd0H3jIHTfZQd0SHCAGVTA?=
 =?us-ascii?Q?fbFfUUryIXnmzbpAWfzVWknJVc6qxkRO6eO6+GGaUObuSpLiuS2eglPRGmkK?=
 =?us-ascii?Q?7vowbUDzK4MnFOSZIDKDPyFu7l6AUzKXXT/MwwAMAe45zCk+c0tZZI8ewAs9?=
 =?us-ascii?Q?oXhjMXFhOnCIgA/3G5gyULsFhCQ+JMuGIgGBU7eUOOZaAzLx3NsbXcVxixdZ?=
 =?us-ascii?Q?2Wk8nJtvjd3GMY9/9ItEXPRoiZuOegMsP4Rkn91nnUF9/2FgCwd76IBXadAl?=
 =?us-ascii?Q?xTEzcwMKEFjlFDyr5kyJWdCQVCmcMtXQ2kQsaVGNBEIZEjG5z5rWgca9aelK?=
 =?us-ascii?Q?K9i2Og3efFSg1AEah15hlfHMLuAbZnGkXQAsxUw+T3aR+A5n42/2xwR5UpqS?=
 =?us-ascii?Q?jPp6zDxlGsfC1bpFV9Eh3xjlbZfmqUG0GclWH7E3WQBGK7co/WHr0rnUVO3Y?=
 =?us-ascii?Q?Ii6q0NaGjgbtKx2UNVKfOE/fekqwXEfWpSxo+05DhAIH//ha59Zzr8AAWenD?=
 =?us-ascii?Q?J+LmPq33krFBaxHqiB7m7IevOYoPzpMe6Q1HzW4XALnM6gDZ8FgPmCWWtATp?=
 =?us-ascii?Q?fi9t0pIv9iV2rAK3+xImE+g8kZFOazsZapMu3mlHF9GObdlfffjVBtmzHWKp?=
 =?us-ascii?Q?SjnqlWxxlVIwnRC8dLpKEbwaZU6EXl/46pR0GjdUj5k6l6Z5Bn89C9d+3KjS?=
 =?us-ascii?Q?UdkBCAwa1mRL1roUrZgn7r9xM/NzcWB9QM6dme5LGBgC8ik2w2tLP2fw4MGw?=
 =?us-ascii?Q?iYujOnYz3tS3RyzsPwE63Z9Sg8FD2YwFMcDvAfEsoLSbJmH2/wo8dz8AWHtu?=
 =?us-ascii?Q?SVkTboC5EleIV4mbLQQETT0JSlCMPOngspNmuq2nbNqjiLWaA0wprw5Wh8Oj?=
 =?us-ascii?Q?TnPJer1GNMPigcT/+Fd84aKBrajWt5woe+pAphF1YedMuFkTbdcRXk+YLScQ?=
 =?us-ascii?Q?x+yxGn8Ym3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HWyvdNqm39D+AWjwDU0HlIPGcNOtw0NMjdlO7wTcwYjy2V/2Vk4GMFhaTB0S?=
 =?us-ascii?Q?WRiIXOAhZM2jXHuZxLeKRSvtvnpzE7gToyecEuK+Oym6YorlOi6dtuBTVdBG?=
 =?us-ascii?Q?lO/fpHKGeva093D6oYlfXnqg2LgcL1FHCf2MN5lHvUloCTsDorJqeaR8nH/y?=
 =?us-ascii?Q?6KzwdfhXcVImIdkI01JQ2c7zJaBaFvLC6AXkCQgLV+hmP5SBfzS1HR9Kz3CN?=
 =?us-ascii?Q?/p4Q9tl41pC0m7SyfkamASr7KNN313LX6irSB51HKbpaU47W8ZC7PQrUcRNu?=
 =?us-ascii?Q?Pa3QVJeDh8yHKQrSZnVBY0eyKo6PizXu63+2gpLZSGJcyNU+WcP1XWVS2rsi?=
 =?us-ascii?Q?hZlvJ5VK3GFXoSIygQqlGF41iFyZ/RG3kxQ4CMdbQUfzNYHIBtsOrBSFi+Co?=
 =?us-ascii?Q?1XF31eq/U1ECYVuw89zGu82M1ncbR4tveoGDbG+OalXlSxfXP68EF1kU/Pd0?=
 =?us-ascii?Q?ZoDLJgshOwUeOuRrEDRz3EAJRdGsGOj/+OjuRrBsvtTJDFuvO/lKp1fgiwT/?=
 =?us-ascii?Q?yEYgG3gIAOOpjM/kV+whbmeGa7oL0sP5ptbA00s9vng+bf1rWQ7XiDg+oU30?=
 =?us-ascii?Q?ZrywRcj05X0tCpoMOLIsqBP66qBwx8xzd88rZjMr7XMgYhAqWiFZQ7697zqq?=
 =?us-ascii?Q?xYHo5NmzImeHjLhHiqqFh5dFqnEgUO3rcuoTst1V1QE9fqFk/gex+xoyFwKx?=
 =?us-ascii?Q?d7ehkoNUKM/nioy6ommt0b+5djSN4Dqls2sranEd2MWnCum7h2sdXMRXmsGI?=
 =?us-ascii?Q?EMdpasmQ7UCC2lEPBj0fz2fzUr5I54FKLbsM/sdGI2kjcvN+c4UslEk0ogv9?=
 =?us-ascii?Q?CEWhka4O6+OBcHX6kYab7UHg1SfNQeuZkPRwiDfYlDLqXnKc3uM+BOhEoyWY?=
 =?us-ascii?Q?7JCjDl1g1S6OIZzMGRJvpZx89i/quDvNcDvn+sGlo7LEQ9gl2M0fs629J4sj?=
 =?us-ascii?Q?dzCj15Kto+UHO/+kiHivZpl3w1xH5NFE3Pxf/Q/GENEef9xJ4Wk2kLFZfL0G?=
 =?us-ascii?Q?GG9/9rcvAMwwV1kycYVqfmzxIh3YhZWuqQYqlsZ9IzdaFDSAVzRoawTxgdVB?=
 =?us-ascii?Q?SjcNe5RGvMP6n/FGpguzcXCLYf+CaHxOIbXOiVSyIhcZLnTRniM1eCfZZA2t?=
 =?us-ascii?Q?m3TnG88pHTTMa5DCswBHOfj9iyxlOiQRuGa30MJjZm/5WRH8f7HcfgxyonWD?=
 =?us-ascii?Q?agVrMAjGn9Oie8cHIIVL6+WnF3cPtXQhxeKT11SzuPWLMYMzGbQNjTyYF8vf?=
 =?us-ascii?Q?HbjYGwap+P/2ZNjxQgkNHg10G69TTsResFOqEl9riddt1gC2epB8+QF8MNJu?=
 =?us-ascii?Q?hyiS6AWcjG9+dT4O0GACbKK7cqFH1qnqSGviQVVRFBMWeMepZF6YpoVpieWw?=
 =?us-ascii?Q?+xSKZF5lElrEQhvLKCv7/YiqjIvH1XuLRJ0Lag0QTIbctkDbW9Of0g1O2QjZ?=
 =?us-ascii?Q?sJBGNQADlR111a1BC6UJCbPSX3g3imFAgANV9G8cds6GXFrAQfYDXcAZ+Nyh?=
 =?us-ascii?Q?5R/H23IdFtR3jzr6FxZXpoVRUKQyD83j8RNPPB980g/bqbAgL0yPJSxczm9Y?=
 =?us-ascii?Q?aiRucyfeB/upRXo3H7PckiBhfnOYoxhlLCAHmI4M6Up/VqQ219xCTPmKOV3W?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GdAYQprJnZsKDRZ9EeHM4MhYZ2uuxk3mPWFnZUJuIIL1ghn3Kv+9GOxbbE3xAk26JL4JrEvI7eONw2tPtlqwHUFme1+JElLf1zvI8Rf/R4H4GIQC0DRpWd+sxor0enawQYwCkbkgviQ5AiWWyMnsaE1gXbTQGqNc12GmT6ZqnB11X1960n3UXjwEo9jnm35ghl8+9PIZ2jvZSJBTBmFGjw5w3LW0QzPTCg7m8CJpwFGLiqnSuifbfVMPUTITghU85KaxW0gTOLLFEyNt87UTmGN/Th1vU7W2OpHlG4jfcc0Yc1xx0ssxZ/gu1oEY5ioefVdbyTsqj+qjXMtBa3TGztB+BtPqQC1xzlwweRulDkCld8QpYaqDXZb1ra7oNiUXU9WID8Up/Xzdl40TBMPOsfKVgTkDVd+j9Hvk8xBk+2xVURyI/MEop+sVqTQcgnCeml7wJG8crq6td4oJOtLwMG6AG0gw4Iuz+zxFA/yOqyS9bj7wwyIg6W+krGpmxuiGpevK9Fd7nyzVQ+Kf1Mdg9Mbj7fX0tW8M737ZfT6/JaoipQN+QQtY73m91lmXzthNCeg/Iu+Erzmq4uPHdTaO8d1/eJDCzHzJvhnKiNlH0ns=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3f414b-4961-4b35-95e1-08dd9fc7758e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 22:15:17.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBNaqNLiMnGp5FsWhpUD3NkTmHNHfUubvn04DuDb3pOkaW6erqTu/bvjVaYavDfPW6twt7mu+kaFPUgDwQwncGyYbN85ZeHt/1766DHprXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8106
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300199
X-Proofpoint-GUID: I9s_-bCSPsn12T4pu5zSWbcPGlLvqd2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE5OSBTYWx0ZWRfX76aRGyLsQFP1 HaZi7+T8I2EHZmZZ2CFyHxgWrPpva0+0oQgB8gFQ0H9NmK9xjkNZfGEmyD5zh2fEpaXVq/pmUmL F4TJZ0GQ04VFrstBrG+sPrh6W6Xk8JDZDKjsRlmKCrVlA53yMhwoxp2fmeOGu3DNiDVu/kJdlQc
 zK8E/puXD5JyCdyEzouUuHz4TY2RNACsrcYfU4c6jBb/hayy8YHx8MDDpm31gKgQFVqTXgg4z/1 AYyayAqqEmFjQrLb9c8lKeYA/f7jjLQREvGnFbX03wY41NzwHaeJIKS1dgiJG2z3xT73Oilx7bR JlvFI2bNyvuaE2C2yHIhh3t+ylUBKwg73vj2Y9fh1NQYUTZj0yxhVzQOhU7E05re0sQ212IXlzW
 87NcKgaRsY9X2TF1M7kesbS38+VRsRCRx3db/clNZJhzwy9ljwE0PHWiMu+uvYNsu9ZmSJkN
X-Proofpoint-ORIG-GUID: I9s_-bCSPsn12T4pu5zSWbcPGlLvqd2-
X-Authority-Analysis: v=2.4 cv=N7MpF39B c=1 sm=1 tr=0 ts=683a2dfa b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=TWD54pSCl1hehi9XsU0A:9 cc=ntf awl=host:14714

SeongJae Park <sj@kernel.org> writes:
> On Fri, 30 May 2025 13:58:55 +0800 Ye Liu <ye.liu@linux.dev> wrote:
>
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> Introduces a new drgn script, `show_page_info.py`, which allows users
>> to analyze the state of a page given a process ID (PID) and a virtual
>> address (VADDR). This can help kernel developers or debuggers easily
>> inspect page-related information in a live kernel or vmcore.
>>
>> The script extracts information such as the page flags, mapping, and
>> other metadata relevant to diagnosing memory issues.
>>
>> Output example:
>> sudo ./show_page_info.py 1 0x7fc988181000
>> PID: 1 Comm: systemd mm: 0xffff8d22c4089700
>> RAW: 0017ffffc000416c fffff939062ff708 fffff939062ffe08 ffff8d23062a12a8
>> RAW: 0000000000000000 ffff8d2323438f60 0000002500000007 ffff8d23203ff500
>> Page Address:    0xfffff93905664e00
>> Page Flags:      PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>>                  PG_private|PG_reported|PG_has_hwpoisoned
>> Page Size:       4096
>> Page PFN:        0x159938
>> Page Physical:   0x159938000
>> Page Virtual:    0xffff8d2319938000
>> Page Refcount:   37
>> Page Mapcount:   7
>> Page Index:      0x0
>> Page Memcg Data: 0xffff8d23203ff500
>> Memcg Name:      init.scope
>> Memcg Path:      /sys/fs/cgroup/memory/init.scope
>
> As reported to the previous version, I show below on my test.
>
> Memcg Name:      unknown
> Memcg Path:      Unexpected error: 'struct kernfs_node' has no member 'parent'
>
> I know you explained it is an issue of drgn version on my setup, as a reply to
> my previous report.  But, could you please make the output more easy to
> understand the problem?  No strong opinion, though.

This is an interesting issue.

The cgroup helpers in drgn were broken by the name change of
kernfs_node.parent to kernfs_node.__parent in Linux 6.15. This was fixed
in drgn promptly, and the fix is included in drgn's 0.0.31 release. If
you use that, the error should go away. In essence, 0.0.31 was the first
drgn version to support Linux 6.15.

However, there's no general way to catch any drgn error and determine
that that drgn doesn't support your kernel version (yet). The code could
be updated for this specific issue, but it wouldn't really fix the
general problem. I think drgn needs to include an (INFORMATIONAL ONLY)
set of kernel versions that it has been tested on. Then, you could use
that in a script to print a warning (or add it to your general purpose
error handling). I'll look into adding this.

This is itself a corner case for committing drgn scripts in the kernel.
Omar does a really excellent job with running tests on the -rc's and
finding broken helpers promptly -- usually well ahead of the kernel
release. But even then, there can be a delay from the fix to the next
drgn release. The more that you rely on drgn's helpers for a script that
you distribute in the kernel, the more likely that it will periodically
break, and the in-tree version wouldn't work until the newer drgn
version is released.

I don't have a solution for *that*, but it's something to consider when
deciding whether to include a script in drgn's contrib/ directory, versus
in the kernel.

Stephen
