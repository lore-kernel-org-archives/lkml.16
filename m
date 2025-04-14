Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406C1C700B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660391; cv=fail; b=B0igjvO/PTKUfwjpOEBUNcxtK6WyDr6x9djzscM1wRSIMELZyCCKuM1Rp9ewAT6FaCVRkhg8TcSwdpJyferx7WeIcOJxSJRy/issp7DRfaBpCwN3nFbcWNNa/xqEXV0J7xgFM3VdbCYmYlMUCeNo6HxsVRDk5uyULE8mZXQAgQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660391; c=relaxed/simple;
	bh=B36qI00GOrjMiJz/l/L+MtKQ70ZT7QBq4CxwTnCK4vY=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=oGxfIQTzskeHmwl7U9GdC2QJZxU2qUJ7vgUBH7jcl8Hfmzyc18sja6+9LZkmyelKUtq7EbcNsB7m+b+MqUJ7D7EZoblUjPXQQufIbpNrgTd/pmK6lXV4Kt55zhgiULvwEBpTAxbE3A/70MuNfZf6qrAHvmWbyQyvB0tjIF9Z5bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h2NsjVZ6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h+bXYt6Q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h2NsjVZ6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h+bXYt6Q"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EHVxjj027670;
	Mon, 14 Apr 2025 19:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=CQiM9tKf6G1D/Ba5Ul
	0mtFhSMB6DDRw+zzCZsZbMDJU=; b=h2NsjVZ657fLWOq2JwVcBY+F84+b9W0C+h
	wBcWykZz397y7PiLjUGa0SHr8ZHcUxQeskg3UtJmclvkV4tPafb0/Hi/sUg5DAf/
	XRP/2uth5bgu4rLE7OQxY74tRC4kXZyCjD9TmFNqSEkJW4uGAnPg4BDZl6N42BSg
	17NNmQPtP7XZEqazV1zZeHOuOrpRO1EQPldtj3X+I+dErZzbdlpMeQaZgf9K9Yd2
	yAM7arGpnoZwflddoaYigAvXOT5znO/Ak8bYkqTvqK19TnoO8lbJtKJ4ektFxAsK
	+9ThHCZZRD2vEE2TNf6mSYcEk1/RtwMvbb8wu1zIfTMGUR2GM0DQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616uf0a1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:52:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJPcSs008610;
	Mon, 14 Apr 2025 19:52:41 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010020.outbound.protection.outlook.com [40.93.12.20])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2p05sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:52:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QI0cFPCI6DG/+A4cqket+LFQ5zqvFB2LDDt3J/miyzBwLDiujlPxPX/SbpuWPCmOiJfnDOCq5VXGHTMQyGAP7TnMoJAtDmAUbG/57Qq7pa8AHMs3aE1xziv9GF2CSquC0FgKjaHg87tEjsu0lzI4v1tUONTWkFWqT34taSMy+xdYS/U4x2e727fFtJwpE7BCRWeeK/g53zsGMBtgorno/bzRXa8kuSktm9XprINKxVgGDCyyxeGPG4mkjS5IbvANb2utp9iDcGM0euXQLCXNwwLzbB1bW9ApuLUQJj+0qPrccfWM68D5K/nXRnXLy1Mu6Wz9a4uNuF68WutVwO+uJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQiM9tKf6G1D/Ba5Ul0mtFhSMB6DDRw+zzCZsZbMDJU=;
 b=TCYiE5KT4wocbJbvr9ioUzjWjscUnCpZpDL5QzHMAlCYyQ/PqQvj4MxjfJlZEtMDqvEHyNLF6ZJ5fqqHEv8/OB2cz3YbjF3jGBiYJN2voeI2OfzM8/rO1SpqeZkOcr974YaUTmCSfAT6D8l8Mb6POQv9QlmDul9ifEi4Nh3O3ck5hIGEDWD5rGqdU+W7EH7pnvIMdL90ydhiXkGi/ETSTbGXFhb6Z/Jhngzt9vx+/8l6RXwwpwOai6Mjq8t996yF8zSiDe3U7RATqp6Vc3PqxeAiVrCWl2rqMlibV7gyLPxgo6uCQ5U4rSQLa2OuxMKyz3hBB1Wslot6GgvyrbMccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQiM9tKf6G1D/Ba5Ul0mtFhSMB6DDRw+zzCZsZbMDJU=;
 b=h+bXYt6QJmioGcjnk5UpcCO8htV/7uY1ucbRC7r5KaW2EQaTh/mNd5XIWGKxuPjY2vLi8KUUgUvseU5RKFU0Da5VGBaHsc6tVjZ9IqZ8Zjs+fnmnjijwFlcEKhZhhAKsS8fQ1PTYd3oMpMQ8CisM8iIURi5GH+U1QsYoR2okQ1I=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by PH0PR10MB4487.namprd10.prod.outlook.com (2603:10b6:510:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 19:52:38 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 19:52:38 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
In-reply-to: <Z_yr_cmXti4kXHaX@gmail.com>
Date: Mon, 14 Apr 2025 12:52:37 -0700
Message-ID: <87wmbm1px6.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:303:b7::28) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|PH0PR10MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a965c49-bc6a-447b-c8fe-08dd7b8de8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TJEGORtCcjDnIW95U7p6ucpNpM1E8TGPKaUPxoMn7GouHu/x+TLI/xNJIT+D?=
 =?us-ascii?Q?9rPR1XpIKG7RgL9CCvWEQ2vxa+n0q3BfBbHIeydzdIJ7EX2KCR7jn2wWN5tX?=
 =?us-ascii?Q?7//pJx7/ipJiAeHH6wk8XA04JwD+gSgHY8bdprKbfC4MQQVtd9m3pSkn9NC/?=
 =?us-ascii?Q?NntecYz3iKRMKfpwaGSDQZcneHD82mhZ99Xabv1t4+bWv4yCSu9Ezzx4Bgt0?=
 =?us-ascii?Q?i/V7sU30w0Ro3HuIMEZWDr2t+hbhfxXtEBIAG/x2fSS8hNY24bJyztLMjq6O?=
 =?us-ascii?Q?6pixkSP2RN/GAWefxdqsOUsXHQRs+91vJa3OVBbxYs0m2CvZ0JByCQu9os2q?=
 =?us-ascii?Q?NNMNuQyXgI4f1MOBnkikpCGgARh+KeGOsLgK1fREkDoP+JnMB3FppXft15F1?=
 =?us-ascii?Q?qJryF7yVEQi+iNYciyEGcalUC1Eq5tXH6Zy8rt5nuTfDFeAWX2fV4DDCuHDy?=
 =?us-ascii?Q?atzZedfQW85K2OJLRo3keYPFO0ZMBYCrC5VFsPGZifSAijeVdF+nXOEmPcej?=
 =?us-ascii?Q?whoik3YRH3Ew5ukVwjhjmKhiKs7XE4PQGdaXCg2tLOn37LLJwCZTWgOozMyA?=
 =?us-ascii?Q?AFZjs4HZlduYyZP4dD9A4KrO+0rzh6on1nDy9Cw4txBq6ZI0AGoQJbCVv+ge?=
 =?us-ascii?Q?ivzH3oaPvFaEwyB0M10w+ocDnM02Xbo8RWrLLdkEPrP1W3IFB6y8Xecgjgxg?=
 =?us-ascii?Q?BM5tdjjfUpdmlBiW+CCc7hUkj60obepNGBSu+d+joPxMZBjxphKfGnMWfDJR?=
 =?us-ascii?Q?noLP8D2hRr+hOc60AcymosDIacvg+lrBF6J2mML+huhgaK4SoJvgoihs+fxo?=
 =?us-ascii?Q?y/qb1+wnsSMn0JO9BbYV8i39z4WuCm0pls3QtT24l6J4eNg/cfx/WFMZ5IZ8?=
 =?us-ascii?Q?Hk/xvphepBGJwdKo3iGXyBXoRO59kvQK/LVF+848Y/7dHk/sNsf1dRp/GJ8j?=
 =?us-ascii?Q?7Mbv+odeMdI3Og0/AwtY4h4/9X0zH5GXQKszPStjGlym3QuKKdxr1XJbd5v4?=
 =?us-ascii?Q?8MApTqMdAsSjTUIDl0EhClU+Xv5EIttqqg6uTpXVobIP4aUmshbKJoJ2NFpI?=
 =?us-ascii?Q?Q+fGZ5PyOLjrt1vzq9MFHbmv0EZE2b0uRf9BRwIXUaMbPCkI+lTYpMB1FcSJ?=
 =?us-ascii?Q?ADa+6SC+/v0J6ATIxjSDW8FR52sdIrkowFyuEJY2tIgxmkSHDILes8kTCCR6?=
 =?us-ascii?Q?K2/VLHklUyfG/sOJrZlkfLUFg5fRl15pSyE/3TFV3XeHEgBMMj1eCIHyGi1t?=
 =?us-ascii?Q?Bt0tOwygaTIPd6blQ0O9XvCy1FxpPy5c/yS0dNVu9l7Bb6jBlUO5cRm43Zbn?=
 =?us-ascii?Q?oJfWiXJTI+v6vVZJ++mPUCYuXSFM51ZRvMXvDvx4Z7GOow2ULdBvi3am93Co?=
 =?us-ascii?Q?i3NH0lWx032jRczuf+sBWEyWnLyC5N3kF/oZfTcLNSVnVnu61Wgbq7o2cH17?=
 =?us-ascii?Q?/nA8W8ZyWIg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FrsJx1WNcNHP0MXw+N3ZQ8il6Ls7FLsHV98h8XayxhVgGkV4fKp/OvJDS+x8?=
 =?us-ascii?Q?ETUZX2na0AvjFPdtzlH+6Ukn9R0Xv2JrmZecNOjsDjqptk+Di9GGTDctM1Y/?=
 =?us-ascii?Q?PB138qfgloU5hcF0AIsHdxnz5h8mbI5SdzKrjumrYAbd6boU0lOubGYpZBDk?=
 =?us-ascii?Q?qhvk7GIp+bznWNoKQHWYyXAuUHKN75SBVdz1Eoro1OcBMQUSkjMowrHPW7UA?=
 =?us-ascii?Q?RgHRmLry2HL2+gB24I/4QjdSLBmJJh4j+HSSRp9PK5tfLKK5DXXIgPxx076Y?=
 =?us-ascii?Q?uZ5qZ/9t65Y/+1g5q9vdK2hODeBmzArPOK8bdSxO6u6TpaOvcFqPIb9Tz6gn?=
 =?us-ascii?Q?4rSG8f0utyDsIHcvJabTGssrCyfZgCNrDc04GjUoPzPPPCjombR1tsbYdID/?=
 =?us-ascii?Q?K2v7CpvsrMy6mE+EstB5xLFp9hXhsLIehkd+9/Ihn7C4R8nIgFOXu7ql/2hY?=
 =?us-ascii?Q?Cekui+GTaPAp2elYBRomeqoAEZGi6pE2scHX0JIQNy6YaynvaobgZIEQch8j?=
 =?us-ascii?Q?sNzb3AShSaSYxuanRDgN8MHzzy6rIJPxBp6VmPL5oLuztITWIAWlAPJqIlcI?=
 =?us-ascii?Q?yhYOpKPXsXXlliktjmGx2BKwmWc40rzsWpMlo9SuDp4fNSeHFad5iyt2DFqP?=
 =?us-ascii?Q?bxEYdxwxVjQFAG2zT1Ysryh9BNSayw44t0BCdD1lyOOOpMotMb4UxxZoepsc?=
 =?us-ascii?Q?c+YK/taD3n4tebXtOgxLyyZ8cR2tBH6BRcXKXnwtJa0tRBHi6uKMKnq/mCeo?=
 =?us-ascii?Q?bjbqkiujSfF9lLoGsg9lD4YmjMFsdRzbG2BFj+Xu6lxOWYHQa5ylRRQkHzXR?=
 =?us-ascii?Q?2VxGr3cNwklPbqxr/yXc+Kmo2tzJ5bD6EQyPN2H8/VppWn4zIuEr5c5pDUHf?=
 =?us-ascii?Q?T4+4nrB0x1EjwU89WdVuL4Tq8DBVy0oDSfKnd7WfdndwQo2iyrdeHW5fn0R3?=
 =?us-ascii?Q?1d1/TUHpnXd8Wci6kmGa0o6BGcT+TlA55EsZIBP/lnQvTdywxhb8MzFiieRU?=
 =?us-ascii?Q?byFmZbiZMkvqNIlbsn7RxSv86j0KdzeUUaomyX3b1olOjyVuGmevmP2wv+mr?=
 =?us-ascii?Q?f2SiWfrciWX1+y6HJygn8EJFOvVzhSzU1F5rPxEdGvf6fxwEptfOb9vFeDQd?=
 =?us-ascii?Q?FUmFDABzpkHf7tli2RIFc+EXBMOi4e9M6hH2G4G3AmVRktijUJZn1n64m98H?=
 =?us-ascii?Q?noUI1yPrHx5jA+brKyKV/YSd6ohuSVbGNQO8AT/2C1FvLgptWNXdLxaaE5nz?=
 =?us-ascii?Q?a3hwUuhBHFAUheNmePLM/1fhmPJ2xz+ataYwunu5fCAMozWnPAOn1r8BZRsu?=
 =?us-ascii?Q?MoSXTBXkz+y/0VeVoiQJe6OJs2Pp97r0azuapgCBLmQrxlJHZ0xRn5GzSNEC?=
 =?us-ascii?Q?H9LQuDik0ZTOoNQSFTYJS75l3X4h1lQBuCLzJr+o7s7CqF34dp2o8Jr1nrSk?=
 =?us-ascii?Q?W7KogylMYg6sDjkzHY6ke9wmeT54cGutLgF06CrPe6jRmoRKh6MFuJ2p7DPi?=
 =?us-ascii?Q?J8EroC92l9Fv717hbbQ/UqiD3PQKThpsu5ZN+upyvGqICLqgk00gLCrx6ZpY?=
 =?us-ascii?Q?xMlz6HeKsvfueV86AVhtFgdgWIGy6AnJDJ//WHWPSR448TWlQAnDt70M0V60?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EQy3rFEWlR2rdNitLwIKzho+tJ8AQcfg0PtJiP1JyKXa+r+uq5an7HyvRDoeYIUUIUMdwxv4kwyNfRk+g9ycGWURfyF9iN9UqFOFjEnt+Rk0E5DXjUSpN4nmnIYFD/f6ADBPdMoiQi1qutF//VvcAnrgMHcV8yyx2C+YwgLnsLCdfbTGS6fjAyMWUvkW6lVlt01dFRafbmuSR+xwI5ZbsWZF3h44z+1EDgqxFrvx2NZ+x6CHb2NL5jCm+5YufxGQ+wVfE3IHKtOhJsqaPzT35yDGO3IWGccqlL/rEcdqJ1F1f94eKMJuXJU/OtEe72JhWTRFKn6uKlJQP0CTRnuzkbaemFjaw8CiE3SLFNjINEBsIZ7JRyQP3f6gqPLdZTzcUTPlGUXeR4zPQo9IaiJGKnvklVDbvd8GFpGftX1Gwz8VsmLaWCk8oEl8DjN1/31uWhwS+s7lFZzcsd+lU+7G7oss1eZDEZhbbFLFV328VIH3vcuNi2wgafzWaXxFPy0i1nTJXYYxOJ3kCaIJk6IeUU0MZha8pAW9mqzw+nJZnsfAsI2BhaTGFLnIWQ+LRKqZBZ1X7WApZ9YBAk0mSDRCY8jqW0lLjrKqf0Qhac9ujLg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a965c49-bc6a-447b-c8fe-08dd7b8de8f3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:52:38.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22ZNJn+titH9I+pjvrZb/AAw/ZSPH05Jg4ft5V+mHwKNecGRcX7ielNldzWrNqFFUNDE/v0L3I4fawhdZgGNq3uUqRKDE4l+F6zd3nejRXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4487
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140144
X-Proofpoint-GUID: g9-UHBu2YUhUhDuR75Q-yJYGqiKCKE4q
X-Proofpoint-ORIG-GUID: g9-UHBu2YUhUhDuR75Q-yJYGqiKCKE4q


Ingo Molnar <mingo@kernel.org> writes:

> * Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
>> clear_page*() variants now take a page-aligned length parameter and
>> clears the whole region.
>
> Please read your changelogs and fix typos. ;-)

Ack!

>> +void clear_pages_orig(void *page, unsigned int length);
>> +void clear_pages_rep(void *page, unsigned int length);
>> +void clear_pages_erms(void *page, unsigned int length);
>
> What unit is 'length' in? If it's bytes, why is this interface
> artificially limiting itself to ~4GB? On x86-64 there's very little (if

I was in two minds about the unit. Given that the largest page size is
1GB, decided to go with 32bit. But, as you say below, there's no reason
to limit the x86-64 interface for MM reasons.  Will fix.

> any) performance difference between a 32-bit and a 64-bit length
> iterations.
>
> Even if we end up only exposing a 32-bit length API to the generic MM
> layer, there's no reason to limit the x86-64 assembly code in such a
> fashion.
>
>>  static inline void clear_page(void *page)
>>  {
>> +	unsigned int length = PAGE_SIZE;
>>  	/*
>> -	 * Clean up KMSAN metadata for the page being cleared. The assembly call
>> +	 * Clean up KMSAN metadata for the pages being cleared. The assembly call
>>  	 * below clobbers @page, so we perform unpoisoning before it.
>
>>  	 */
>> -	kmsan_unpoison_memory(page, PAGE_SIZE);
>> -	alternative_call_2(clear_page_orig,
>> -			   clear_page_rep, X86_FEATURE_REP_GOOD,
>> -			   clear_page_erms, X86_FEATURE_ERMS,
>> +	kmsan_unpoison_memory(page, length);
>> +
>> +	alternative_call_2(clear_pages_orig,
>> +			   clear_pages_rep, X86_FEATURE_REP_GOOD,
>> +			   clear_pages_erms, X86_FEATURE_ERMS,
>>  			   "=D" (page),
>> -			   "D" (page),
>> +			   ASM_INPUT("D" (page), "S" (length)),
>>  			   "cc", "memory", "rax", "rcx");
>>  }
>>
>> diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
>> index a508e4a8c66a..bce516263b69 100644
>> --- a/arch/x86/lib/clear_page_64.S
>> +++ b/arch/x86/lib/clear_page_64.S
>> @@ -13,20 +13,35 @@
>>   */
>>
>>  /*
>> - * Zero a page.
>> - * %rdi	- page
>> + * Zero kernel page aligned region.
>> + *
>> + * Input:
>> + * %rdi	- destination
>> + * %esi	- length
>> + *
>> + * Clobbers: %rax, %rcx
>>   */
>> -SYM_TYPED_FUNC_START(clear_page_rep)
>> -	movl $4096/8,%ecx
>> +SYM_TYPED_FUNC_START(clear_pages_rep)
>> +	movl %esi, %ecx
>>  	xorl %eax,%eax
>> +	shrl $3,%ecx
>>  	rep stosq
>>  	RET
>> -SYM_FUNC_END(clear_page_rep)
>> -EXPORT_SYMBOL_GPL(clear_page_rep)
>> +SYM_FUNC_END(clear_pages_rep)
>> +EXPORT_SYMBOL_GPL(clear_pages_rep)
>>
>> -SYM_TYPED_FUNC_START(clear_page_orig)
>> +/*
>> + * Original page zeroing loop.
>> + * Input:
>> + * %rdi	- destination
>> + * %esi	- length
>> + *
>> + * Clobbers: %rax, %rcx, %rflags
>> + */
>> +SYM_TYPED_FUNC_START(clear_pages_orig)
>> +	movl   %esi, %ecx
>>  	xorl   %eax,%eax
>> -	movl   $4096/64,%ecx
>> +	shrl   $6,%ecx
>
> So if the natural input parameter is RCX, why is this function using
> RSI as the input 'length' parameter? Causes unnecessary register
> shuffling.

True. Will fix via ALTERNATIVE as Peter describes in the other mail.
That should get rid of some of the repetition in clear_pages_rep and
clear_pages_erms() as well.

Though I guess clear_pages_orig() will need to stick around just with
a different parameter passing convention.

>> +/*
>> + * Zero kernel page aligned region.
>> + *
>> + * Input:
>> + * %rdi	- destination
>> + * %esi	- length
>> + *
>> + * Clobbers: %rax, %rcx
>> + */
>> +SYM_TYPED_FUNC_START(clear_pages_erms)
>> +	movl %esi, %ecx
>>  	xorl %eax,%eax
>>  	rep stosb
>>  	RET
>
> Same observation: unnecessary register shuffling.
>
> Also, please rename this (now-) terribly named interface:
>
>> +void clear_pages_orig(void *page, unsigned int length);
>> +void clear_pages_rep(void *page, unsigned int length);
>> +void clear_pages_erms(void *page, unsigned int length);
>
> Because the 'pages' is now a bit misleading, and why is the starting
> address called a 'page'?

> So a more sensible namespace would be to follow memset nomenclature:
>
> 	void memzero_page_aligned_*(void *addr, unsigned long len);
>
> ... and note the intentional abbreviation to 'len'.

Ack.

> Also, since most of these changes are to x86 architecture code, this is
> a new interface only used by x86, and the MM glue is minimal, I'd like
> to merge this series via the x86 tree, if the glue gets acks from MM
> folks.

Works for me!


Thanks for the review.

--
ankur
