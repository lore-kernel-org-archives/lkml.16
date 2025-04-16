Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E221CAA98;
	Wed, 16 Apr 2025 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744764228; cv=fail; b=TznL5ij7Hm+ji79nBgIKb1SfH1d1fytjMIuWmm6Q0PqEr/iIetvCkU6lV7O+gCNnv13AjIxwqanUBJLIzcXgYWM5kW0JFLyIZEQT28+UCrbzy3fh+E5qeBjL78GgJGF3mqxmC+UP1jnMrT+oGg8WziwWroRuiGnqmVaw5osz2KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744764228; c=relaxed/simple;
	bh=xcd/DyYF6qXFgF3NbX4dylgIOWORNoPARHxTVVtlLWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pr0Z5gXiJ9aZz3Ev4pTrrN18J3XuwQqNRY2suONTgGn7tRIDd7vcYnMRDwma1pjZPwT6ARK+e3m3x3CoWCleoVPy+bWEwdzJ2LKEvA8sI1j+rS4royuTMU2v2gcxsRcca03eQVZCOjRRs3LeSNt83UO9C6TEgLlRLUQnwhYIX50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CTKR/Tyh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WhuA75dI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CTKR/Tyh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WhuA75dI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FMN4xX008896;
	Wed, 16 Apr 2025 00:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=P9+mkFBTIA3mxnaOv9
	pTjO+7q+2vyy1KCQThH/FHapo=; b=CTKR/Tyhy1Et/QH5c1ZZPtkj8iIhtosR05
	07jPNqbhRn6docx+xlxU4W7ijbm80cJSzvvQmNYA7mcLYrvRnPtG5hwRKHRafr9V
	JpjCvUTnmhlUH1N+7P3ijo/s+tGpeyRmbPNEZDnOFs1to/SNxVztQN7f7e6U+Mhb
	kWCgZ/8UzstjfGJPC5d5YsAteXqVi/enfFdAm6uTefcp83ULRp//IoGiEXdilWbI
	yUyT+Rj9Uz3o4oJ5O/gzkcKTm2rV53yJpjqiNeXitZB+zx1zxMk/mA5iR7Tcx7cq
	uLxcCkhuSnygYikXAmjeuaHMbCP1+/VOn6ZZdcwBdS1DA0TsyJJw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 461944asdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 00:43:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FMhrh5024687;
	Wed, 16 Apr 2025 00:43:30 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011031.outbound.protection.outlook.com [40.93.6.31])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5143uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 00:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0js7FGhZ4yZiHzRLcgwso3gt5uy6200q88rnEYguUstkJ8CFMFYQH5e6xEMmwV86CeaIvfX2EK2MJEFumFjf9y5sfksajjE6sQCI/m7Bs/WRFP2zrnGiqfhrA/aVJcSzkzyDsUjznCi5H9wWhNOvmPhwCEbSEty0qHsztCjiE8JnU0dxnKlKDcNwWFVPYEbRsSHg7Ur+6o1EmozQhDrzsdIfPpMJFDrPwOyN/f0XYzDVRQTsxOkkfD+8qS4fZSnkcRuXf1+urAtI7otkXaTGmcm+9iRei9v1LK5dP8KrvqgASwxOsCzximHnF5otIzITb8/Ky1Xq1bPIMDjv8t9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9+mkFBTIA3mxnaOv9pTjO+7q+2vyy1KCQThH/FHapo=;
 b=DVI1x5FCkCgZNfmqDN3nqlyQDP0bn7U/a96xnSPCeg/7A6sKLf3FykgPnI0At5pS5W6rMXoYPpbT6JUwPHn6ZNxg4yatGtReryTuqIx97dGOvQj60CT0/Oj4dLmeFa5kz6Pn+B/Bj/8hSZRUUrEB2Pwbpj8xciE/gtfyA2b6+B9zhztPrlppFkhYrBJ9fSmpVrN54I24HSNLwOGZGF+NuW4ImeBz3TTJQ54q5Qrec+VuoM1YpQcfZx5Urv2aKFpPYqxA73PQZhUWowGrbPAdvLxODL101ftkfpr7Fq08FosfIF+ee+gaagTBMrFokGicxxxU++qFyfkLMVChcKd0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9+mkFBTIA3mxnaOv9pTjO+7q+2vyy1KCQThH/FHapo=;
 b=WhuA75dIBCgPfdcHj6rdvikTMbRYMChbFc98Cz2/xe0ysKqqbCjhtztcab4T2arD6pyuJqAsi5FrV5GwFk2+Z1EZXigfo2z3SL9fBWBume/JKc9PD0Q1w5dfQg5RgfrA3K+DyCdrzRZf1fWGXORxktX16yjmIIGv3Cj08qeFukk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA1PR10MB7514.namprd10.prod.outlook.com (2603:10b6:208:44e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Wed, 16 Apr
 2025 00:43:12 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 00:43:12 +0000
Date: Tue, 15 Apr 2025 20:43:07 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name,
        akpm@linux-foundation.org, jeffxu@chromium.org,
        lorenzo.stoakes@oracle.com, kees@kernel.org, hca@linux.ibm.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, xry111@xry111.site, tglx@linutronix.de,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com,
        zhanjun@uniontech.com, niecheng1@uniontech.com,
        guanwentao@uniontech.com
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
Message-ID: <luuupw2hrhmrxnrp5frgoz4kszbruuh7zkfqdrjrwgfe3uz3us@qpdwjw5btywj>
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQZPR01CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA1PR10MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: e590d492-157e-4040-4ebc-08dd7c7faaa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+W+dQWPXC3Qii2+FptLBtcOQ0115Mb/KRGb22AqAxNRf+ePCY0tXAouENOVS?=
 =?us-ascii?Q?sDVD38fVE84sNPuV2D/MlT9H0RWi5hUjf6g7Wt+Tr1uXCz70gzmiqMyHcQtX?=
 =?us-ascii?Q?nAecn9dyuycU9jseBr7T9lD+tiQrBmmD+KGfnG0ES8lTrL/gPFKxUpyoYVWe?=
 =?us-ascii?Q?0CZusPNDK2hVOjQbg9+nY6TcpxZwL6d9+l7vS4xVTjbO6m4zIQLz+08mEub6?=
 =?us-ascii?Q?K79JLk8Qsro1ScmqArycCHsPNUdZZ7w/kjMmOsnSL3Z5I2gTXOlbNN25t+xr?=
 =?us-ascii?Q?tceo2Jd9kMByC56gZJVUwYCd2e5o3Y4UafKxLqxOps7m/3dtSkziVK7XantQ?=
 =?us-ascii?Q?Q6CISRzxKmquOVAs0EjDKfPPCkeweWVqhc6P16Eb9tYhwlcOtc5R5LczZtS/?=
 =?us-ascii?Q?tXU/a33q+eOjCjdLyf0lwfMf0uIjBE4mObG4/g/JHxEfaeFwgUHIyCCtHAdY?=
 =?us-ascii?Q?P1RVIz4q6BS7Nv2uT5sjNcLuBGHVJ9oFW3C5fvHxPFIfmdgnJJSg46KTALqX?=
 =?us-ascii?Q?psY/nHuALIeU2DBBTGij7RAri0K8xZOocYYSFqTo/89xkYb9x+qsKPMWJVWD?=
 =?us-ascii?Q?3RR1uG/vwefGi5qb42H597Y9wriMn9RBKA/TsiLQGQlkD74mlpyY8vYfTrbb?=
 =?us-ascii?Q?5rQeniRXjQDG3gJoQsBArw7g5674vAI9bqQ3jCt78E7SEp1zS5R9UVFk3Md2?=
 =?us-ascii?Q?DlU9mOjR3MlM6C+EU2TK/U2o+sDORlyn6fS5YVX8Co/aHYFvOsKTPUvoaQXh?=
 =?us-ascii?Q?bTkmj5JEiD972/2C+zaemsUdJR0Er1whkN21OfGOyeS1Yg1vRngPs1Yobfsy?=
 =?us-ascii?Q?UW+e2MI57++EeiuhdTkW6zOAZBAmX46z62MMnySfO899ZDHtyXNB0vOogaIo?=
 =?us-ascii?Q?VvI+I7aMVxmi/TvkJ9Ezd+I94SpJiiJr+69oouDf52FFLwTHm4wcBv4VxSFP?=
 =?us-ascii?Q?fuOFYGB6tI/jFuIfNWjln5pxgxHHYCWwbF0UI0UoBwuCcQz9VPVglkK0N5tR?=
 =?us-ascii?Q?EJaJuQZp27Vr0LGQre4CzuLFrHKmJvq5ThtY0jA47mXFLVxeyljtklc3NvXE?=
 =?us-ascii?Q?zsn+kxYIAkpnvoiW+W6tCwhVhgyV21Tt6j9eessfRE6D1mOzPw8tej7dTM0/?=
 =?us-ascii?Q?06jyeUtiJn2xq8Hy5OA8Aci64C8hYbJzCoaXgE2GtEOM5sd9RfpjWRllrbTY?=
 =?us-ascii?Q?B36jygvJu1bHQCuWboNNUcPJng1hiEkbJvIDaaF7s//Kw7kHzlg8byp5vtil?=
 =?us-ascii?Q?uq8/8DaHzq1FF3MUbmwgZ/M1eqsg+zWr02/XCp0EO+s7SR0IJ9suvZXuv58d?=
 =?us-ascii?Q?rjsKJqxB1RUosyE8vkNTVVJ8HkhecXro1g8GImZzvJlEXoc9lq/fkSnf0fn3?=
 =?us-ascii?Q?lwqsrmBlNjOjBYVEL/KIDCTrV5Gy/xc8tgyV9YBYbcw10IilomUtptT9Ga0M?=
 =?us-ascii?Q?ErTx7hf2NG8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RG+OtRShC/nt5xVTXtzYWrnWuZDCaM6Xf6e8Q4Vwp/mAMVfrvbuwF0IACV4j?=
 =?us-ascii?Q?Rv768swkcwkV/LN9tpLtTy/wfis+Iywgq/K/T2cmPeOImOqgexufQ86ObQHm?=
 =?us-ascii?Q?TTL1ZwbINCbSLRY/75HUhNynot4EpNJtytMP8U7/gYyIevtAS4IXD4Hv3z8o?=
 =?us-ascii?Q?3Lm6q4NTGlIPR4Dj2x2ezPra4bzfiS4bbghOr98QD/D4X4Nm/EIfi1BHHoJ7?=
 =?us-ascii?Q?i2sbMN2lNnEH2Uoc8ewHZjJFzX2QcJVzWNlac/2xalVJR3S9e79ogOiNMvpB?=
 =?us-ascii?Q?ulppB0QqcbeZSA4+hFHGy2BbyfOX6iB89ugG1eXpKNWk5runVgBjwpyGRSVf?=
 =?us-ascii?Q?wbCoSInZWp1YG3X7GagbICt4Q47WvZI60xhXV05e26aXFRttzqZyBMlR0ZrB?=
 =?us-ascii?Q?NZcTMmkIJ/SK4sMjFX0UCqiORVVyC3k4Hpb32QbKaz9ki+3gk0wBZpKwVKBG?=
 =?us-ascii?Q?634KQzm/s1rS/c2+tdC1H9TmSWcnoG+j55s9S2t7w/mjMqJ4DxcTlN5BpQL+?=
 =?us-ascii?Q?x5F8Mj9Cn6ga8Y7b2/3bltnvK+wuaSb5CJ5wd/iJcQEM0IEOQ+6Fd2crdryu?=
 =?us-ascii?Q?OeYJDzZMJb1i9r/l0hd+b8qLQrMWGiQ8KDdTy4jREA6nDIssZp5S17zHpsl2?=
 =?us-ascii?Q?ekmmDRPcGGnEN4GUDxDvuNhOYY8EkwolfaadUTNJzofDgppwNPnxOYdv68+V?=
 =?us-ascii?Q?iXAy4459Zv+Z31ex/jzTyWuSQVxCEdO5XUuXo4BSzlu/AimaqmhUULYCgJK2?=
 =?us-ascii?Q?IL6JMB7jUEsutom+2LujuUkiNFX/x0oRbK2iyt+NYgY3/RdcxrACslN+K6Ik?=
 =?us-ascii?Q?Je2G8rWKWM0vXFNNXZ3A9Bqt2m3WrtHbWB63EIt08unWAzJu0RI3DYY/LnIw?=
 =?us-ascii?Q?FdsFiLm3JfhnEp+Cg9meVhluHCdTLNYo2BMdCzoUc9yemIwbt6QEP/anDeCM?=
 =?us-ascii?Q?sSj99dvvxX3utSrx2uZTejqwtNxi4vT8QScogFtfTmZ91mhvecHsLQAhTIJ1?=
 =?us-ascii?Q?Aym7vsrsFs3Hx/LMTFN+njBeQs3gFYUmIrADdZYOYhJ50MlwiLOSQ7hmpIhV?=
 =?us-ascii?Q?Lu+xYxiSOQ/ZSQH473kWqOq4AI7E+oFEYvqmx6r3pu32TnDcim1WFPBnAJdu?=
 =?us-ascii?Q?UM3WtE+eJ72IcYyIUtfSwXVGT4pWLZmonh7/084Vs7iPeA1a7qyvyX73/d6Q?=
 =?us-ascii?Q?Gt6FT5iT7NcDqkHnYdepthy624FefpkYsgCoZG2rVn1lgj4LtzdysEDl5f0z?=
 =?us-ascii?Q?5FO6xpDBDQCIaVUQZgRGMJ5tgCY0trk9tmXgQ3h+pW8/wRfg1eucae9DIvyC?=
 =?us-ascii?Q?4kF7cWJm+b+Io06h2DVjNs5C+ELLiBXjr8lLR7MgiJz2CdQGnm0CkrB9HU+p?=
 =?us-ascii?Q?vKdQZyzv+C46w4bOSqm6uIctUQl2lBFCkI8RvyxmSqYC9S3HtJPXGyEoji/n?=
 =?us-ascii?Q?MM8qQesBCvUi08T7i3uTp6jjecaNypNouO7WIfRY+yc+YG2tPNZVjucrqLJR?=
 =?us-ascii?Q?ReAqDomEHCRyAHlW446OywPT18TX5uDX8MD9AB5oHQtR6g7bmPVsS86KSUg3?=
 =?us-ascii?Q?/0hzWrgFrW6IVVefdUhsXEQTmRza1WygohkyHwVt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	68sC5/CIvwE1WRExfJs6hCHHSnSBYOsi1rERSF7qCMfh9jegTH1NAmDTdeW+pF4M4JNiD8uEeih1LznmOIE4bcjIS11whioRWkObJFDTTPaYoFUyLpVnzBpdAyWp7vZJ5kijEL/WzO7Bcu/UrsDc5DmIP14ZEnL1O/RaUynhgSbOqFOycLQGmNoTdPDK9DqN82ChIm7U3xdvSLmMhibtlbHFCeTg5xQahOZwc9RqfX7l5gONHM5JS3C9yEe9mRsKzHL6C4BlrVnTz6xAGXejKEc+/Gv7pcG0QJY39MKeDHnQSy7sibCNHP2H1lS6uCRRPQK2vq/zt7Gqf2fdvMHd4LmFf2kC69DBth7LsxfXLTl8cc1j9HHwzIzqEJms9lEAUtyjdegVSAwDvraWyeH7jVF1R/Qzn98UJ+ZNLhpw0rPiwj5UfwohUCcisGBCYg1u6RC70Mb5UiiucqQV5b5GLmR2CEBkkJPO0stF9RQwXLfivYcIBfFqN54k9gSleVzkFqo9dupwxGELQQVTCtmFfvPN7a6xod5K0o0FJgbBcI5n31N7obOxDge7zmPRDijKLWGUXijph1uTH3OdWNIjfnLkyUe/BL7k0M+mwnRpQzk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e590d492-157e-4040-4ebc-08dd7c7faaa8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 00:43:12.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P+pmrD079z/pHW2Uw+aA7/37fPpL8+DST+My0l1MW+GnHrZwI12oQx7McSYjjE+ApidaKWRCytFTmBT2xY4Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160004
X-Proofpoint-GUID: GKUdqS52p94CEkPiLMWMQx4BYx3V4tof
X-Proofpoint-ORIG-GUID: GKUdqS52p94CEkPiLMWMQx4BYx3V4tof

* WangYuli <wangyuli@uniontech.com> [250415 11:41]:
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> covering the vdso.
> 
> Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lucifer.local/
> Tested-by: Yuli Wang <wangyuli@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
> Changelog:
>  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> ---
>  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
>  Documentation/userspace-api/mseal.rst                         | 2 +-
>  arch/loongarch/Kconfig                                        | 1 +
>  arch/loongarch/kernel/vdso.c                                  | 4 +++-
>  4 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> index c6cab9760d57..a3c24233eb9b 100644
> --- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> @@ -12,7 +12,7 @@
>      |       arm64: |  ok  |
>      |        csky: |  N/A |
>      |     hexagon: |  N/A |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>      |        m68k: |  N/A |
>      |  microblaze: |  N/A |
>      |        mips: | TODO |
> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
> index 1dabfc29be0d..ef733f69003d 100644
> --- a/Documentation/userspace-api/mseal.rst
> +++ b/Documentation/userspace-api/mseal.rst
> @@ -144,7 +144,7 @@ Use cases
>    architecture.
>  
>    The following architectures currently support this feature: x86-64, arm64,
> -  and s390.
> +  loongarch and s390.
>  
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 067c0b994648..54ed5b59a690 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -69,6 +69,7 @@ config LOONGARCH
>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>  	select ARCH_SUPPORTS_LTO_CLANG
>  	select ARCH_SUPPORTS_LTO_CLANG_THIN
> +	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_SUPPORTS_RT
>  	select ARCH_USE_BUILTIN_BSWAP
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index 10cf1608c7b3..7b888d9085a0 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  
>  	vdso_addr = data_addr + VVAR_SIZE;
>  	vma = _install_special_mapping(mm, vdso_addr, info->size,
> -				       VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
> +				       VM_READ | VM_EXEC |
> +				       VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |
> +				       VM_SEALED_SYSMAP,
>  				       &info->code_mapping);
>  	if (IS_ERR(vma)) {
>  		ret = PTR_ERR(vma);
> -- 
> 2.49.0
> 
