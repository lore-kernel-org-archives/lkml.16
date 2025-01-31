Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782111BBBFE
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738326746; cv=fail; b=QqMcBYazDjwpgMdgVsUnZm0Jw0AMJKi/L5wpiPsqN7qOzJvrOzaqXY1QYzxIjAYkmEyejnH67mpofvpoFD9QhnFUwE8Fs2wAXNrROyCt+qCD/PcPPv4Hax/p/VQmXB0w8evUd2TwJEoQmOG6B42doEbFFgXYvp8JGseCMmNH8yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738326746; c=relaxed/simple;
	bh=AN4FoqyKo8kxPJh73Eol2pbuY1u0B3Am/J/oN0B2Ah4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WWnz/hjujvGsHoIH2W67Sw8XYpD0Fm0GCUiAqamnfOM64VZmGT31e9vKuObRqCfglC9DqENfkTZcQPyr37s/tYqIslbuW9g2ULffFchraMW4VUCNPWkoLrxYGD5gMj4PvBFRYwXyR8VU6U7dyyXRu/Zxq/V9VGx1tWfC8Hn+ABo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jk/NDmEm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xqpBypQW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jk/NDmEm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xqpBypQW"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCLtMc018007;
	Fri, 31 Jan 2025 12:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=/pm97kA0QTHF1nI3s5oQ5v8v869bmuA/oC9oHoS2dr8=; b=
	Jk/NDmEmp6fDWu+nHpjSNHr2iEFJiKFJqFq9xjKnh/R5GiBy9xadh2ucRMYPb/jn
	6/x8qyv3k54Lif5f5Ti7Ha3l/SeU7eQ0KzU7gV6R699pGOlCUXaq1sr/3ngvjL4l
	QXN5xrD139uETdGzW7Hw31ofvVJufH+ot82+gvhdi/yrLBwK1kaVKHXihu9IRL2w
	iDxqtsCaZrkwWsObllYxywSVnPxhj3XTrjnt7iaonJDNKlSWcz0tlo5BDQmHtOUs
	oGVvHyFBUfgYvT+W8YxENzmk6rEY/rYvoPsqTFPbFMQb2Jkv0aPo08umNomiPQnb
	1BYu2tBMA0w60JGD7YXStg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gxf2r0hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VAUN0i009100;
	Fri, 31 Jan 2025 12:32:14 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gg1gauup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvXk6IMYRZOskaNRK0CyP3+sUJDhJz6FnQYYb+3wcWSkSIm5wQV4eLZm4ZkUyqJiKpSOrT3hFSdwb93UAp+6MJvaxF/UWkla4KO2iZXxQ464YMxNQoBs04F+IwUQ/AzRlOEYyfyKsn56CyhxVk2jA3yF4bPhVVj2KLTZAiYs/bRb0NFBboajR/Q9Tj2LLym/osesTCPiChaXvnNWshka5hhZoZeRLT+1LlD63dxPOY9c5KSk4IyOmrEawoG+MTjzH8Y6l/t0KAL9OoJARv38/UnW4TQRD0PBoZcIuo+FpNCH/SqrSukH10ULPtA72Kt1l10R14zuJmrFUhfZTfb9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pm97kA0QTHF1nI3s5oQ5v8v869bmuA/oC9oHoS2dr8=;
 b=IxA86FKGi7SE1u5TTv9xXf/oPTvMgckdFTzfElw7L9paDlmbluJqkHgZN6dVHOZKc3pF2wXon96s2vFTZsF236iym+kMIK5hTPxKGc6RH5gE5Ol2Jj/zEBHXYrrcmsFTQ0eUKDQlUOqX0FNAMIf7BJcLq4M8zHLY9IaTKmSDNEmvV1nUIODXFkfQlPxyNAliz8/wwEZ+63/YsXjIUtE0VUcAGmigV3PgsKivssb6ArvtLxnGEEidffUQcNZf6xFKRLDVdzgzmo7uBvYTh7cruHXYkmbH/iwuCF2zgkPvzmKmgjp/NTOZZBBtaXeRQD6clQjJlZO59rzJNW6OIRiaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pm97kA0QTHF1nI3s5oQ5v8v869bmuA/oC9oHoS2dr8=;
 b=xqpBypQWZvad+PNJQozuAkQJaHigb3xKYhXlWOerfmo9GCWx+I7rEz8VmarDrqUcZbNa6ZreDqH7NtgKmlArmQoouyCWwHKW4VALiHy7W5+GwNzPNQN25yAVzd4s4kix8khsCa4BDwVrCdCoZ9ewj1tMibW486PJaW0bVXmJNmI=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH3PR10MB7741.namprd10.prod.outlook.com (2603:10b6:610:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 12:32:13 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 12:32:13 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] mm: make vmg->target consistent and further simplify commit_merge()
Date: Fri, 31 Jan 2025 12:31:52 +0000
Message-ID: <50f96e31ab1980eaaf1006e34a4f6e6dad9320b8.1738326519.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
References: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0487.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::6) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH3PR10MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: b597ff04-1452-45e3-5bce-08dd41f349d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MlSgoOepTR9HDduHq5ADx59rx+NgyigLECx88RwNa9Hk8aalBaWCHg3xg7r1?=
 =?us-ascii?Q?nL49hs/74rEc3rR0LsDcIPs5PPrq0I6KsYwwICyOGZcUr3bTp8XfxAwZ17eh?=
 =?us-ascii?Q?kCIGko+pwn0WvSEpoSwQVIqZ39YcmSSg/7ccrIy2m4I9JqxDLL7BTP8NM+QC?=
 =?us-ascii?Q?2Vusw3C+7Rzk7gPdfh1h7rkxw25zTcPYW14/TrwRERwglyxm4P/kJfen+x7g?=
 =?us-ascii?Q?cEqK5jvFINyzMgRNLKr/wmTejtSRtyCFTtOmM+D2mxuEnJR6iR7yWmMteEHX?=
 =?us-ascii?Q?DkmymcCWL0AZDinAoFGlACUMjvynGjgSJy9xewd9KNPByNiCaZfW04rK/8AG?=
 =?us-ascii?Q?yr1cvgPhbRIBDIL6AwsWWQuE5F7sV5snf0hIouhAe6s6v9K9pji7CbK6VFYi?=
 =?us-ascii?Q?6Q3B96hekURnVFqGD80TZxE5kmgRURD2UrTFV77r9Feul3jy1TvNapQ/yXeH?=
 =?us-ascii?Q?eLAIiySyNfFtXtAp4BwWxsa2Ks/DI7DxaqD2QzF8cn3Ub+cu2+LRRtx2N5oc?=
 =?us-ascii?Q?tmeANoPh/cdoAn86sQCoQvZaC7nzbHPr6+10q9u6ncUOXHlZE1wngidzg+38?=
 =?us-ascii?Q?xk6wvdO00xIsdU1FXp+/0bheY7/ac5uIWu80O99KdArW7Ab7IfWk6PQRWTuO?=
 =?us-ascii?Q?SpjzFaDuSuEt7S97aRWvISIvL0VaNU5YshTliwVnfnokt3Hfgdo35FCULLU/?=
 =?us-ascii?Q?HyTTEyh5m/hdmxxp8Pio3ThrZq+AopXJkw95GQVvIEK3eV+7cFNt7bpIdf4Z?=
 =?us-ascii?Q?f8pbl28aJGm5+VKI7BAVz5DiCh2Hq/Btk4hi14twJl24qz2gecBIGhjKdIf6?=
 =?us-ascii?Q?5q64FzhMzIIz+PdmKDPs+XcBSaaae3RSKm6ahAdja4ZwXhEk5s0Z/ApgxfpI?=
 =?us-ascii?Q?t4H5ios10RIWrAednHs0XxR3EnSeEF4iKdv/O1jfxzH+Ff52xUdO+esYEPcT?=
 =?us-ascii?Q?pyHrdZMfE8tSWNZCeF2ZOd1lp1BeCswrHIjKpopU2i8O8e0ChL0fXpgsJgMt?=
 =?us-ascii?Q?ZWEbZFNRBrQAjn8Cbtel4fg4Y6+RHmXaWYz7IVRlaxxkNc4MHdCNDKEazL3I?=
 =?us-ascii?Q?Ar3Hoqbs+BRoVvoIWddSP0uERuKykSZVmORg7aiSzNz8erLNYZjHWoVnK3Ww?=
 =?us-ascii?Q?cIQNt6Cc7Sb/OQ0AId2051rGUVBhh+rmLh9ARpjXFm6QqdrBTCs8oEZHZcI9?=
 =?us-ascii?Q?nfL9Qp+a9jgWGZP+//UG/veys0wZEoED4xjdvoJs+jAsteVhtdyb2TgD9K65?=
 =?us-ascii?Q?5v9I3ltdeQK5oUatIQyQjw+9rSJFtEnA+6WO/WkrkoftCwA3QB+wufMdpuQ4?=
 =?us-ascii?Q?BxhEp1j86Fl7tS1qQXCqHhRhjM6ReIZUhetEuF4KY8ry3aNLCvrvsIK0Qa0s?=
 =?us-ascii?Q?LpRxbO/6Ah40k3DTPHs0AuKGtJQ5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dY6s/1jhWZpdQWtxDn8QejP1d8MD545JOdmLXCGYZioH2LZ5lUJJmV2t9HNW?=
 =?us-ascii?Q?Livwf/7Jr0ranNEKzVONQK6j5zblrtQ3qWyY62hBBoBEMlPALMB/Cv/KHrGH?=
 =?us-ascii?Q?TGU0VkO37fh71Hjg+Nnn0dQgpiDUNrpZ6+u/fX4nHpIktLetCGK9mbk/Ju7e?=
 =?us-ascii?Q?hrDk+01I0NFJcwAxKhT6aIqbihlBMdWuASwjeoqT4bylRezz4bxC57Jso4LN?=
 =?us-ascii?Q?I5s+RRnqtCpvZzgrNfbJLD8nGF79IMAu+t8/EJMmvFMXrmmFR1tQpiu7onsx?=
 =?us-ascii?Q?7ibVf3dLTHwpEex9TC2araMjHHXyLX4vODDEDkQyFejE/w9Dq3+ptXSqIFO+?=
 =?us-ascii?Q?/MDgA+pQ7Sckk0ntPixzZeC0UmlfMnE5Mdehu8yJqSBkC4+ToBY8biIUMOQz?=
 =?us-ascii?Q?fe5CllzLVudJabl2hikoYSvVcCVb3ad5gsMpZgws9teJE5LdWmWIoXBC4r0j?=
 =?us-ascii?Q?IC3VOAqmDToYiwOCxlw771lV/z+3yZDeqmDN4hvdgYfzezkbefkdRTG/SCUO?=
 =?us-ascii?Q?ZVOUvFhXgWBCJbMh8wc0gMsT2fXF/yODs1ogIEcrztha6Rcnp2SUXxQSlt7D?=
 =?us-ascii?Q?Rx0jRW4dLVk/nrQBa3sqN96XP1ezUhQWBi1Se7go/vnK2oJp3oEdU1MQtGW3?=
 =?us-ascii?Q?leh/bn5RP/GG/8dTc4g8uwZ0DI9q+YxFxliuhGtBNktLblGzy/n7zE+fjAqs?=
 =?us-ascii?Q?HFdrXHPE08b5bM4HwvvHU4dmoEVPo11z4oHBlDTpfOfLwmz8QRXDK0OiQFfU?=
 =?us-ascii?Q?X8MpiGnU1PvwXIi4QqwoI6d2AJvmrv0S22Cex2V4R0yyBm6jtB9EJtIpzE9K?=
 =?us-ascii?Q?cZsRZpSb9a13IVp8lXIgdktN3G1lorSINcPet3ICFEMMW7EsHOSZ5PaCkULz?=
 =?us-ascii?Q?SAVJRsXeOa+1LvxfLh8BZZG+eGG1V9CDIKO6c5NSorUwj9Av5Q4dUhgOycYS?=
 =?us-ascii?Q?j4VDX2uHK5TGt8U5d2K/dUHJRdDYizXp0VcEnDwMXKJOe6qeyGfnJx/GRoBm?=
 =?us-ascii?Q?mtazE4gaw16BfB2Xj4qseZvGGaQCOafPTAR9X04YPEoyNJLPKJsUlxkKyZDt?=
 =?us-ascii?Q?8kQYrz3JK5FA4oEJ6U9qD1yra3t/Gl8dnR5iHPyNmKDaPpeP7d08JW9hl2GH?=
 =?us-ascii?Q?Y+MYf9yCmsmW9J46K7OIPl6qfu28eJ6cwmFYljFWpUPrwUcCUAIkXbr9Ywdg?=
 =?us-ascii?Q?IbMQY2TQZCzOgZthWT23Ql9jM+FLhP6l+DQ0sHDix2YE8GInAjE4ObioPe/j?=
 =?us-ascii?Q?XCL3qZmzkExvfxiq/c4wTk8ycukmCuRu7xFLTv5QTu3U3PyZ4ezT/fEsaYGV?=
 =?us-ascii?Q?sXq5KHdB+1tYNdk6Nkwqr9rWr4dZZMF9HZjj89X0fOuodi9+idXe8r5+rUdX?=
 =?us-ascii?Q?dLAkWpzGbYXB9ZNvrqZyqFo5DsPh2Z5j/qGWLQvSMhoVQPSo9Nr3D7o7jmc1?=
 =?us-ascii?Q?7+oE62QqmfnUdSwrbAQB2KZm1opV/qVjdhmkKE+VDwWStMyL746FLX6wEhHx?=
 =?us-ascii?Q?vVSH0Vqxs4cyqt5kKVm0R5NWgwq2pZH1cwPPvM7OpW5NmMNAqExxZa8OWD84?=
 =?us-ascii?Q?57vcBuEnDV+tjkyUC5I24cP4icvgWuvPhjLgqlD9vy1bu/f5Wi70uA84T6Uh?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q0GVbOZT++8RpaKHlrMbhyC284EJcJwQbz2pU/IbZtb1ZLMRcotm/qnnM4YoTSEUBf9aNUNvKAYsANJeiEld+3hN3mJSKfv+xbTQIDB0IK7sWcurbZ9NlMEtCPrOjWfda3qEiuwpEbgLlQz5n3Au6eRFldvxGzliSPdUFSgERvweTsOpqRfZP7zrZCG0NiJb8Sa/DXQTIYjP/baRKHx8p32Tjc5UIBLPzCQJQYLLgjJfILuSw+SbMqLTS1D/rftxUhUwpt8QgC2VwZUX1SBFpJsI6y83UA9nHfQq8BELdIFfYUbsszTwBuQFK5tpHdwhvdxhScPJWqJSuG5viHyswAyISqwhZMJYS0g2CORk+OpwfBVw87OkUlGZ1b2RT9sB3O8L3v04Ubf+42lcSlw34xc3FF0L7Rp5vDb/NWEKmusJG7ql5unVcY+KIQppwbplw6DBMlFf+hkbLkHSDfRKvTqh8FCR6KD62weGj3PTV098reERfG2UaaREyox5wu/ZDUdXZWOl2nz340digOMrq5gAmC17Hixh7DCiRCY2CbMu/F3T3gk9rx7iMRmQxhr3gxUS4P4ZnsyZkztaxqkEMrBBHwAwqU4ArTBGhwuE3HQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b597ff04-1452-45e3-5bce-08dd41f349d5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:32:13.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdvOcc3fEeE7a0SzI+pr5/AZ5kl25GH4Mj8la9WB9s+dSuTotuMu2gFr1gvZKxgoNHqyZK2ULCHc2sWG1cgJX19cBp2hAFI14GE7BJyyhX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310095
X-Proofpoint-GUID: 0N_ymrSwrlji62OdRkqp6Q1RSkuV1TyS
X-Proofpoint-ORIG-GUID: 0N_ymrSwrlji62OdRkqp6Q1RSkuV1TyS

It is confusing for vmg->target to sometimes be the target merged VMA and
in one case not.

Fix this by having commit_merge() use its awareness of the
vmg->_adjust_next_start case to know that it is manipulating a separate
vma, abstracted in the 'vma' local variable.

Place removal and adjust VMA determination logic into
init_multi_vma_prep(), as the flags give us enough information to do so,
and since this is the function that sets up the vma_prepare struct it makes
sense to do so here.

Doing this significantly simplifies commit_merge(), allowing us to
eliminate the 'merge_target' handling, initialise the VMA iterator in a
more sensible place and simply return vmg->target consistently.

This also allows us to simplify setting vmg->target in
vma_merge_existing_range() since we are then left only with two cases -
merge left (or both) where the target is vmg->prev or merge right in which
the target is vmg->next.

This makes it easy for somebody reading the code to know what VMA will
actually be the one returned and merged into and removes a great deal of
the confusing 'adjust' nonsense.

This patch has no change in functional behaviour.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/vma.c | 119 ++++++++++++++++++++++++++++---------------------------
 mm/vma.h |   6 +--
 2 files changed, 62 insertions(+), 63 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 3fe264200b79..75bbe82b2e65 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -106,24 +106,40 @@ static inline bool are_anon_vmas_compatible(struct vm_area_struct *vma1,
  * init_multi_vma_prep() - Initializer for struct vma_prepare
  * @vp: The vma_prepare struct
  * @vma: The vma that will be altered once locked
- * @next: The next vma if it is to be adjusted
- * @remove: The first vma to be removed
- * @remove2: The second vma to be removed
+ * @vmg: The merge state that will be used to determine adjustment and VMA
+ *       removal.
  */
 static void init_multi_vma_prep(struct vma_prepare *vp,
 				struct vm_area_struct *vma,
-				struct vm_area_struct *next,
-				struct vm_area_struct *remove,
-				struct vm_area_struct *remove2)
+				struct vma_merge_struct *vmg)
 {
+	struct vm_area_struct *adjust;
+	struct vm_area_struct **remove = &vp->remove;
+
 	memset(vp, 0, sizeof(struct vma_prepare));
 	vp->vma = vma;
 	vp->anon_vma = vma->anon_vma;
-	vp->remove = remove ? remove : remove2;
-	vp->remove2 = remove ? remove2 : NULL;
-	vp->adj_next = next;
-	if (!vp->anon_vma && next)
-		vp->anon_vma = next->anon_vma;
+
+	if (vmg && vmg->__remove_middle) {
+		*remove = vmg->middle;
+		remove = &vp->remove2;
+	}
+	if (vmg && vmg->__remove_next)
+		*remove = vmg->next;
+
+	if (vmg && vmg->__adjust_middle_start)
+		adjust = vmg->middle;
+	else if (vmg && vmg->__adjust_next_start)
+		adjust = vmg->next;
+	else
+		adjust = NULL;
+
+	vp->adj_next = adjust;
+	if (!vp->anon_vma && adjust)
+		vp->anon_vma = adjust->anon_vma;
+
+	VM_WARN_ON(vp->anon_vma && adjust && adjust->anon_vma &&
+		   vp->anon_vma != adjust->anon_vma);
 
 	vp->file = vma->vm_file;
 	if (vp->file)
@@ -360,7 +376,7 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
  */
 static void init_vma_prep(struct vma_prepare *vp, struct vm_area_struct *vma)
 {
-	init_multi_vma_prep(vp, vma, NULL, NULL, NULL);
+	init_multi_vma_prep(vp, vma, NULL);
 }
 
 /*
@@ -634,76 +650,63 @@ void validate_mm(struct mm_struct *mm)
  */
 static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg)
 {
-	struct vm_area_struct *remove = NULL;
-	struct vm_area_struct *remove2 = NULL;
+	struct vm_area_struct *vma;
 	struct vma_prepare vp;
-	struct vm_area_struct *adjust = NULL;
+	struct vm_area_struct *adjust;
 	long adj_start;
-	bool merge_target;
 
 	/*
 	 * If modifying an existing VMA and we don't remove vmg->middle, then we
 	 * shrink the adjacent VMA.
 	 */
 	if (vmg->__adjust_middle_start) {
+		vma = vmg->target;
 		adjust = vmg->middle;
 		/* The POSITIVE value by which we offset vmg->middle->vm_start. */
 		adj_start = vmg->end - vmg->middle->vm_start;
-		merge_target = true;
+
+		 /* Note: vma iterator must be pointing to 'start'. */
+		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
 	} else if (vmg->__adjust_next_start) {
+		/*
+		 * In this case alone, the VMA we manipulate is vmg->middle, but
+		 * we ultimately return vmg->next.
+		 */
+		vma = vmg->middle;
 		adjust = vmg->next;
 		/* The NEGATIVE value by which we offset vmg->next->vm_start. */
 		adj_start = -(vmg->middle->vm_end - vmg->end);
-		/*
-		 * In all cases but this - merge right, shrink next - we write
-		 * vmg->target to the maple tree and return this as the merged VMA.
-		 */
-		merge_target = false;
+
+		vma_iter_config(vmg->vmi, vmg->next->vm_start + adj_start,
+				vmg->next->vm_end);
 	} else {
+		vma = vmg->target;
 		adjust = NULL;
 		adj_start = 0;
-		merge_target = true;
-	}
-
-	if (vmg->__remove_middle)
-		remove = vmg->middle;
-	if (vmg->__remove_next)
-		remove2 = vmg->next;
-
-	init_multi_vma_prep(&vp, vmg->target, adjust, remove, remove2);
 
-	VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
-		   vp.anon_vma != adjust->anon_vma);
-
-	if (merge_target) {
-		/* Note: vma iterator must be pointing to 'start'. */
+		 /* Note: vma iterator must be pointing to 'start'. */
 		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
-	} else {
-		vma_iter_config(vmg->vmi, adjust->vm_start + adj_start,
-				adjust->vm_end);
 	}
 
-	if (vma_iter_prealloc(vmg->vmi, vmg->target))
+	init_multi_vma_prep(&vp, vma, vmg);
+
+	if (vma_iter_prealloc(vmg->vmi, vma))
 		return NULL;
 
 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vmg->target, vmg->start, vmg->end, adj_start);
-	vma_set_range(vmg->target, vmg->start, vmg->end, vmg->pgoff);
-
-	if (merge_target)
-		vma_iter_store(vmg->vmi, vmg->target);
+	vma_adjust_trans_huge(vma, vmg->start, vmg->end, adj_start);
+	vma_set_range(vma, vmg->start, vmg->end, vmg->pgoff);
 
 	if (adj_start) {
 		adjust->vm_start += adj_start;
 		adjust->vm_pgoff += PHYS_PFN(adj_start);
-
-		if (!merge_target)
-			vma_iter_store(vmg->vmi, adjust);
 	}
 
-	vma_complete(&vp, vmg->vmi, vmg->target->vm_mm);
+	vma_iter_store(vmg->vmi, vmg->target);
+
+	vma_complete(&vp, vmg->vmi, vma->vm_mm);
 
-	return merge_target ? vmg->target : vmg->next;
+	return vmg->target;
 }
 
 /* We can only remove VMAs when merging if they do not have a close hook. */
@@ -833,11 +836,15 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	/* No matter what happens, we will be adjusting middle. */
 	vma_start_write(middle);
 
-	if (merge_left)
-		vma_start_write(prev);
-
-	if (merge_right)
+	if (merge_right) {
 		vma_start_write(next);
+		vmg->target = next;
+	}
+
+	if (merge_left) {
+		vma_start_write(prev);
+		vmg->target = prev;
+	}
 
 	if (merge_both) {
 		/*
@@ -847,7 +854,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		 *  extend  delete  delete
 		 */
 
-		vmg->target = prev;
 		vmg->start = prev->vm_start;
 		vmg->end = next->vm_end;
 		vmg->pgoff = prev->vm_pgoff;
@@ -868,7 +874,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		 *  extend shrink/delete
 		 */
 
-		vmg->target = prev;
 		vmg->start = prev->vm_start;
 		vmg->pgoff = prev->vm_pgoff;
 
@@ -892,7 +897,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		VM_WARN_ON_VMG(vmg->start > middle->vm_start && prev && middle != prev, vmg);
 
 		if (vmg->__remove_middle) {
-			vmg->target = next;
 			vmg->end = next->vm_end;
 			vmg->pgoff = next->vm_pgoff - pglen;
 		} else {
@@ -903,7 +907,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 			 * merged VMA is NOT vmg->target, but rather vmg->next.
 			 */
 			vmg->__adjust_next_start = true;
-			vmg->target = middle;
 			vmg->start = middle->vm_start;
 			vmg->end = start;
 			vmg->pgoff = middle->vm_pgoff;
diff --git a/mm/vma.h b/mm/vma.h
index e18487797fa4..e55e68abfbe3 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -82,11 +82,7 @@ struct vma_merge_struct {
 	struct vm_area_struct *prev;
 	struct vm_area_struct *middle;
 	struct vm_area_struct *next;
-	/*
-	 * This is the VMA we ultimately target to become the merged VMA, except
-	 * for the one exception of merge right, shrink next (for details of
-	 * this scenario see vma_merge_existing_range()).
-	 */
+	/* This is the VMA we ultimately target to become the merged VMA. */
 	struct vm_area_struct *target;
 	/*
 	 * Initially, the start, end, pgoff fields are provided by the caller
-- 
2.48.1

