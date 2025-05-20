Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F020E6E2;
	Tue, 20 May 2025 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731142; cv=fail; b=THtZQH+ZmXvY1dQn1wSiNz+RMt6rC3t4YFijHmstRDC2Em9mpzxVFJ/5220JLuuYrH6sexRi8TNv/RiWLFD9jvAP7APafsxc1kqUqUTVYz5lXHn3hM5aZ1h3GTGuHS8eox9CM7feyoFTQvGoOjX5DY/pEV4+B3crnbF/qzBq+uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731142; c=relaxed/simple;
	bh=HF+0tSB9H6VfPkb7YSzThfoooeVi81IXU6Je3O901yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DyFT+aMsEPrtWU+vhbf+T0uTsJBuoq/W1U0rMNe6r0oFiCJZeOeJzNNd1eo3QhXNSS87AfrvmgW3QUgVVukGyKBq+u9v7hajRJ7HaJUU2t0KKZmzXlTqR3wa7HwsH/WJsd9aQfRqEyp8aXDc2C3S62QMUHlebyIoZkATiitXfoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PyrzlX7d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wTNxBO2r; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PyrzlX7d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wTNxBO2r"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8fY7q020606;
	Tue, 20 May 2025 08:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HF+0tSB9H6VfPkb7YS
	zThfoooeVi81IXU6Je3O901yc=; b=PyrzlX7dK+sSF4J0y1dztAeu6qufscR2kF
	d2T/IhgkRsrN9roMF6o13r0bg8+lAqCp20fOnyDJCuTGPwENNiD44uVsfkoyduU4
	ah7dRXe74zAkeBlZaGiPDiZ+XcarmbnjW3djicPvXIkAzG8XHPgnCUn1GXB5NJJY
	0668exGQMTiUDFgw9SPKd1UG//n/QDec/koKIdUm6cYUkk7W3izUWo1cpRptdE8A
	0EziVSjQmqx3idRNdyB8ApkRfZYyEirjXOJQdZjfAeh0dOW4X8PVD/t6Rr0nSw3U
	Bxj8rJzZnLAySpyn0adxEhzxuZn/WfJ54fNdYtXv8NjWhXqfN6yw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46pjge4xnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 08:51:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8T7Ek015637;
	Tue, 20 May 2025 08:51:35 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw7fys1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 08:51:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AL1yfvOLAew5vZbKMVct5Z4j49zhJTDULn26/+Ebodxjqn/0Ky4tJw0FqwoeLHyZI1cDWSFLPdTxAma9naabidhoY7XgGW39BsxNVY3os8fln6eu3a0SpDjqi/O46EMBgD4gHyv8di0abv4kjdxIeERx5gCVygiDkZZ4rbb0JWLDlnIjl68q22C+6IbLWPxDokYGSaVJCtU5iDPG/33j2AOerlIZ+5vKvDbJ+881UQ2L0PvOdqrKpM00SriUWnQNLzymvNn7Fs6gZZE7vZDeYod9hYmO6dRewibZG3HVZJ7Kxsx3J9nGq0PJKGW/Xo+oHtt4CCdSiDjGvCpcokpVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF+0tSB9H6VfPkb7YSzThfoooeVi81IXU6Je3O901yc=;
 b=oGHAUHJyOv2ztfA4zO1HGnavXRwgldbnqda4cZqFv18Zbl8BAEoCQQGJ57YEcf0cDmk7iN3QW1AOcL495oW7DcUarnHgUQaTuimCLMy6/D18V4UxnhvehqEOSD8b7j3RO2aHFK6fck3HV2ih3xr6U2hDV0TS1kElzHRI8QLI4aQBWWrzxsAKWS827GSsjywWEF3MTlB6CY+sv76x/pcqKrLr8nen9Pu8MVsvGYcHpmQxCdkPaaLR+PiJr59yYRknXe/k53Wv8o5mIZomnPoupGWRjasUcdOnszo+un1IgJ2mZnxzbxsO9mdQ1c/ESLGVVfYpkelIwbSOz91VQW6AfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF+0tSB9H6VfPkb7YSzThfoooeVi81IXU6Je3O901yc=;
 b=wTNxBO2rws20NGdU73YXnwg9VVekCfFzE7fXetuRw1E5hH1RQbDAaoLCguViWjZIWpMjS+bISHGKgvBD7gFUkII/8kDwlr0sXYYTG5kdRPKhYs+c/TXdkkAtJhrbTDeDp2n/ALQK7SqbT0I/ywEs6RHOn0UABYvVEnx1TniK4+o=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4299.namprd10.prod.outlook.com (2603:10b6:5:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 08:51:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:51:33 +0000
Date: Tue, 20 May 2025 09:51:29 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
        jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH v3 0/7] prctl: introduce PR_SET/GET_THP_POLICY
Message-ID: <6a86eec6-4d94-4273-9796-7ed31e2ea34a@lucifer.local>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <562293c3-fe6f-448c-a5d7-affb1d622c7d@lucifer.local>
 <28c0a856-c828-4521-bddc-45ee038d0fa7@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28c0a856-c828-4521-bddc-45ee038d0fa7@gmail.com>
X-ClientProxiedBy: LO4P123CA0564.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: d5239ef9-9559-435f-8959-08dd977b8556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mjv0sOzTa1VmCyKx63dd0snxD/ujb0dAKXx9jJagqLZbIC45NL+TGEPwSvKs?=
 =?us-ascii?Q?aqHhDZTrp5tb77T5P6ntUsaUu2/xpRLiFAYRk0vn3p0b8auMP4VkJCPbC/5w?=
 =?us-ascii?Q?GQwg2qHsdE/6p2MT7caYsWbf0XdurxayzYUSNcJKJbYK/CkJWqzOuLmLe7/t?=
 =?us-ascii?Q?l2rs/VcYwU2GJBBt9TgxeMfOcwOsE2VkA5NQkHqxpjjsHA6mqQ4qUEUFapQj?=
 =?us-ascii?Q?3AA9zB3/AJuwmcUpGFFXdMWx+bWZJ17aYrvLrmbXQO3zVpcVNyXW663GneZz?=
 =?us-ascii?Q?TU239A//jOWe21snpdyUl0c17lyzBZ2PbfWUD3rAN77Bo3GCd5qYP6v40h6E?=
 =?us-ascii?Q?AyyMemQoll6ao+wttc4UFOo8YqKMu5GR+6eqo2hioiVMZmbUhTnLra4wFMox?=
 =?us-ascii?Q?zsgjXS7EmSXBY/d5vtHFCX/+JHXS3w6sVR/X45tGc/03Cy3U3i8Q15iLvrLO?=
 =?us-ascii?Q?7N/4SpVu3GmjdeH/qyrO3VfSuRSl1etxznWqw19FELnnQCGpd/x6vVtkfYUp?=
 =?us-ascii?Q?xzlwDraeCnAqfm+vKZFD11UCt0qaOwb8Og5SbnaazY9HCzQQP8WxxaEwhue0?=
 =?us-ascii?Q?cglAPq1rbmW8Ju3CeMsGC2VLMVwrpGsX+bp68c1/45PbabaPjnPuUD06vL1m?=
 =?us-ascii?Q?YRnXV1qRxGkKW7f7DI7TF/VUAJzrFSxam/B72NEbBvtnyWEelFusZlNsXkTH?=
 =?us-ascii?Q?4EUBDVkSsOk6yTBuakSAYzPyLmjmzDalNUQR/MMasGTRasd/1fHYclAkq/oc?=
 =?us-ascii?Q?3Vudg+JQpJxECNGFaO9uDw8vouzfuZcenQ5EtQbYHYVMvyx38+qQTvZ+i2EC?=
 =?us-ascii?Q?3UIknV0YyXlgRGiiORMNAq36RCaKEfuBCsSUrIjsPCF1ttsCYqdLXoSZ1kY6?=
 =?us-ascii?Q?yv772be68Yb1R8siV6w8rPhOXuiJix3vwOD//+UExa2Q2Q7NQ1r3IRAKqXS7?=
 =?us-ascii?Q?YU1y5WiEOfnDxEtu8+H4DSzlsYhR/Q+xVYph9nGukIXOtQRJoQUdGI2z3AXy?=
 =?us-ascii?Q?vV32I9SLXIqhEBMo3XMxpMgmZCzeaXD5k6KbFiIp+x++5cYhIIfXmSBAKIy/?=
 =?us-ascii?Q?kEsrXbkydAYNjlGMAydYSG8+jqFnYafDREnyFphm1UkuAj+mrqaxe0Njf4Za?=
 =?us-ascii?Q?SpoI56bwROK2mNBquR22Tkpz2JbL5Gaq/je3clTBQ8xl/YOP9iaJ7E1zWJC4?=
 =?us-ascii?Q?Fo9g+6SX0N+BgZZKDjB4bo8g7G46DcrGi45Y92GQ1Gxiqj4SlzidppX6kj/L?=
 =?us-ascii?Q?EEXgHw1znto4DzH3YA1+LncYVWPCoaTGrA7kVhtKEEO1ZKx+wacOBAKKzqgi?=
 =?us-ascii?Q?9wmdmfW22j3zXKSsp0BVxmyWiihAdxkuDa4Qr1r88HAcuRz1uSvKvg0FKsSn?=
 =?us-ascii?Q?M/7b05boZ6ji8VzfGLm9gyRbhnTfkBqrXjsUOqlsK6ODbgJKOsKveHYd0N0p?=
 =?us-ascii?Q?tkO3au6gFcE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OvTliOrTo6qK91rSdWb7qlQDoQmDM9e2WlIgCXaY6kFa2DgCCVgOGLW6lPdA?=
 =?us-ascii?Q?jimTCAXpuFnUVHd6bmQLgYCfdr0Y7KXywMiKt489KbuKekTFcLOGibNGI78T?=
 =?us-ascii?Q?ctL0ukAg2CWqcFH6Fpn9CdBbdVv8RNm4Vs+VgekAhV5+cZk49zhsTyVNsIKT?=
 =?us-ascii?Q?MX2yemGeJzlYXpJKInxkPcDP+xaDhcb+TdutCksqaM+jLGV7VPcvbDd6+9Gz?=
 =?us-ascii?Q?cAlIyBr+jhx/eb1567hYw9AtOi3fZq4wCMauMISwnZd8XUIOYZJQAAoRytdU?=
 =?us-ascii?Q?ktVl8j+tpjbnXnjyOD3MAWq6GdMXNu1PhdHCYzRw5RPSHcOu5pzQPzp0BMfu?=
 =?us-ascii?Q?sgElILbaoyfZxXzYiu7AFdDkXCFcK830TKXoo97Bz1HhUoQtu25lTTNBPJvv?=
 =?us-ascii?Q?wPwl68I77Vp56DwsNT1KuRQdpyh632E2d1st2lb4rgiVR6n7JKxPdTNK+PIi?=
 =?us-ascii?Q?RPDrhOqvVwL0aTTzY2nM3JPZR/xlI1A+xfxaXQ+MKGLG2JPTc7pBHbzXJivN?=
 =?us-ascii?Q?oOEcXavRsdT46t4slbtJnF81I0HIHioK5q44MqivtaL8k1CHLLUnqNqAZPDW?=
 =?us-ascii?Q?HDx6iR9GDwDCCTzML2/ebWzb8oiHwxh8ZZcIFJ0Wlm95G7KzWfkA8AjMOubL?=
 =?us-ascii?Q?nl8qjbFi7EXRHQqeKtMh3z4LevPf3lpUXXjrSmXxqCr/2aMMShbJptSc5g1b?=
 =?us-ascii?Q?sGjrP+ggIR8SgAznTZ+DP1Nrob1zUqg0ZEEjFGphB5BXZU9Lf1CpRvBlqGDo?=
 =?us-ascii?Q?8ZTrmhZMrBQciUyKzajizS9o/5KL6Pb0Co703kcOkbzCwOaD34E/2s5VwqeY?=
 =?us-ascii?Q?+JBA4XCRSOaANSMNNxdLxpUxtFZhixh0NBcUUdZI6QAHkBOukDPiujafe8hS?=
 =?us-ascii?Q?MuokgBFMBBFkHDiJp7Yo2hoIqSmWmX1VgpjhdnJhQTyuB4XlMHBCFuSCifd4?=
 =?us-ascii?Q?6GF3oCt3jf9KliMMVwopziacXTAA0UeAipzsO0B1D/wSDGt5SODHug6NmkS+?=
 =?us-ascii?Q?hcFclduc3rVLHfGqTakeqdb9Ew7BilcMiuuA2CjetDEaANaY8dM6Y0ouc4E2?=
 =?us-ascii?Q?pVJSEQSlFRodSVi7MgVrQMtDxhGd1TWcb3VGlAYGdMrI0JIClw3TEpnYXKP1?=
 =?us-ascii?Q?bA7jFDVjftSXEm7nCqv/nzx5vzm5OialBq62NsofYl7I68eH+vcLAe17mV8X?=
 =?us-ascii?Q?HTo0d1lr2qhbl/N3Q18FXsiO2kLMaFqS8EiCPz0eOrnzvIQruUlGViVAbZfK?=
 =?us-ascii?Q?ouU7c6T6C1dEAW8G6kHjDg5acUFQV6CV9TzeHs8tQwbtGvfTNimw+RiRoj1e?=
 =?us-ascii?Q?b+NI48QMUItS4QsnThrlwLjnbawql1urdCS1w4Tn6vRDGv+PPhQhPcADFxre?=
 =?us-ascii?Q?0XtfO7DTJ48TPcuHDnrDWA0MOyq96O8dDlY2RgL+N9obBU58VwMu65ibgPWM?=
 =?us-ascii?Q?JjShHvdx1LoR5O4YQKYtyehfd+rIgTSt1XNgbGp8z9xG/0/TbZkjSvale3G2?=
 =?us-ascii?Q?iE2guNijaHFVV7kALmy0jQtF6DpEUsQUFQ2J1t7XfiLF6sI2W5yvsLzQ9obp?=
 =?us-ascii?Q?qQDnkL3e7dyAwlQtiWHvb0UPD07QDnPKmjnw7ohTkxjVaJsZv/GGxK0TFPNF?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JLpfkEsis8DZ9DwNIU858JhUHW/ly1r0CkGc55UJtjis8SltN9CnEYPTYB1CQsAcyclFQlITE1vS1SW8JmBdb7hjBpr5M7Pgj4UM0aFLtD2a5rjjT3ABv9zFUTmyvC1kbum1HhzhYan83Bi+yVddPdbRU0FWhwAaLH98JkzstQE0l6GCs9zpWiwuOfBRT+xCGlmXzDv7xzrmHsjXCCTH4fS/4mkJQYo/LS3Cpciz7YRCu2K/8yue1TJyDzD8vVNEbHefoDkQqv8kz0ZlL3mSfC9BD/Aae8eJrJA2DmmLnAbA8cyiSX+LhzURzIHwiZNW+XAm6r4TOTmB53Rohi+nr6IiGWGZd5oCz3oz8B+zzba6KOfuA3MTfTuusLJpctWpoBZi2HV3FVmlyeuClx2/Yz+cfjAUHHIVK7S60Z7lyW0sRt/fQuo0wXfEMnfSSK+DC7KCUqTUOAicybgGS4qrCemhc8ls3N2A5Ilhom8ddDloRWkBMZLXHpX/IVrXsiDqnQCteWPpaUG/oJ73ckV9kiEjlI6RhPiC9kOAUNjeM2dkWTKEFIggLSCSqH673/OxWisoIaZlBF/SaWIq+dCvaJ6pDD3WIIELxrFKkBpPdAU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5239ef9-9559-435f-8959-08dd977b8556
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 08:51:33.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npvVOK24U9CRPb/zrgOCT+hAKY6XTGnyyhL46RvLHtmgU/09Yn4pozPFn82fLAwh9nVfJux2QxKzymI1fgX6EGwNlf8lNFIfO/ig9wXyKJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4299
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=940 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505200070
X-Authority-Analysis: v=2.4 cv=RamQC0tv c=1 sm=1 tr=0 ts=682c4298 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=-MNnj1IjRdHHYyMaHHIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3MiBTYWx0ZWRfX8I8OiO04Pwnb yl1SjilaXdayy8DzHBnkJIzA0OxaK5P1QLZmWeU+sN0AzVyEqG7Lj6gz5Ky/ryaLTaQ73QY31GF U9VAtfUjygOXkobJiKPKQeRN/rwYaKsFiwidiVTWphvke4Dpyb0ahxGmzh0YZe1Ud21fhxVeyz1
 XCKFf1VIYy1l/gaMv/pkH1XV5Ihc7pd1an1k+ex2JlqoEE5Vw26JKX+BBQB6UIoSiluQypZdm8W CK1LT0jMXA78rdgfap6+aC26YjMBOc44cKMGzedX+RX9DrZlnuGCfwwVWV8PPom23h7+ODG4Sgn 5nBL6i8v0Hadgyr608V+H9+moRz2S0G5iZJVZL66x+w3abcDfVL537EfvZuobkEoS5dtxSCIdnA
 hcgT29NphXaoq8yKgnYEbF1mYVpNKyVO5kGxACB7+KmsyER8XWpWWwoBsldj1gnDXjDSO0I/
X-Proofpoint-ORIG-GUID: BN6A6Grrwy1b7webATanNIld2KDsqXER
X-Proofpoint-GUID: BN6A6Grrwy1b7webATanNIld2KDsqXER

On Tue, May 20, 2025 at 08:46:43AM +0100, Usama Arif wrote:
>
>
> On 20/05/2025 06:14, Lorenzo Stoakes wrote:
> > NACK the whole series.
> >
> > Usama - I explicitly said make this an RFC, so we can see what this
> > approach _looks like_ to further examine it, to which you agreed. And now
> > you've sent it non-RFC. That's not acceptable.
> >
> > If you agree to something in review, it's not then optional as to whether
> > you do it.
>
> It was a bit late yesterday and I completely forgot to change --subject-prefix="PATCH v3"
> to --subject-prefix="RFC v3". Mistakes happen and I apologize.

Ack, but in future please try to be careful about this! This obviously
changes the nature of the series and important to highlight we're still in
the planning stages here.

>
> I agreed to make it RFC and had full intention of doing that.
> Would you like me to resend it with the RFC tag?

There's no need, we've got discussion here already so it's sensible to keep
things as-is, the series is in-effect an RFC now as it's NACK'd.

>
> Thanks,
> Usama

Cheers, Lorenzo
