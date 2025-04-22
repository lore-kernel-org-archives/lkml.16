Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773C2512C3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309414; cv=fail; b=bJNy+dZU6in9YbDF+wHPz+CXNYPQfrlYD0T4qAQBP6/VJYWzF6Se2vUTaahV2UTIw50i8eifZRiuZd5HNcskYIVBmpHIJfPio/qRF5uXM8MkHVLb+NozDqPXc93i93FLn2yNEDrSPzuDhKwXe3azeWK1cqsps4Fn8v3GDwigdDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309414; c=relaxed/simple;
	bh=YyQm0zfnE/GOX9hQuT2madoohBV4GpKMgHhgEwC9IZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YoNvmrPn+9wR/n+7iqtrLlYJ1ZS3lAgVU/3N8CwLmYXJMnLVNr4R28/djXOWfu6uqH9aQVRT/KjZc8X7mdGwdP2kqaJuXtt6AWJ4rXXc6/uCuOrWwVjzMN0abjjvJKlA97Q0ZzyxMKEglCzeiTYfAxMERkT/w28TERtIQgRqUt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ncJUzFOU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MdacxFe5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ncJUzFOU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MdacxFe5"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7Mx1b016175;
	Tue, 22 Apr 2025 08:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=AjGL/kfeyRYEIw308dmqe7ZSy9pdc5LmotsX6koWyE8=; b=
	ncJUzFOUHrdBy6zWcDrDBOL7WcJeZYOFu7iHPzOs8D16+p2mPII54xeCFZdhIV5p
	mr9shfPahjENU/RjiOG8QNj5G87nL9OWK0BT+zBhniR6L6ss/xwlfSkdWbh4xQnX
	I7InMf9iVmEuoiaN2oHnHqXoECH06hK7FXICtTkBHwXX6zGEUYlN9jbPl+u1msV0
	/TkjnlV09f8EyZ5C0pqcHaIAFo8g5tx7qc5WXpAdPxKbYnAeVN0s8WeQ5dOTUOV0
	VvKEb+dK+aOKkbJyFLmqJ3O69yyB6Yuog6M7YktRs9tv1SsQNoKlAF/nXRobg5rM
	K+z2agyRxpKe/c6Kpx3mXA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46428c3yh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M74DRX005845;
	Tue, 22 Apr 2025 08:09:58 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010005.outbound.protection.outlook.com [40.93.10.5])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4642999cm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYI1XR6wZkE8eO78T7m5zMvJyXLl6dAhCO+z793Sz5VuT7MZMMVTf6VORNGnvzxC2nV040wemZn7cPDVC9bBkY5TEAo5APJCNJsIVrQ64SakpqjZ7yhbaLHDGdqGE0tNV0UU6Z+TyU/brcrtgSusqM3whryDzJ67zD6D/1ISHVz5rdUtgjNCb0CfIAsOy/bxCzZXrBCn+4KupVkDH3litFat+w7AkoMiy7ck1DGaiZ1ts8wJO0HwEfljJtIJtfvlr1gQm8GfhjxUicH33kZf6Zs+lwocLP4crLcz7tnd1+JXe4ZDQWOh0E1MqVyl8Dbf2K5OFWnIioBtlfMrW3vcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjGL/kfeyRYEIw308dmqe7ZSy9pdc5LmotsX6koWyE8=;
 b=wRWuYNIiZVsapGDw++g/3ULZrm2XRhZfQUYMNq3omsipwnsBTuGmJLluRaeK8meods/CJP5sE0b6FHP5eV+vQVucqP6CraBXKKy4w+rWBY8mSadoP8DSfzpoY1teb8BG+1bdQxjkTKuHgNZtVViztPOQmb98anxbOEwXxJlJot9fJDSPuOfDB6KnAZe3UPQbU1W1eB0dNAEdyb/lQw+3cMtriQwsspbNhgP7/ZyHrBbRhB7oQNoMqdvPaTFPuomMHOvmpJCrfJumMZK51g9Rf9mKq12Edg9JeXV4FmayLMVUq/MYwcQO0yq/816X+7wlYEEw2gLyWqY5NbDw0W5PQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjGL/kfeyRYEIw308dmqe7ZSy9pdc5LmotsX6koWyE8=;
 b=MdacxFe5UFjIDfrA9CUevjHHgtuDK1yz+xK0rS+FCtNGdF3Q8bLqV1t69LV3LiG0qube8zkQgblLDUs/rP1LJobw2kCwmRORwXizcEpxolKb4MhC4s2yRqtdQSuhMU3OEsvUKTxm8EYTdMOmENP2z29F1aUJvVvXPNl7hrWlxqI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:09:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:09:55 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 05/10] tools/testing/selftests: add sys_mremap() helper to vm_util.h
Date: Tue, 22 Apr 2025 09:09:24 +0100
Message-ID: <9e983e05e345419361ae3ac4e4a9f8242d3cdaeb.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0356.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: abcd43f3-6166-4dc7-aa69-08dd8175113b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q3sDO+p4nbtxMupbfxLfEZNosRM6NHQ6Zo7gi8WBanVje8ZhChO5SKR523Vh?=
 =?us-ascii?Q?cXgcj8BhkBWFHIe3+2csmQqBefCVZxdt3jzEmpdAt6pOsVgusHhTEY+uuH7x?=
 =?us-ascii?Q?eEUs3nZId4y6uC4JWTXVoQ4hJ2CdrlyVdJAA9AK6qq13z375c3yfYg7wMHdt?=
 =?us-ascii?Q?ZVDpq37tsYDu/mHiYWXT/JRHKsplWOXmBt5x8KQqQFVPdRcnGMyvwvb3yzL1?=
 =?us-ascii?Q?zO4LQil1UTVu/+EQCHm0oOpDnAA9Qa7dqgwxPNjt85W+WVwEWgjahIFVgNd0?=
 =?us-ascii?Q?DPjTmGs3J8BGWJuSNHvxfAo6rAlS1YrTC8NasVSXEs1UdPL2Ypes6ApAG/Nc?=
 =?us-ascii?Q?bHCBlEXMFi0WCcIz9yk6MHeqMbIBN7zXtWZbfcuzfNx+9/yHRWYlBnHnCjP2?=
 =?us-ascii?Q?C3gWZtXDITbgTbjEx2d6BdqxJVfs3f0eVdaJ8IEJkVtTiYj1N2WfbeO/ixxj?=
 =?us-ascii?Q?zf3Ei04R4XmZKDbZZ5uLEXC+UqfBF2j0lf/N2P5SDoqKGNtQizZMt+PehC9X?=
 =?us-ascii?Q?dEOKnDuolgr0DzrbtaWhnhiujrI7O91c0mjLqXRRcSVDipvh/YLK2wDNYrbr?=
 =?us-ascii?Q?u1stP6My7RpUe3SjoHf6d0zBUUbCnM1FGFMfAzc4UIvxwTRjaBFwYPMM++um?=
 =?us-ascii?Q?Sxtd8FEOEU0H3J5bZCCK8CcsKokFPfADwJ/w4kZdImdxBW+ZqkIZjHqqUxZC?=
 =?us-ascii?Q?4GgozQcaCAucU0myvEYyRsN7p+PMn8pB3DGQwDGZlhC0oypD0eUGn7bBHMtm?=
 =?us-ascii?Q?B5iOKPp8fhH1DhWUZ3+azfsVdwUp52qhc5gm9dO1qXL8k3qtbgUS95b7cZ+F?=
 =?us-ascii?Q?eMOyBJOcfyi8I28zCPqg/BLWwSUsHJsHIDx0i7tHWWrIV/vWlCP3G+UA4K2D?=
 =?us-ascii?Q?qDta2PllUFxaw0zsy2Jq6PLZuLCVQ7lwBtLQ+uc3TRJHMcFlCd9v1fM+d2nc?=
 =?us-ascii?Q?rHYHyIAwYFPET3GJVhEA08107I0Fo6HK4HNJ/lI9NCa2ZhVQcm0V09wMFzZZ?=
 =?us-ascii?Q?yxTIFqBPdcKzU5Ytz0akehkDMCddbhxcwdFnbzVeXv20Eo1SE/C/0405wLMM?=
 =?us-ascii?Q?AGsfLxCeWnGNFRBidRGOOaBpbTe/7zJU4lIY/cl5hJwZWyNyZNYr7tx57O4t?=
 =?us-ascii?Q?/DPQ378/3VJH0i0TpCKke8lPLoSO6NbUaWfOjlroQo3VHN3UdpoyAc3mfrXU?=
 =?us-ascii?Q?MLHm8u0s6ySlfkM+qkxmJ//gLCSjywHNRXooZkybyhgnJzeXXFeyGRVfcing?=
 =?us-ascii?Q?73tVPJ6z6460UHtBci4WVsmER8t9KGYCX21isfJLec95bsTxUbdMLPddcrwG?=
 =?us-ascii?Q?FR0HDsCdUkGQzJVsGdDNlCGg6EXsIAlakX6Hqb5CvYvJSm6YOyCh1ivjdtnN?=
 =?us-ascii?Q?BLjiG7zaAif5VpuY8LE1v3nF2BK2GyOYIL9eKNc3Z3Qn8CoZy0DYwzoEPt7x?=
 =?us-ascii?Q?suk42HrhXG4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Ts9nixdjmxZx2mV3WTXa/fNxV/r4IMA3bzOp0Db4fTeW8JQOL95odPSB18H?=
 =?us-ascii?Q?eAmWDEk9Rg9pwdLOq8bWI9n1SMJd44xjDtAyUqxC7ssUdxBI+omndB4R6TbP?=
 =?us-ascii?Q?/me9OQ7VDlnjMcHGSKHcjXA+I1owKKLOUo6GeBPKZlKiSGUm0frNAUUPzjX9?=
 =?us-ascii?Q?wp0/j95xrsoeYw2RIq4ClnG+uYhCFak4vzGM1YRHEt1vIeEfiOstmKt31b9Y?=
 =?us-ascii?Q?QMoKvh87U8qGy3TGtTEEtiLzQYqm54keIIGf/RpP+OQvrJd89UIRU2eZbTIK?=
 =?us-ascii?Q?HUhbYrzpW/UCEPC9Mfk+id78TW2aldw+UqcvfOwQaFYaTiUdeNVaiaozY3vo?=
 =?us-ascii?Q?m6Whfj8FYTv63lSxJkV+zsmBSqHRRtDEw+OaIzlDTOGDlYVFm69yJuGohmcp?=
 =?us-ascii?Q?HKfTENo/RfheLlNCHka5rqNphSrDqdcsYPUKL8jqw2Z26ejWzhtLwPx1mKxK?=
 =?us-ascii?Q?mdMnihCkFM1Nb5CWCXfH6RSDWs+ugvlg1DXgaFvpPaYJDNFeeJFvqM8qYBdW?=
 =?us-ascii?Q?M9q/SoZWWxwIE4IIsYzeUocijAIk6Y2bGJujW1H++QtFAVtGeNQrR0PFpVcC?=
 =?us-ascii?Q?m6/NtuUEpecZ+3BAn2iHmdEyQqMlD98Ibpf7zBtWdBblhyieEFtJyhWADsdT?=
 =?us-ascii?Q?BoKlLiKEYAsgYvZOZRv50Vk71DMHnbp+THQIBfBW20Mfaolv2EkYxzX3i/KX?=
 =?us-ascii?Q?dO37yRN7Epufvaj0XNK/aBLhA9bVa+ekA9sFZOVCGIGmVRYJ4R7KHj6DVj03?=
 =?us-ascii?Q?HsS+qbM++LqGQ5N0MHwvMvHQMyHGiNZ4sljFOFdI++uUUDBymk5T/UMdO4vx?=
 =?us-ascii?Q?Fx83J3QWFcAzCrzvu7tj1SHHJIX9or8p7hlTCLAAlC3klz8y7EdMnsR4Dz3W?=
 =?us-ascii?Q?myufnvE8n0RtqiXYstqA51aNYv6kvuKzUIVAQr1w7ysLcvatYFcl+SCGiBY6?=
 =?us-ascii?Q?WRm/SBXwyFf8DGOdNmrQtVG3m4g1NoATw9D2FrZQ64PsUY/Efe+V94rV8DLy?=
 =?us-ascii?Q?Ya00z84I81iB+Gc70ckwx/DHZHebrKH5BCVZdSoOVkJFItbN9EobYAY6bl5U?=
 =?us-ascii?Q?cWB/teHf7glhFG3fOEtX0s56pJB7RHwhLC5p+W0CfiDyR17zRfvap8Fu7vQY?=
 =?us-ascii?Q?IpDRydMCwGNV2rX++f/jWd0Y8N3mYeCL9q2FByEDft/H9Qt0N3d3qJsyKH5c?=
 =?us-ascii?Q?X1mw6RpINrl+QAQcr4ixyD/1hOJYCc+4un1sLA6XksmlKKk/1G7UsE2mppsq?=
 =?us-ascii?Q?qLD0XGMcGWzbVAQVKcf93gBAoLypTcHKxXKDBPICBYB5LNlrUbbeIDbsBv6/?=
 =?us-ascii?Q?MMH3IHYrpNorSb1jgx9F5D++DqSAD+JvoybCCRa7RH3zPgweTndVdHZSY0/c?=
 =?us-ascii?Q?G2q0yYUH6TF1ijJBqC9GZEw2urPepq2Ng4uFBhxkwWA453xY2nIvXQ+E/itb?=
 =?us-ascii?Q?MWQjqlgzczGM23pYaJcS+91rQ5xPq9lYrxCnaROsDwR8fWom8JEqS5HclF4X?=
 =?us-ascii?Q?pV7YhbdcdrznT6e7UsqlEr370YCsiBiHRk5Xv62zNrIkHv6V/dGbCzRw+ors?=
 =?us-ascii?Q?24CQaPjU7OdTp25G8jAKeHwuxX42FxHRbedAYE4UFq6fANwPABFJj/MmHJnk?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TSquZ4HqN/m+4T9Rxc6k+OquID5gjfI5Thjc8YlotvjTrQxNcvEbzXy0w+g7vNuTt1TQXm3EDRomdgyeODxLQkElEObcZ924QKwkdkvj7tj/KrWwE5gIjPavYlHHqAzn8TPGi4gBR8uXNNTeVwrEIkaKZPH8p0eLcXcl/ZDDBuEHsnl/cc5dXxmKM5wmwLSdhPvNGm4O7xsqD8pVr/yEu161z8LGsevf/DgbpB9K6Yh1SlRXGW+nrEPdXJemJH6W4jt/kGOt2zzN5hWW0ND4mIj8N7bGwCY8njyD+81iCCGbXZaTqSE6d6qaJWEg8aqY84O12HtyZUzaM9id5FwHeL0pUGMYbXsCOgjwmIB5kP8xQdspdg+/qriwOu/TEIGGbWlFvoZhfFzUxqoZq+8KYJx91l3krZ+qHUu9MM1LNIx9IuJ2PmpwHdtWrvGVhYIHfL2aDrpr6pEhI4g/FrDG1Q8hVSkaMkhP7OTSAM2t0Q1z4C/eaHWvCD1YS1H48iYDQjhameenxQj8UTu8BtVJpZzBE2MZCH+C/Az3z/icJIl2xp4UfWjbGntDiQXkxa+RfTQYbpp4zZeJztMzGrywN+0akyhakv3qqn9G9mDBLBA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcd43f3-6166-4dc7-aa69-08dd8175113b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:09:55.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksDIFH3TGTOb8zLYz07LBQXC1JOrA/HmBm/BTaSbN/2l9q1uZ+aOyLchx+hyejkkKdqknoLB6QzgzzFrFFGsrZB8OONGp6v3wUHX+F9VXwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504220061
X-Proofpoint-ORIG-GUID: fK9G8YD6YeYeuvzzjw4FuADFE4FDc3fT
X-Proofpoint-GUID: fK9G8YD6YeYeuvzzjw4FuADFE4FDc3fT

Add a helper to invoke the mremap() system call directly using
syscall(). This is useful as otherwise glibc and friends will filter out
newer flags like MREMAP_RELOCATE_ANON and MREMAP_MUST_RELOCATE_ANON thus
making it impossible to test this functionality.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/vm_util.c | 8 ++++++++
 tools/testing/selftests/mm/vm_util.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 1357e2d6a7b6..a2f07b10c0e7 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -486,3 +486,11 @@ int close_procmap(struct procmap_fd *procmap)
 {
 	return close(procmap->fd);
 }
+
+void *sys_mremap(void *old_address, unsigned long old_size,
+		 unsigned long new_size, int flags, void *new_address)
+{
+	return (void *)syscall(__NR_mremap, (unsigned long)old_address,
+			       old_size, new_size, flags,
+			       (unsigned long)new_address);
+}
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 9211ba640d9c..434a96b33738 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -95,6 +95,9 @@ static inline int open_self_procmap(struct procmap_fd *procmap_out)
 	return open_procmap(pid, procmap_out);
 }
 
+void *sys_mremap(void *old_address, unsigned long old_size,
+		 unsigned long new_size, int flags, void *new_address);
+
 /*
  * On ppc64 this will only work with radix 2M hugepage size
  */
-- 
2.49.0

