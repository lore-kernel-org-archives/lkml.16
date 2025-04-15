Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9D2DFA20
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753621; cv=fail; b=p7Oe5c8w6IoRa6U8gvafQ4jaxuCxmg3Za+5J/0xm/6iDh1aRfDPYBPbujvkf4RUykKfjzp/RRgP4jxiaaeXmCT20rM7MZJwRng+JOiTKm5422o3TJ8++THxACweSOW5ExOI641Dohbp45XATVPRAZtl9ACkkHi/pqcbQ4DVLubw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753621; c=relaxed/simple;
	bh=zErj/297H6aOAhRQAZQhbg9SRBz+i+HI6xhVsmcs1jQ=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=lD9RdpM/rI+iLQw8EEOuS4ctLGbpUw9YHiy6Duxh0m2ih0XC+FuEZo37kB9g7aAApof4gjT7WrCm+TvdCErw+ZoGhQ8gCMVUo6TFEEERAxjl1Z1HQ0WakhRaq683kjMUHoFJP2aiQsBStJ3WUeieLYj8kndWzQjsGlIkQaDaGGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QpE9Elp1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nl5G+cB5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QpE9Elp1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nl5G+cB5"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FKu4UN011393;
	Tue, 15 Apr 2025 21:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=PYTtz3nIbvofi1eC/s
	S2TUKS1vgrCoBemFNzgbG3c28=; b=QpE9Elp1AUyp7GmHrSoa7DwgR8xdp4cWO1
	wxYoOxSXCpn3oALXWuReyVtdb2erXIE/9UZCMofeBPeI19ppJPBnjL+JutFvt3tZ
	a5gAHYx2sTnkLZnUtZuKOoEGI3hKijL8feWYjjEuJjXbKOaq9sAgSk6mWuphadFf
	s1e3PnemGcktXWqvLsjA0HvcPge212R938tFPsjuZPDJ+rqeJu+otUwrHInzS8E1
	xZoD90KPc32w8DkmkDGfDrDls6Rluu1QcsLDQLRCTEOmnpMHf5CBz5Q1bSTl1Zxu
	wYNp4XTnhgtTjqxp7QJcydqqq6LMWhL9rCHAJ+cImztjYFwgQXHQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619442m09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 21:46:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FK8xNx038849;
	Tue, 15 Apr 2025 21:46:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4s0e81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 21:46:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riTHLug5QL/L5lqsVDxJ+f9uWFA1P4IWC+6xlqNpE4Bk8rqKv/YWSXWFXMntg8+P89QUAuxqoCxqOMd1SrRpzNHEXXenypzlxbH4ukjmn60pvx3W0EseGXOvBjuiorf/zPrVBBC+hPNUzbXhkEdk/aQkB5C/nM4NFy8IFsCgZF/OHMD0RJ590fG6b9c+zRPvLBVG2YTfMWDsVdNoMYB3UNgcmOSanVCGXKHmZljk4HITnL6d+1NSmKzxqoMo6VOMpf23O3smB2NvH8Cy1P7Cr8kPQ7rovKRKSpluUmoy9yAkkxZ0L5qHKo0mHQAdIov7qrQijRH7FpTF/TzUDmpfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYTtz3nIbvofi1eC/sS2TUKS1vgrCoBemFNzgbG3c28=;
 b=yidO5650HGLmGFBQhav/m7xbMNfE5upbIB/y3heVZr4dxftrBZo1vTmBCrUcFVyPAoY/3cfEtmPCRNMjWdhtqP3TApiaCNoXGXxbV+6fOoRnOLpSJCs+0hfX5/hI1P+GDb/P9wPayq3QT+9FMQ3dZ8nhQme4A1oKjs+9JEnUiwVaaiYweySZTpDEQzQ4ZPVkIrMj7majHKeOw/c/kMxM79V31EoCH6Y2p4NOEKuolkPjKr639XFg+F01SRBTRX/T9nO6P0KCI4oQ6CWQIMmJLXMC7xLn9SB+W81tkChgY6ZC/I64JMSmbVUgoZei1qdU3jwVq2QyRpxpcjj5QqydFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYTtz3nIbvofi1eC/sS2TUKS1vgrCoBemFNzgbG3c28=;
 b=nl5G+cB5o3lDiMTpOOuK98G5V2ptlJNEWc5Ard2qZD89L0wtSYMFCYjERHfuG3Std7cPiCZix/mSDN9ywQm/LvGxXZZh2JwmVBOSF/IH9vcS7y5oZhNyNaenfCKNJiSmMEHjcYj9l1W9uiDXeUB1Kjcqerak/UgLggUeNNX2qvQ=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA1PR10MB8210.namprd10.prod.outlook.com (2603:10b6:208:463::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 21:46:23 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 21:46:23 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
 <mp6sg35nbmjzahnlkstw7y7n2cbcz3waqcthz27ciyc7fmki3s@jws4rtvqyds4>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
In-reply-to: <mp6sg35nbmjzahnlkstw7y7n2cbcz3waqcthz27ciyc7fmki3s@jws4rtvqyds4>
Date: Tue, 15 Apr 2025 14:46:22 -0700
Message-ID: <87tt6pw11t.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:303:8e::28) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA1PR10MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb37d7d-4803-4753-9146-08dd7c66f72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3HrMmUCgrVuTvOf5nRu+PccnCYxdb7tHvDMKr0hk0P2sq54dmJdG3KdbUr25?=
 =?us-ascii?Q?jSIAA8QDBoUXFPAn79jyS4WgJUxK4IHXExMyvyffh5RgYAhVxXeV3Bi6K4wr?=
 =?us-ascii?Q?hLZtRbJ0L4Sslfr9j9XFBiKdu8+z48vPrtELoSOpfwJuUUmmqsAjD9dspSvF?=
 =?us-ascii?Q?l2jHDDPkJ4LVpJtziK9wp7mhSTveG2juIAhUD5BaJaa5mMTzRh3rRw7cSQWP?=
 =?us-ascii?Q?69rLKUeXDPSqROffpN8ndXfxZA+WWW8zZifdNTltX9I5wNE90+e46e+sch9+?=
 =?us-ascii?Q?fSiLKuPRdwVP5Sz3JgYx3zBZVQS67jV8wAbshPPh4/tUcP1zSmn5vl+pc4kI?=
 =?us-ascii?Q?L0jzaef92aCmcPQFsSD3RMowA8RoJvN8hlyXz9Cfh1LDERkXnDc8bSr0xSzv?=
 =?us-ascii?Q?k09De/E7Xh3BPPuyZlUg3EG3er9CIzknFgqlOMSmAnvnq8DeaKuQZznHW5J2?=
 =?us-ascii?Q?kVrCxWMnTnjiNFUqCcCewYqy4CIOcrE31tFHroAXIuOdrcVESRMQ5fnRra5x?=
 =?us-ascii?Q?7Na+9aE2VS31/IQfKKI9KQAZ3fOo+JFhSDpn1QIMB5/6boQZ5NgV/LT68/gX?=
 =?us-ascii?Q?hG77FVcliFdMlDa8i52K3filE6IJczt5aqHoy8W7648dFsvl7OjxBPQ3fMb+?=
 =?us-ascii?Q?8+elXSZpu+ExxkNuhem7GwEMdl7oMTjaAb8ZhTuWrDNOLf0rWrXuST9oSG53?=
 =?us-ascii?Q?HOFKf7mrqKd6+YVgj2lRzyL9y7q8mhN7/3IJSvF/rK/AR0NWb1CvZowOAd8u?=
 =?us-ascii?Q?T9LQ/pLytHSCgZ0OgiN/WTuPbJ0kGoUFXkh2f0dfZkBkfpqJTy1g+eFbZAEa?=
 =?us-ascii?Q?yQRxiR+Yxo87VnmSgT8lQPUJXTblGWxEQJQ/NeCy1q6H4/KKPsZ9Ml+MPP8D?=
 =?us-ascii?Q?WvhGRn4JnMTctY0dUf96nsEcJniAWMAgEfghPe3w23yFvT/wOmBS9FHBBWE1?=
 =?us-ascii?Q?jWvtaUsiPJ7JNlw8ft4zO3ec1Sqn81FV1W9aUV4xUrk+DR8nbuSoK1tN60TI?=
 =?us-ascii?Q?gb1rIfGrUAJ7I+lvI+GdSDoHB6N1VF53lxHY/oguJZCL2m8LfCugTt5o/j4G?=
 =?us-ascii?Q?K7+2FELHV0d7Cqj738x0/LkFEjE8zy3+V5e/plMG1hhWVgJkdnVL549lvEDL?=
 =?us-ascii?Q?FBqQGI9yCJg4bkfZ+CDDoshPmRJ870hDNeNZRzkXd/C0X3DLzXMabraWUgU0?=
 =?us-ascii?Q?6JBtrxrpoi4uRtVLypuXlQdVj4sjjifE5C1kSm6loSBAIMvp23EMEd9FfUsQ?=
 =?us-ascii?Q?NKqFNxouUJeYjPFCWCVYOzLP0zgf76CtmKHKrxLQtdvuBN2oh9Dkad2bn1x+?=
 =?us-ascii?Q?017sOwn7qq/GnAxuqHxn31YCp6kdrOM6qq50xbB2piZvg7thMqRDsO2UXd48?=
 =?us-ascii?Q?vpjVSujAeP3SD9Iv3WitSvn3d82b1T4iHFfbpfbtBqbHceOWj7fYrxBKh80Z?=
 =?us-ascii?Q?vz2dou5j09o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3kJPytCFKfaR1Hg38U1qmPraVt/qymSOPsMZko9beb6q/B3LVzYXsl2SyDiQ?=
 =?us-ascii?Q?k3A5+CpCjR/1r+/UIc3mnNCF6XGbBmw++6whUsXaJ+/fEL70AtUMJI0EaaRR?=
 =?us-ascii?Q?Pp2V6qOWh+JnEDIlLsaJCpMQzggkKDWmoSQP0SzDClJl2RVz0wTF0WcslzY2?=
 =?us-ascii?Q?DZJ4vRRsB9SdVA0OP6vzOtjok9QU2n4xJ8cFKQZ7oFfa8Sa84VXSaYM/fPk4?=
 =?us-ascii?Q?ytsj/xszn8p1G87/SOaMW17QwsF6FZ4GO/rBq+8zp2DDU45rdecA0bPDx5kb?=
 =?us-ascii?Q?fZsDjACvr7ixEGMiXwEumtB1BUsF0IjXSgsKztblBg34IJRN076E7ds59Ye3?=
 =?us-ascii?Q?V05leZCP+XwRwSjQ+2QKF9G6HL2UFFPFxF7q6Fug5aNDfNNVwfu679KAabuI?=
 =?us-ascii?Q?tJDlbLNmsHGHTKmInet5Dr7M4k1MvDpzpe5veO3m6Xh7PC9S/2e4sQACb4hV?=
 =?us-ascii?Q?adTlPzRyvPGy8yPp2YZMerNfPqCESopSj1fyjNGh9vNw+bpagjbY6XhvRJGO?=
 =?us-ascii?Q?YSuUGaHZFgvCZkZV6BKzMSqO/yeWAzt3GYLFwUwREIxIxIAkFSXWLsOYRYUh?=
 =?us-ascii?Q?+VldHRAcD3LDb1pdunHw80tUZH/fwRcL8D1kUo6AOuOX9iFaZPwybKP7r6Pp?=
 =?us-ascii?Q?q4/7vGwicBTG3T7DK+wYWeKoxDHaHMgSAHXKQLHjtWWKo2xWnyXfT4BJEDek?=
 =?us-ascii?Q?Py/Vxd4q5lAPrnTQ75CnkybjkLl9gDCVkJ3YPSTLl2bdfmEsnGER5euivZJY?=
 =?us-ascii?Q?q7oOAUmprjrb0zzBzXgm9o/DZgqPuTLCyAEMLmoZmNd9ByThO/nNYgDOlJki?=
 =?us-ascii?Q?Reot5PITG+e4P+4xtKFL/D0qMFJ5/kR7fsNbfXAexB6Jh7WU98lnFGVfrKKE?=
 =?us-ascii?Q?i/liFIB+ZNpwol29It/8sLO47MBV5wOv77CuSn8oDILlaadTkEC8XXkiWxTB?=
 =?us-ascii?Q?/ZuJGKUEUO/NECdWevNelcZ3mz1eAtmRLBLK8Or+hx7geisd7Fhht+ggAN3Z?=
 =?us-ascii?Q?z9b9A81IG4TKMqMLvOjoy8s6aoaG9w6sahK8xurYsqrxMhIygAYBCY2+ATK9?=
 =?us-ascii?Q?HbaBjR9IJZy3JtQpapbeDnJSPmQ3bVDSeIM7PtPBlbn9dVDKN62biEnicLKp?=
 =?us-ascii?Q?VhzVKxXUSJPnAtplZwvqrEdLrLlobS18ZIBYEhb/R5zln0O5WufmWrKVoiOD?=
 =?us-ascii?Q?kty1LRTXGVIxKy5obMrREXiMdW3VA0/VB0yaibWZgvjuDexxBQKCzcWRI3Fy?=
 =?us-ascii?Q?2ApwBVxn9OMOS67gYr2d5pAS1HzjA+kiJ/p4/N8ZQC33sZRXMSlN4cfDkAVn?=
 =?us-ascii?Q?r2RUTKBm4xtprketS2f30LlHmv3N5qxvDygky8G+g66SI9Rr4V0UIezMDvfT?=
 =?us-ascii?Q?anRo0gJD/mptaO+Q8/nT6o/lEysZ08Tb1J74jXKGVlqujfTOS2fI/gRYacRu?=
 =?us-ascii?Q?vLl5ttbNHeUX5jvB3hnOvyy7rClMun0jH2oBM00uTsx/kkfom6CP4c64mM/f?=
 =?us-ascii?Q?DPuVCrEoF3YHKy+xHQpMeCh+OkbagThJ9UxXY48rXrmAbYvcPtwzd+csTKWB?=
 =?us-ascii?Q?U9Qw8ynQ6R2ELo8Pm2EhkDnpLx1rCJs+eNjjXyi8FP4Rv+K9gxYBsDJ7zOym?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gYSBl6a9XNXplTEMpfZ8OAc5uoPy6ls4Kxn74rnqiIFz9MyCuEuy/tnJxzUyDKgOyko+TOI6LhtkEVxSJ7unvH2Kx0QMuHe6sdVfI5PSr+97x9TSdnLp9QqMbT+2pxZyBS1OsRotPobud/CdQE3qV4Lc5UAqhZ+A9wwtzjKMAUxCG/DnzQUx/sCwngOecMzWO1ONUzp5RmxOrZSBDxWE651qwl2myWLtpqpotGoWSlWgZH5nESDo1MdXo0DO2yrlYZwYmBwGpF8EBR0zP2pdBDglbeFDuxQ6OmFT+zC2pidLREvGqRPFsE3Wvs9Z73ZRrb0odoM8cfg/JR4vwcqHl6WqC06DGUAOkMvHvlNKsAu7pqsSTYcUerUFOekd3Agm2rQhZKhzqcMN1SbltdN04oP/uOy9s2L7fveTlY9NYZTuuwl18XQEg3kQvJ9MfUCMJOS+YG9Qz6lhTSaXUOruBij3JIoW896Rhi/5Mn24JMKM7GkDmRPRLQjG/BAPXXH9yQAMKA9C8RzkXSgJ6GRXW2n9fnu03O8LKb4gS6H6173hn7gCLokRgnf86+P5p2PBA0i65D3T7flsGS+7xUcf3gS6HRGafM7UJUG9va2jKlg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb37d7d-4803-4753-9146-08dd7c66f72e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 21:46:23.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzYPpxmAA9fV6jl6nlOzyEoC/CLOh+NesLfwfncp5+DAyOjFaU7oU2EEJCngDKm5uD5z+A3G+iPyrtUaE3JnN72MvNa/xGmKNbQiTWNd4rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8210
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150154
X-Proofpoint-GUID: TrdhFyFfe0ilSR1ESmE2DqHUH7Ss5AdF
X-Proofpoint-ORIG-GUID: TrdhFyFfe0ilSR1ESmE2DqHUH7Ss5AdF


Mateusz Guzik <mjguzik@gmail.com> writes:

> On Sun, Apr 13, 2025 at 08:46:07PM -0700, Ankur Arora wrote:
>> clear_pages_rep(), clear_pages_erms() use string instructions to zero
>> memory. When operating on more than a single page, we can use these
>> more effectively by explicitly advertising the region-size to the
>> processor, which can use that as a hint to optimize the clearing
>> (ex. by eliding cacheline allocation.)
>>
>> As a secondary benefit, string instructions are typically microcoded,
>> and working with larger regions helps amortize the cost of the decode.
>>
>> When zeroing the 2MB page, maximize spatial locality by clearing in
>> three sections: the faulting page and its immediate neighbourhood, the
>> left and the right regions, with the local neighbourhood cleared last.
>>
>> Performance
>> ==
>>
>> Use mmap(MAP_HUGETLB) to demand fault a 64GB region on the local
>> NUMA node.
>>
>> Milan (EPYC 7J13, boost=0, preempt=full|lazy):
>>
>>                  mm/folio_zero_user    x86/folio_zero_user     change
>>                   (GB/s  +- stddev)      (GB/s  +- stddev)
>>
>>   pg-sz=2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5%
>>   pg-sz=1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2%
>>
>> Milan uses a threshold of LLC-size (~32MB) for eliding cacheline
>> allocation, so we see a dropoff in cacheline-allocations for pg-sz=1GB.
>>
>> pg-sz=1GB:
>>   -  9,250,034,512      cycles                           #    2.418 GHz                         ( +-  0.43% )  (46.16%)
>>   -    544,878,976      instructions                     #    0.06  insn per cycle
>>   -  2,331,332,516      L1-dcache-loads                  #  609.471 M/sec                       ( +-  0.03% )  (46.16%)
>>   -  1,075,122,960      L1-dcache-load-misses            #   46.12% of all L1-dcache accesses   ( +-  0.01% )  (46.15%)
>>
>>   +  3,688,681,006      cycles                           #    2.420 GHz                         ( +-  3.48% )  (46.01%)
>>   +     10,979,121      instructions                     #    0.00  insn per cycle
>>   +     31,829,258      L1-dcache-loads                  #   20.881 M/sec                       ( +-  4.92% )  (46.34%)
>>   +     13,677,295      L1-dcache-load-misses            #   42.97% of all L1-dcache accesses   ( +-  6.15% )  (46.32%)
>>
>> That's not the case with pg-sz=2MB, where we also perform better but
>> the number of cacheline allocations remain the same.
>>
>> It's not entirely clear why the performance for pg-sz=2MB improves. We
>> decode fewer instructions and the hardware prefetcher can do a better
>> job, but the perf stats for both of those aren't convincing enough to
>> the extent of ~30%.
>>
>> pg-sz=2MB:
>>   - 13,110,306,584      cycles                           #    2.418 GHz                         ( +-  0.48% )  (46.13%)
>>   -    607,589,360      instructions                     #    0.05  insn per cycle
>>   -  2,416,130,434      L1-dcache-loads                  #  445.682 M/sec                       ( +-  0.08% )  (46.19%)
>>   -  1,080,187,594      L1-dcache-load-misses            #   44.71% of all L1-dcache accesses   ( +-  0.01% )  (46.18%)
>>
>>   +  9,624,624,178      cycles                           #    2.418 GHz                         ( +-  0.01% )  (46.13%)
>>   +    277,336,691      instructions                     #    0.03  insn per cycle
>>   +  2,251,220,599      L1-dcache-loads                  #  565.624 M/sec                       ( +-  0.01% )  (46.20%)
>>   +  1,092,386,130      L1-dcache-load-misses            #   48.52% of all L1-dcache accesses   ( +-  0.02% )  (46.19%)
>>
>> Icelakex (Platinum 8358, no_turbo=1, preempt=full|lazy):
>>
>>                  mm/folio_zero_user    x86/folio_zero_user     change
>>                   (GB/s +- stddev)      (GB/s +- stddev)
>>
>>   pg-sz=2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10%
>>   pg-sz=1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57%
>>
>> For both page-sizes, Icelakex, behaves similarly to Milan pg-sz=2MB: we
>> see a drop in cycles but there's no drop in cacheline allocation.
>>
>
> Back when I was young and handsome and 32-bit x86 was king, people
> assumed 4K pages needed to be cleared with non-temporal stores to avoid
> evicting stuff from caches. I had never seen measurements showing this
> has the intended effect. Some time after this became a thing I did see
> measurements showing that this in fact *increases* cache misses. I am
> not saying this was necessarily the case for all x86 uarchs, merely that
> the sensibly sounding assumption turned bogus at some point (if it was
> ever legit).

That was a long time ago though ;-). And, your point makes sense for
small sized pages. But, consider that zeroing a 1GB page can easily blow
away an L3 cache for absolutely nothing gained -- probabilistically,
nothing that was in the page that remains in the cache will ever be
accessed.

Now, you could argue that the situation is less clear for 2MB pages.

> This brings me to the multi-stage clearing employed here for locality.
> While it sounds great on paper, for all I know it does not provide any
> advantage. It very well may be it is harmful by preventing the CPU from
> knowing what you are trying to do.
>
> I think doing this warrants obtaining stats from some real workloads,
> but given how time consuming this can be I think it would be tolerable
> to skip it for now.
>
>> Performance for preempt=none|voluntary remains unchanged.
>>
>
> So I was under the impression the benefit would be realized for all
> kernels.
>
> I don't know how preemption support is implemented on Linux. Do you
> always get an IPI?

No. The need-resched bit is common. It's just there's no preemption via
irqentry, just synchronous calls to cond_resched() (as you mention below).

Zeroing via a subroutine like instruction (rep; stos) is incompatible with
synchronous calls to cond_resched() so this code is explicitly not called
for none/voluntary (see patch 3.)

That said, I'll probably take Ingo's suggestion of chunking things up
in say 8/16MB portions for cooperative preemption models.

Ankur


> I was thinking something like this: a per-cpu var akin to preemption
> count, but indicating the particular code section is fully preemptible
>
> Then:
>
> preemptible_enter();
> clear_pages();
> preemptible_exit();
>
> for simpler handling of the var it could prevent migration to other
> CPUs.
>
> then the IPI handler for preemption would check if ->preemptible is set
> + preemption disablement is zero, in which case it would take you off
> cpu.
>
> If this is a problem, then a better granularity would help (say 8 pages
> between cond_rescheds?)
>
>> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>> ---
>>  arch/x86/mm/Makefile |  1 +
>>  arch/x86/mm/memory.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mm.h   |  1 +
>>  3 files changed, 62 insertions(+)
>>  create mode 100644 arch/x86/mm/memory.c
>>
>> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
>> index 32035d5be5a0..e61b4d331cdf 100644
>> --- a/arch/x86/mm/Makefile
>> +++ b/arch/x86/mm/Makefile
>> @@ -55,6 +55,7 @@ obj-$(CONFIG_MMIOTRACE_TEST)	+= testmmiotrace.o
>>  obj-$(CONFIG_NUMA)		+= numa.o numa_$(BITS).o
>>  obj-$(CONFIG_AMD_NUMA)		+= amdtopology.o
>>  obj-$(CONFIG_ACPI_NUMA)		+= srat.o
>> +obj-$(CONFIG_PREEMPTION)	+= memory.o
>>
>>  obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
>>  obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
>> diff --git a/arch/x86/mm/memory.c b/arch/x86/mm/memory.c
>> new file mode 100644
>> index 000000000000..99851c246fcc
>> --- /dev/null
>> +++ b/arch/x86/mm/memory.c
>> @@ -0,0 +1,60 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +#include <linux/mm.h>
>> +#include <linux/range.h>
>> +#include <linux/minmax.h>
>> +
>> +#ifndef CONFIG_HIGHMEM
>> +/*
>> + * folio_zero_user_preemptible(): multi-page clearing variant of folio_zero_user().
>> + *
>> + * Taking inspiration from the common code variant, we split the zeroing in
>> + * three parts: left of the fault, right of the fault, and up to 5 pages
>> + * in the immediate neighbourhood of the target page.
>> + *
>> + * Cleared in that order to keep cache lines of the target region hot.
>> + *
>> + * For gigantic pages, there is no expectation of cache locality so just do a
>> + * straight zero.
>> + */
>> +void folio_zero_user_preemptible(struct folio *folio, unsigned long addr_hint)
>> +{
>> +	unsigned long base_addr = ALIGN_DOWN(addr_hint, folio_size(folio));
>> +	const long fault_idx = (addr_hint - base_addr) / PAGE_SIZE;
>> +	const struct range pg = DEFINE_RANGE(0, folio_nr_pages(folio) - 1);
>> +	int width = 2; /* pages cleared last on either side */
>> +	struct range r[3];
>> +	int i;
>> +
>> +	if (folio_nr_pages(folio) > MAX_ORDER_NR_PAGES) {
>> +		clear_pages(page_address(folio_page(folio, 0)), folio_nr_pages(folio));
>> +		goto out;
>> +	}
>> +
>> +	/*
>> +	 * Faulting page and its immediate neighbourhood. Cleared at the end to
>> +	 * ensure it sticks around in the cache.
>> +	 */
>> +	r[2] = DEFINE_RANGE(clamp_t(s64, fault_idx - width, pg.start, pg.end),
>> +			    clamp_t(s64, fault_idx + width, pg.start, pg.end));
>> +
>> +	/* Region to the left of the fault */
>> +	r[1] = DEFINE_RANGE(pg.start,
>> +			    clamp_t(s64, r[2].start-1, pg.start-1, r[2].start));
>> +
>> +	/* Region to the right of the fault: always valid for the common fault_idx=0 case. */
>> +	r[0] = DEFINE_RANGE(clamp_t(s64, r[2].end+1, r[2].end, pg.end+1),
>> +			    pg.end);
>> +
>> +	for (i = 0; i <= 2; i++) {
>> +		int len = range_len(&r[i]);
>> +
>> +		if (len > 0)
>> +			clear_pages(page_address(folio_page(folio, r[i].start)), len);
>> +	}
>> +
>> +out:
>> +	/* Explicitly invoke cond_resched() to handle any live patching necessary. */
>> +	cond_resched();
>> +}
>> +
>> +#endif /* CONFIG_HIGHMEM */
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index b7f13f087954..b57512da8173 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -4114,6 +4114,7 @@ enum mf_action_page_type {
>>  };
>>
>>  #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
>> +void folio_zero_user_preemptible(struct folio *fio, unsigned long addr_hint);
>>  void folio_zero_user(struct folio *folio, unsigned long addr_hint);
>>  int copy_user_large_folio(struct folio *dst, struct folio *src,
>>  			  unsigned long addr_hint,
>> --
>> 2.31.1
>>
>>


--
ankur
