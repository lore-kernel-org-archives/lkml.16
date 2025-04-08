Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0319DF6A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104662; cv=fail; b=kL6zabnZDOzJu+svODEOZ/e4BK5ILz5bORia9IsW1AbeAnuPZpT+fOZuDpi5n7YF3Ad6NE7zOcSwH+aUVYhuVmGsTyYcBEjgsS12AqUdR3sfXP5o5yfi9lxsPs3Qoc08mS8TnS63kcHgUvU5oaNYTvTTLKFdlo3pZGlijFs/kU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104662; c=relaxed/simple;
	bh=DzvAkVZyXFGexfZazhOrPZAYdgGzpc6pqftQIf/wTqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iEx9u0dh9sp0RJOl1FuLvIfsu7vy/f4ahViAQN3ASS7U7duXYj30iz/2e3c8JQRYMJ+4atN2bCy2om0nKhMLBF8PLWUeY1P/x3lNMven7eEw3qVKFYpXU58i7sYvuroLZbGi6VLhW4a37OSiXD53rF5wEeGRqvMpHTMxEd0ZDUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i7k9L/Ym; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O/NjMBKE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i7k9L/Ym";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O/NjMBKE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5381ubTN025952;
	Tue, 8 Apr 2025 09:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qHfxGge1XWrqzg6XFd5bhYi7zW7cscaCwV2bV2jBt/A=; b=
	i7k9L/Ym87/Bzyts0Kx/63JD5FV6dYizI6VQkvz6KMyr8AtRnJXLfsCevWt/mJSU
	HHPeEyGV0aVXU0Q9sZyJEn01/HkGGI/x+S0K+af8X3yR2DIjQNOcYECLlMbF9qa4
	sr+/dhx8UzPzidj2FRokHJJ/gt+WT8luip8eaafkZ/4S/eaITtKMVILNGRs/orTK
	pWrwAv11fYsylwuw4k6UtB1MWPib80qtgee3pe8EfxStyFRLJgMtWah13d8zUzE4
	f/l+hyPLEcGUGO+smlzsrFvMwSX0qpo9qHh+LmBi+lXhUhGrwXvW1UF3HQwhY3M0
	Nrmjp9gzYzq50vbbk6soIw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tw2tmbxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 09:29:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53882Bws013788;
	Tue, 8 Apr 2025 09:29:51 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012039.outbound.protection.outlook.com [40.93.6.39])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyfa2q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 09:29:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USSO0n7FoIpnV1/bs9+zQuyt3R/SnPcWSLZ2t3SjXt8IOB0D/cGz70TNJrNjJWo6pPoneAejwWA+nAfwoX5Um3KptyuGO93MjNGA9LbvD07Af3/3YgAKWcQbWWRBAQnLrM4y8zvRv0EPwNMidTDnqLKzTW3DODTxJNwR/z0GrX35dLzusypVYdH5EN76he4fdRbxSWSyL8E4J7qZfmJhTqWcOi40FHhHM+5xiXKiozoVfxpZ82uY0NHgY+34CdxluLl6HoIvHgsxgxpzkXOzY93AcfVFk2zLHGexFOPul9t0WzVCjREnbMPJJuxLO/zHKwCcsRmS/UtkGGPADtec7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHfxGge1XWrqzg6XFd5bhYi7zW7cscaCwV2bV2jBt/A=;
 b=IJa3XZbxtQavH3HjB9FV18EzRPibOfnsfJFXxSriappiIyUH9HYsMoONUZJ6xL98kC0eVaRwpUIp0CgOy7Oh/Wr+Em9XVxB648UN+mFkKdLVzu90fI3TNfUYf5MoruIZiXTcEbukVdEKTojk3Jzmg2JJyhihhyTDi/PI5H6+/dhoMS7g3lKxWdiE2d2tzFNXl6EuchoYesCVLXyh6NwfSUem+bJFuUWufvMuAXn8nssGX8YGpVAKXlGPN58TqFkKPrvUGoNT+kD536AM5p3hVXDJMfsSv3iIEZgEh+M/ay+YRdMqKqurRIJjHcMVawg4rWJjMIHr1nNCigKrxMlDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHfxGge1XWrqzg6XFd5bhYi7zW7cscaCwV2bV2jBt/A=;
 b=O/NjMBKEkfZSFsmZiTKG80/hd8zktVXLPhC2UW20Zu7IMBZn2FhUboDhhre0gNGf9yeZPWJH3dwpugVqBVTc/IkN7WJNNHDVXvlrLSyu2n22cu0WRcC4q5B6wwOFN36EM21j+BsKwiviruSC85F7mo30U5FEkkq1dMY/Y0lG1qY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB7244.namprd10.prod.outlook.com (2603:10b6:930:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 09:29:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 09:29:48 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] tools/testing/selftests: assert that anon merge cases behave as expected
Date: Tue,  8 Apr 2025 10:29:33 +0100
Message-ID: <2b69330274a3b71721f7042c5eabe91143934415.1744104124.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
References: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: a8176d6e-e517-49be-697a-08dd767fe816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wGJF/Nswgr1+C2aN/fPO+ssznmQ5/igA55E+httHLp7o/LKxhKgZqtIr7P3q?=
 =?us-ascii?Q?Ur8DPH5/KdR9dwePjtMWpuHw1xoW/2aasJwW51P5Joa+U9N71JHeqa/grDAu?=
 =?us-ascii?Q?Nx6nOI51Y68KtPis3oPEvLTgQYtj/9ctjXO2aGe1y1M+9YFtpIUoiOES6YBT?=
 =?us-ascii?Q?Yz2otfvmKKO29EXU+Z61+KZJ3/uNzADuJ0b9vl7DXzNK4r6rVpgD+fPHso6P?=
 =?us-ascii?Q?qtpB2JSQduLvon4EBN9AzOkYLE2Z4J+snDet8aABaROm5JDZ+IyjoEjg4aGS?=
 =?us-ascii?Q?QPAr02X8k5581j24QMMOC8xeMfi/4SeDeot+i/fQ1A9paeGKCg9bmEhcCpep?=
 =?us-ascii?Q?Nahr6e/Q4Z4i6fLZKDoSZBunl/iCWmD1EL85neUEOCaRD1G+aHK9eFUFojfC?=
 =?us-ascii?Q?CvJOv72rqpMdYTOLA5y32JPmtQ2GbDq180fR4J9p3WTQ2QZc6Fm3Si23aQ2j?=
 =?us-ascii?Q?S6Eg6x6FO6BRu+XniClXfhPBBibEEYWNrUHiR3Y6pe2CYDNi/Yhm5tDACrii?=
 =?us-ascii?Q?gHhYtm0QkMIb+L+oZPsrtyGFGMji1fv90dl7AcyH63ijgkSGj8KWMFOK3pEN?=
 =?us-ascii?Q?txpzlDfYxY2A71ZY3V3j7v8M5qaUIn3JL/pXRXN/BRhY6zWFCggNvL2CLnPL?=
 =?us-ascii?Q?5brieeWbdl+hUENDhoqbGM7ycNTaSpanbOCT5opECI6hbFDn+hmIObZm18YS?=
 =?us-ascii?Q?AmmuizbOvknjyt0IH5Ht0WLrRNzuLt5PH9L3qKiWeD/zOpYoxabA9ltSk/65?=
 =?us-ascii?Q?XGFNyCXN6eUhjjE6G10oNScG9Bl7WnqVpwiPipvvVujFy9XckpWYwh1TLx1q?=
 =?us-ascii?Q?dg1gZzBFj5PtYGKtlzgy4EkZAZnRL1+hCCig7HRmnDD+CT/bHobYS5DRXY8r?=
 =?us-ascii?Q?/6hQJJ5jVYJsJdk5GyVM0QSXf+mNWd/OKVpHiJ+UFWNHVhAo2ag/W+WUKM4e?=
 =?us-ascii?Q?w7LQm9HWt9FmCRG1IeIyBwFj9kP6ME/Vetf9msDcRgi8UaDQaa48LsownepT?=
 =?us-ascii?Q?ZGnGsfrcAnDi+RnNi8VVspp7Pxbk1fINd8s2iha6BYUSahK++/u0cvf5Usdx?=
 =?us-ascii?Q?4gNMxZnTNPY+dX7QEoh3BaJ7+bAcFkxWml7HMitTa05Bj+uUDa04gWpLUEut?=
 =?us-ascii?Q?VQcd6aCgvxvU2HaANguuiqcM+L1EJqfRto/AvWKD2ZG4ZGkWlp95kP80gS4f?=
 =?us-ascii?Q?YaGb5+l1XpXAv9KpRjIJ3oBsGizE4CJkjioPZoV5xWg5uzZJMCl3thV2H5Ku?=
 =?us-ascii?Q?GThki3GuMiHk6UbOBYq3FxYFkCAKkQYwP8BW39ULp0gStkCOUyMPchBHIi9h?=
 =?us-ascii?Q?8Pizbv8EomebsU61xeUQ/j7S4LEYWIZiudPll7h5D5u+afLKSgqalWL6jII4?=
 =?us-ascii?Q?7GU/O5elZFJ1vqfAhlnDiasE0xFt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p9x3d1/YlH9RUmTYwP2tew3dTqUtnHUL7ED0j7clZhjG3R4EPvo/LONBQiqW?=
 =?us-ascii?Q?TD9G5O2Xv3kkeZcCWxnMOTELV/T+CIKqgQxwDmYyUvNf0iSIOSHykTngJJF+?=
 =?us-ascii?Q?fyKT18zZ44MljlcnNHqYfpZ+Z5ytDvRxfzCfaPd+3VrwM7ruetbt8iY9vgbE?=
 =?us-ascii?Q?gXkjLTCFFXboePljQ+vEofgA4fSuAlnVFF2K4EjkpzvsAWVeQdVNeITrjWRU?=
 =?us-ascii?Q?yQd31BazDHJvh+x+BzIheLyHnelOqIXAv2K+Xw827b3RWip+bjmdQ2E4JiHp?=
 =?us-ascii?Q?1VJyQlUsGmzM04sTvhOB7yQeMgXY1DnvedHrWh0W+AqoQDk9J5srHp2BKJx8?=
 =?us-ascii?Q?2M4PwkQY7Jx8/cZLWeJsyJvoCjsp87miXXRwXXzniDV2nJDiyTpwomPh2sll?=
 =?us-ascii?Q?TL8Z5XgRv1wsshOiLpyo7cLswk0DYprVIlc4S7OZkktlkNf9gp3caVwFBEkD?=
 =?us-ascii?Q?LJwYrzOzBw8E5ZqfBiYQgmWd1GYs9iB5A1h5P3SmxihhTH5cOZmiqyw7+AYG?=
 =?us-ascii?Q?/wRw4xzNrWxym2s5V0J12dfAxuhySLRj/+bJRfHmY6MQg6FAI5jKqM7zOAmK?=
 =?us-ascii?Q?874m5ZCbuBbpRFIvdYLGmafiEhN/RXC8fQXachmm6KTF7vCxAA1lPbB2k5rk?=
 =?us-ascii?Q?Op3Z4sM1H/D0oGAMJ/6UeeyDBh26Q6rnbdPw2Olcc6iAq0M+7ta2xTWpBOi3?=
 =?us-ascii?Q?0Y/3sdu/NurY7MIyh2KIsXPq8MyR56A7mhA2+i+33GYIrzt5J7VGEB6GbGSz?=
 =?us-ascii?Q?j/R+atltPTx4PVnZotR7fsTJKCWvtmpH9uOs/BUtWG/Cj7p655+Zxn2zxdup?=
 =?us-ascii?Q?qgHSQi0VKvpadXYMIjHMES67j+nLwCrXCGK/dM+mlbZuhk82YFnXkk7rZDS1?=
 =?us-ascii?Q?0CwEMajdo/uho4gL5qwrFc68nJtYLsZJcnOurfwuik4DpEdnGkBTds4hXLOH?=
 =?us-ascii?Q?miKPSCQpSuWbFWP/FDtHbo5VZmKyjNK6dooluxdi0JzRiTP4mN9o8UwvIZSe?=
 =?us-ascii?Q?x63iId0IvDj72DwRRh3ctOMEwEAwvcQ4jtrc4AR0KZNlLWtm9k+Sv/5FhaUf?=
 =?us-ascii?Q?LjcDlfVE1U8ffLJvkSppDpTAmKX0sbvk9sLS1AZP8WMBEcHIZLJyV+7FXfPq?=
 =?us-ascii?Q?zXmj83q7zXG3TDe+XeLZ1tiQf7E8tDKvpykw+egrJh28av0Wkj5wquiC+nHR?=
 =?us-ascii?Q?ZMWLe/WZoBjks3pbYOzakkKQ5c1N9qI5xYzG2oNI1AzWDqS4hmxc11fhyttM?=
 =?us-ascii?Q?+IO8YFqltPMpCINNp4nWeNAOQJ/cToHAh0p7EMp6+LmTQMmWBm79owd88Aqz?=
 =?us-ascii?Q?GxFS/tndYk/jZy1zWtlNa3IDLNm84pXGWPri74CrnFh0GphM6low44ahn7/E?=
 =?us-ascii?Q?XZr4rTOFzlYZgJIyAmPlZF1MMBIK9g4xSX6V/xb8KtPUaLM0DMyKYEPGrMRF?=
 =?us-ascii?Q?5gwfxry/8k1YLkiQb3c4W3UOD6Hz3ISgXqfYDGfKzflEcBaKehVjc89fFm0A?=
 =?us-ascii?Q?l6YF2thnut2Zz5mV6ZXAo9zRFVnxiwyKfigCmkvPm5efm9vUYUXBmg0S7fym?=
 =?us-ascii?Q?XwyR2ALiQGLzzs/Xp6OJMFbwBu0rdHL28k9r1rItKtbNQA1o7xmcjTXbdgUI?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M3nTLpdrilwLkjz16W5tG2WEtugl470hdHZJARkERMf6qxbqTKZxaUbObdPWDFFDLIw1AmW4pi4kh/Hk2/B7XRjcseGaxqN8NAFnOyDoQ7BJfT3nPxxwNKEXZUBxaMLOuvXO3Jl4j9jQYzMXmE3oTQueP6DPI8r4hkv1CnxbRdn2ZXXtgHZNGUtERzJKUWx4pdpFdlWOxjVY+wZWvlBdIORoZIVWV3olW3NNPt0V/ALxInJLtnITG4ZmdsIg7IHe7p9GCBXl3uLuGZ8of1O5BescQkWZ99aO4+SAAiLvbhwpPeiTtasfqx0HK2+Q+1yrYrh8rdd5mnVVwSvwn3QINLTaaf1Eh0nDDDkYOEhV84dhsGSxjOnn4Eup5VJHty6VPxz+ak35NZyLs7W341wZS3BeGpj/x4oaqYEKPBH65VUZrhKblTnfyPcHop9jaBmSIyIgXMIJ7rx1mqf2SFDC7P7D+DoPpKIPaGJP/4x4tqevvx6+3W6HVlbcEU3QQTmP7FncTVB915jCrq/D6tPxE8UC7a6jxhg3uP5jwUN6vzjgLM0lKuB7m6+yQfns3IinJzvhcr2V2pebVXZS0T+1l0zWXIbnmWnJwuYQ66DQZaM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8176d6e-e517-49be-697a-08dd767fe816
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:29:48.5038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uth4CAPdprh85Z+45jP7kVHVhZ1oXnfoWMK/kbAtNR5p3VQ8CaMGuZuNIzw8bn6FG9Y6869nLU2FQZBYLKdOLwwrWoZa59H52gVo1p608Vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7244
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080067
X-Proofpoint-ORIG-GUID: 0XmnN6M-vh6sUzVCMtATta6KVd_3WrK-
X-Proofpoint-GUID: 0XmnN6M-vh6sUzVCMtATta6KVd_3WrK-

Prior to the recently applied commit that permits this merge,
mprotect()'ing a faulted VMA, adjacent to an unfaulted VMA, such that the
two share characteristics would fail to merge due to what appear to be
unintended consequences of commit 965f55dea0e3 ("mmap: avoid merging cloned
VMAs").

Now we have fixed this bug, assert that we can indeed merge anonymous VMAs
this way.

Also assert that forked source/target VMAs are equally
rejected. Previously, all empty target anon merges with one VMA faulted and
the other unfaulted would be rejected incorrectly, now we ensure that
unforked merge, but forked do not.

Additionally, add the new test file to the MEMORY MAPPING section in
MAINTAINERS, as these tests are explicitly memory mapping related.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 MAINTAINERS                               |   1 +
 tools/testing/selftests/mm/.gitignore     |   1 +
 tools/testing/selftests/mm/Makefile       |   1 +
 tools/testing/selftests/mm/merge.c        | 455 ++++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh |   4 +
 5 files changed, 462 insertions(+)
 create mode 100644 tools/testing/selftests/mm/merge.c

diff --git a/MAINTAINERS b/MAINTAINERS
index de97cd54ff24..358819584ec1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15550,6 +15550,7 @@ F:	mm/mseal.c
 F:	mm/vma.c
 F:	mm/vma.h
 F:	mm/vma_internal.h
+F:	tools/testing/selftests/mm/merge.c
 F:	tools/testing/vma/
 
 MEMORY TECHNOLOGY DEVICES (MTD)
diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index c5241b193db8..91db34941a14 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -58,3 +58,4 @@ hugetlb_dio
 pkey_sighandler_tests_32
 pkey_sighandler_tests_64
 guard-regions
+merge
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 8270895039d1..ad4d6043a60f 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -98,6 +98,7 @@ TEST_GEN_FILES += hugetlb_madv_vs_map
 TEST_GEN_FILES += hugetlb_dio
 TEST_GEN_FILES += droppable
 TEST_GEN_FILES += guard-regions
+TEST_GEN_FILES += merge
 
 ifneq ($(ARCH),arm64)
 TEST_GEN_FILES += soft-dirty
diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
new file mode 100644
index 000000000000..c76646cdf6e6
--- /dev/null
+++ b/tools/testing/selftests/mm/merge.c
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#define _GNU_SOURCE
+#include "../kselftest_harness.h"
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
+#include "vm_util.h"
+
+FIXTURE(merge)
+{
+	unsigned int page_size;
+	char *carveout;
+	struct procmap_fd procmap;
+};
+
+FIXTURE_SETUP(merge)
+{
+	self->page_size = psize();
+	/* Carve out PROT_NONE region to map over. */
+	self->carveout = mmap(NULL, 12 * self->page_size, PROT_NONE,
+			      MAP_ANON | MAP_PRIVATE, -1, 0);
+	ASSERT_NE(self->carveout, MAP_FAILED);
+	/* Setup PROCMAP_QUERY interface. */
+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
+}
+
+FIXTURE_TEARDOWN(merge)
+{
+	ASSERT_EQ(munmap(self->carveout, 12 * self->page_size), 0);
+	ASSERT_EQ(close_procmap(&self->procmap), 0);
+}
+
+TEST_F(merge, mprotect_unfaulted_left)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr;
+
+	/*
+	 * Map 10 pages of R/W memory within. MAP_NORESERVE so we don't hit
+	 * merge failure due to lack of VM_ACCOUNT flag by mistake.
+	 *
+	 * |-----------------------|
+	 * |       unfaulted       |
+	 * |-----------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 10 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/*
+	 * Now make the first 5 pages read-only, splitting the VMA:
+	 *
+	 *      RO          RW
+	 * |-----------|-----------|
+	 * | unfaulted | unfaulted |
+	 * |-----------|-----------|
+	 */
+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ), 0);
+	/*
+	 * Fault in the first of the last 5 pages so it gets an anon_vma and
+	 * thus the whole VMA becomes 'faulted':
+	 *
+	 *      RO          RW
+	 * |-----------|-----------|
+	 * | unfaulted |  faulted  |
+	 * |-----------|-----------|
+	 */
+	ptr[5 * page_size] = 'x';
+	/*
+	 * Now mprotect() the RW region read-only, we should merge (though for
+	 * ~15 years we did not! :):
+	 *
+	 *             RO
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ASSERT_EQ(mprotect(&ptr[5 * page_size], 5 * page_size, PROT_READ), 0);
+
+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mprotect_unfaulted_right)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr;
+
+	/*
+	 * |-----------------------|
+	 * |       unfaulted       |
+	 * |-----------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 10 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/*
+	 * Now make the last 5 pages read-only, splitting the VMA:
+	 *
+	 *      RW          RO
+	 * |-----------|-----------|
+	 * | unfaulted | unfaulted |
+	 * |-----------|-----------|
+	 */
+	ASSERT_EQ(mprotect(&ptr[5 * page_size], 5 * page_size, PROT_READ), 0);
+	/*
+	 * Fault in the first of the first 5 pages so it gets an anon_vma and
+	 * thus the whole VMA becomes 'faulted':
+	 *
+	 *      RW          RO
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 */
+	ptr[0] = 'x';
+	/*
+	 * Now mprotect() the RW region read-only, we should merge:
+	 *
+	 *             RO
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ), 0);
+
+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mprotect_unfaulted_both)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr;
+
+	/*
+	 * |-----------------------|
+	 * |       unfaulted       |
+	 * |-----------------------|
+	 */
+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/*
+	 * Now make the first and last 3 pages read-only, splitting the VMA:
+	 *
+	 *      RO          RW          RO
+	 * |-----------|-----------|-----------|
+	 * | unfaulted | unfaulted | unfaulted |
+	 * |-----------|-----------|-----------|
+	 */
+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
+	/*
+	 * Fault in the first of the middle 3 pages so it gets an anon_vma and
+	 * thus the whole VMA becomes 'faulted':
+	 *
+	 *      RO          RW          RO
+	 * |-----------|-----------|-----------|
+	 * | unfaulted |  faulted  | unfaulted |
+	 * |-----------|-----------|-----------|
+	 */
+	ptr[3 * page_size] = 'x';
+	/*
+	 * Now mprotect() the RW region read-only, we should merge:
+	 *
+	 *             RO
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
+
+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
+}
+
+TEST_F(merge, mprotect_faulted_left_unfaulted_right)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr;
+
+	/*
+	 * |-----------------------|
+	 * |       unfaulted       |
+	 * |-----------------------|
+	 */
+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/*
+	 * Now make the last 3 pages read-only, splitting the VMA:
+	 *
+	 *             RW               RO
+	 * |-----------------------|-----------|
+	 * |       unfaulted       | unfaulted |
+	 * |-----------------------|-----------|
+	 */
+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
+	/*
+	 * Fault in the first of the first 6 pages so it gets an anon_vma and
+	 * thus the whole VMA becomes 'faulted':
+	 *
+	 *             RW               RO
+	 * |-----------------------|-----------|
+	 * |       unfaulted       | unfaulted |
+	 * |-----------------------|-----------|
+	 */
+	ptr[0] = 'x';
+	/*
+	 * Now make the first 3 pages read-only, splitting the VMA:
+	 *
+	 *      RO          RW          RO
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  | unfaulted |
+	 * |-----------|-----------|-----------|
+	 */
+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
+	/*
+	 * Now mprotect() the RW region read-only, we should merge:
+	 *
+	 *             RO
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
+
+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
+}
+
+TEST_F(merge, mprotect_unfaulted_left_faulted_right)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr;
+
+	/*
+	 * |-----------------------|
+	 * |       unfaulted       |
+	 * |-----------------------|
+	 */
+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/*
+	 * Now make the first 3 pages read-only, splitting the VMA:
+	 *
+	 *      RO                RW
+	 * |-----------|-----------------------|
+	 * | unfaulted |       unfaulted       |
+	 * |-----------|-----------------------|
+	 */
+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
+	/*
+	 * Fault in the first of the last 6 pages so it gets an anon_vma and
+	 * thus the whole VMA becomes 'faulted':
+	 *
+	 *      RO                RW
+	 * |-----------|-----------------------|
+	 * | unfaulted |        faulted        |
+	 * |-----------|-----------------------|
+	 */
+	ptr[3 * page_size] = 'x';
+	/*
+	 * Now make the last 3 pages read-only, splitting the VMA:
+	 *
+	 *      RO          RW          RO
+	 * |-----------|-----------|-----------|
+	 * | unfaulted |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 */
+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
+	/*
+	 * Now mprotect() the RW region read-only, we should merge:
+	 *
+	 *             RO
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
+
+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
+}
+
+TEST_F(merge, forked_target_vma)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	pid_t pid;
+	char *ptr, *ptr2;
+	int i;
+
+	/*
+	 * |-----------|
+	 * | unfaulted |
+	 * |-----------|
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in process.
+	 *
+	 * |-----------|
+	 * |  faulted  |
+	 * |-----------|
+	 */
+	ptr[0] = 'x';
+
+	pid = fork();
+	ASSERT_NE(pid, -1);
+
+	if (pid != 0) {
+		wait(NULL);
+		return;
+	}
+
+	/* Child process below: */
+
+	/* Reopen for child. */
+	ASSERT_EQ(close_procmap(&self->procmap), 0);
+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
+
+	/* unCOWing everything does not cause the AVC to go away. */
+	for (i = 0; i < 5 * page_size; i += page_size)
+		ptr[i] = 'x';
+
+	/*
+	 * Map in adjacent VMA in child.
+	 *
+	 *     forked
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 */
+	ptr2 = mmap(&ptr[5 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* Make sure not merged. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 5 * page_size);
+}
+
+TEST_F(merge, forked_source_vma)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	pid_t pid;
+	char *ptr, *ptr2;
+	int i;
+
+	/*
+	 * |-----------|------------|
+	 * | unfaulted | <unmapped> |
+	 * |-----------|------------|
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in process.
+	 *
+	 * |-----------|------------|
+	 * |  faulted  | <unmapped> |
+	 * |-----------|------------|
+	 */
+	ptr[0] = 'x';
+
+	pid = fork();
+	ASSERT_NE(pid, -1);
+
+	if (pid != 0) {
+		wait(NULL);
+		return;
+	}
+
+	/* Child process below: */
+
+	/* Reopen for child. */
+	ASSERT_EQ(close_procmap(&self->procmap), 0);
+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
+
+	/* unCOWing everything does not cause the AVC to go away. */
+	for (i = 0; i < 5 * page_size; i += page_size)
+		ptr[i] = 'x';
+
+	/*
+	 * Map in adjacent VMA in child, ptr2 after ptr, but incompatible.
+	 *
+	 *   forked RW      RWX
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr        ptr2
+	 */
+	ptr2 = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE | PROT_EXEC,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* Make sure not merged. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 5 * page_size);
+
+	/*
+	 * Now mprotect forked region to RWX so it becomes the source for the
+	 * merge to unfaulted region:
+	 *
+	 *  forked RWX      RWX
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * This should NOT result in a merge, as ptr was forked.
+	 */
+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ | PROT_WRITE | PROT_EXEC), 0);
+	/* Again, make sure not merged. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 5 * page_size);
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 9aff33b10999..188b125bf1f6 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -79,6 +79,8 @@ separated by spaces:
 	test prctl(PR_SET_MDWE, ...)
 - page_frag
 	test handling of page fragment allocation and freeing
+- vma_merge
+	test VMA merge cases behave as expected
 
 example: ./run_vmtests.sh -t "hmm mmap ksm"
 EOF
@@ -421,6 +423,8 @@ CATEGORY="madv_guard" run_test ./guard-regions
 # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
 CATEGORY="madv_populate" run_test ./madv_populate
 
+CATEGORY="vma_merge" run_test ./merge
+
 if [ -x ./memfd_secret ]
 then
 (echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
-- 
2.49.0

