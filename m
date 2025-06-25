Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3D293C4E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841153; cv=fail; b=UrYn14NJIRp/sbkQ7lXPcVRMvTaRY83PYJaV0UI8+paWXi5mEhNZNs51YSatQziVnO90k7/yvVKMTuN5purKwlLbphDZkguHuWWxhBLNOv8wfq9BJQoSjPrHC316hOX2iaA9IER/zYS8nA3yNObC3eLVw3IsfUuks0DQ/OrWfqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841153; c=relaxed/simple;
	bh=TU0nwNm+f4Rgw8zI0q92ad+nGCU2DshvMC3SqH6IKV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tj6W2HeUBqw+mT52fGJ97sEKDOeFLG2ohFsV0HKBXTWhZ6Xk3WM3mv0eFF0dXBFoePgNJMDLsPHcU7gtGBQiU6Ui4YjTFrk+NqfQbqOiGF1yEqDkXxlkM82Ig3L5dtIvJPlkETaMX1/FdxKo4L27G7MFpyToaX+mBCckYKxuiN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k5kDLfhi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H1SIVL4o; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k5kDLfhi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H1SIVL4o"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fdYF028338;
	Wed, 25 Jun 2025 08:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UplEDnfO0+jvIHjDJM
	cMJvkEYIVZb6mkON8NdBPOC70=; b=k5kDLfhiJ8q1qwqgVRyRTcDxpAtR8Q2cdj
	1/8VvTTpGVdoTD3vIOiYtTXsoj+4+oTb6dyYWMVDocSvYQqkRTH+K1iDyd+M0Ki1
	2nMxlEQa9vv1BlK0+BMnTMlKsexdNZNxV3yVBOfctoN80zcVwiJKASkwR0PAWKpS
	L02Mdvq8Pd2jh5R9vRjmnvSbjtl2E3Ph/KLELau75IxqKQEBhDGFHSQukByXNp51
	7D+nJeOCukzunKZiZkEHE0gU5Oc1o4LlQMdk1ynqWlRIlZ301HuvFRkn0hhklXfx
	4J/IWldK/IvbT4eMDFC5YJTxQpkwa2rXcgLiziqdS37eSz14AUvw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumnw6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 08:45:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P71HPV002080;
	Wed, 25 Jun 2025 08:45:31 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012034.outbound.protection.outlook.com [40.93.200.34])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpe9mek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 08:45:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmF8MqazVfeMHV4I8By+jT7Cij9BhZ6BCVw05WYa3NqOGRwv2o1dSzYb0dIb6qcoEEWIWgSXN9qg7r6pDWnfduLaUmn23RxpqCf5VsrMdJr7S3FLCOKKGmN1InDuPgroJ9ow4KfhxoAi7w0XWYVkV+JYRJYIOnttRRqUNAUQK0vSQK8/MvuB4Uu9WXwmhkjYbToySyNesk84Gnp5sW0s+MZrhKQGAhcHpe+5RxZLyRhADnkGDAZ03UeO3mf6pZf99kiAK9s67/d7tWT7W3r4VgsuSiokGgF/fDj9yPy5iGBHIMEuLuLXouCV9owYEVaN+pv+dfo4I9td3ArKwOwZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UplEDnfO0+jvIHjDJMcMJvkEYIVZb6mkON8NdBPOC70=;
 b=d1LKsuC6rM3b0QtKG2XXzjWbNijeCPvCsP3AB0TIBAUiHKF4pICLji7lfvNWD9dVvNEtAfxakq1XS1iNWHwJO+ECCUiPK6u50Zg6nfLJSl4Nk79Wrgleb0lfYAqmvTDJekCqfLJDB8na+7qq4lVo7pSPSWE71xteIo3PNDTm6oE4vsp1uFkkT3ofh6L+QQTNNJuoZz51oOe5pRLq1kbkxVxCaglcrzzZJ53QGagz/o9S+ncdOoSDTxBRX7r89PampZRVTrhvd5F00JVeyxS6qfOWZ5yoAMiS/vVmgh/OnNYVH31WP4JCdUHa8v8PAX/A434GeSztyM9MaUAXSoPGkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UplEDnfO0+jvIHjDJMcMJvkEYIVZb6mkON8NdBPOC70=;
 b=H1SIVL4oA3qKM5d4o5swsXsNh/+1TW3UsDGwFTAvuuF3xIzz73kwGVfrC8vI+UGVb2CAwXtnD9t58lyfY2JSUp6Cgn4a/ZFDL9a+RZDNYVOQ9lophC+vnlplwAeHSwkr2bqqErecpl8EYx8ie+91lyWP1XcL+fouwM2Bpl0PcOQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 08:45:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 08:45:28 +0000
Date: Wed, 25 Jun 2025 09:45:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <b06997d3-7668-4bcb-aa28-0eb75bea3dbe@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
 <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
 <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
 <3b6db0c3-aef3-4a21-a154-6aafd639dbc7@lucifer.local>
 <6bda0de6-1ade-40c9-aa52-16bc02d98bee@redhat.com>
 <28051538-d3ea-4064-aef3-89f6dd98b119@redhat.com>
 <f36e64f2-f3d1-407e-862f-ceccc89ac9a8@lucifer.local>
 <a027fe94-e6c2-46d0-8768-6acd8e801cc3@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a027fe94-e6c2-46d0-8768-6acd8e801cc3@redhat.com>
X-ClientProxiedBy: LO4P265CA0110.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: bf994b5a-2fbc-4eb9-f822-08ddb3c4a31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MCUtsl4jASPEEbNinuka20a8FcAGAuY0HYaBuKdz2IBfF84oRAtF1AmHgoEW?=
 =?us-ascii?Q?E9t7wRxz3w95deLFZJKr6PHPL4DoXttVdd4o+dLVU6HW3i77olT+kp/6k8x1?=
 =?us-ascii?Q?8ZjGYjoaqc9SraTlHgBb6ohulRgXGkoI7NewNVS+WgFYB0EdwyVjVwq7QpzU?=
 =?us-ascii?Q?qMlay9xg6OUoPvYtfoxWP1Ox5nexXzmkbM32/FahZ1ddoS4oIazOsD/tst6T?=
 =?us-ascii?Q?J4CKA1Sz4+2oY8gNGCTl1pDEodQairSE9et/9ekiUQ66L8fRz2HpQiYhrZHp?=
 =?us-ascii?Q?P/lo9/p22AUFdr+LLqAh3HnKaAHwQkhT7jodXUIygxTdQRWqCHBbv5Lx47vI?=
 =?us-ascii?Q?qRMCGK38ghgcqpfUwHCWtT1XsM0xQiM0xxSwjnd5uC2fnA3zo/qweZl7Jp2M?=
 =?us-ascii?Q?4WvhY/Qg65FoqE/o/lkFJeBGF/t0P0x0zZSuXr3bRJyF8HAW5mqyIFlEhX0d?=
 =?us-ascii?Q?x+ZSKXzhX3FKmxKLAkTDSCEVoO7o/IOV8dg7M4LXRuGObxCYLRxaaE5aWMan?=
 =?us-ascii?Q?EG7obVTgCi9kZXenhwuEeo4C9OsgIUlvEF1c8ay0CKuS9kB6rkTWZPPflije?=
 =?us-ascii?Q?8rm0OWtf1zsGgBAiCNywcHpkAlA98kGv+Rfs2VdQpZq912GuFKQ2hDNMnqwZ?=
 =?us-ascii?Q?IWMH1WXPwPwvqQz2DxxUzqbsRBMIkvRJmTrXzWHkPTj8Kn3gCRNYB6AQiB33?=
 =?us-ascii?Q?DUwT0hhCJd3t8iND/5oyeajPXKMfwE1B1RDdoQcyvv9bt+rEFL8CCJ14pWsl?=
 =?us-ascii?Q?u4AtSWjAyKO2H+Yw3Mj/A9kfFGSPDtF4qdQ+YiHd7pEaYCdPiVW7D6LxWRlH?=
 =?us-ascii?Q?EQDsBQierl7qhoooMQO+gt3FH8iD5zndyKA5Yc1b1QIMlG+fiV9dVUH8ekdV?=
 =?us-ascii?Q?UL4CNwnoYrSD5lnKm4x+cTfKNQ8p6xwR4yxCbS8IMMjj8hNUshD9RfsfSaWT?=
 =?us-ascii?Q?3DJ1ax/wWQQvO6Xw1Ce5V4JPbohtZ5OehWPmuZS3E9nz6FeVTv/YLQokfmj+?=
 =?us-ascii?Q?gnzWFoUpyOpcq8GttggoWHCERsR9GvK4ThBU3uFoVpRJWzvrIUoONvezKcHR?=
 =?us-ascii?Q?qwSfJWZIxu/jkCsKic3Jld6f9lFMsjBveuBdyFbTLFYFuXW6Xx/RlsV/q986?=
 =?us-ascii?Q?1vpag0ZV0Dn+RqjUR+tG0V/57WgIu919PvD7HLk4crEF43lZYmo3dngmLEYN?=
 =?us-ascii?Q?V/3Dnk5zfVnd5DBM4PVo0VUptfrD2h9pHGYfisCa0iwtKwTA8sZnsh0x8i6y?=
 =?us-ascii?Q?7ZZ4EXC84q8R9J1hGNLYB0jnsrGvv/pgzmVTrdNW++yMoLmItBPRAcyRpJQ4?=
 =?us-ascii?Q?de/9A/KfXRMGeT1OKRxsxLRQ7p2pFnUR9Ug2G0WnM/IFu0+9Ul7l8xQd4wkM?=
 =?us-ascii?Q?10IAEHoyGVj9HutQ5C6U5Clz/HNnkpEFkzLY31FwfOrSIsOkFEtz8D+RaAmm?=
 =?us-ascii?Q?4hrEes/GQsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N+ATpMmiTUehl0n/pV37AfOSPMm60v/kQXNM6icNHRVriIB90XZ6LBi2cE5e?=
 =?us-ascii?Q?LR+FUfyW3DQLZ+vW+2R1h6TX5D8Sjk9/jUNmo/dvLz5W3HCU1qHsFrFKDVav?=
 =?us-ascii?Q?aZ3TFseHJ6azCCXyyU7tzCDzlM2d/SWc16V1T7xqZFd5IGTz8LzctqFk0hfs?=
 =?us-ascii?Q?ufBoPHI/qrPgWeuKDBSgJee8+SVpXqQiPLluubYpeDcnebM9okt+F60uAJbY?=
 =?us-ascii?Q?VeeI65ub51tWs2Kka98QQcVa5q/utc3SMFDvaCS3PHfgFqQBiFnTfYXxZYtt?=
 =?us-ascii?Q?28swjDZ/CWXkBPcMm9u07kXl2CaYwf5godNvNTKvFCy3e09n/kTRZD5WwPRM?=
 =?us-ascii?Q?DlXsOQoAyY/BzBT7yT6YU9V8v2mW7k7RQfNKbXIcnwQXM0bDfWqk+huHpCRX?=
 =?us-ascii?Q?NkMuaDJDxdN5GG8z2QWRhIbnrbjxholF0i+VHaWIAe6tRK8i0RLyex7pjdNt?=
 =?us-ascii?Q?/z5i4rGBbtAQhygsC0VlV/a+pHubckYKYarHvZvcS91dywPWRpAgAJkKzy6T?=
 =?us-ascii?Q?9m2fuKyfSR48HZVWQNnFrmyFfQ09E5c3yRkuWnn2ZPScUJRPCe89kwlDopnV?=
 =?us-ascii?Q?+Ot1H48Jvd7uSeoVUGY34X6c0oWmNXwofbpKv2d62LnnQg0fTkmVzUO1jZbg?=
 =?us-ascii?Q?dkW6HoB3MBzSeiC8D9LzPgKoFNUxQ93hngNhrulStDnkLUk3BUdpWAsn/uo3?=
 =?us-ascii?Q?geEK9pnT7A/KiN5qeKo4Xcionlsn9ei2BhxMyN1vuQ3aY8RG6Gz8g0M4T6tp?=
 =?us-ascii?Q?kWfAfARog/yCBv+KxpiAXz9Lv8IR0c9Hx8/hGf69GKhofi3al87MCfTMxBF5?=
 =?us-ascii?Q?bdSPmhdAoEOk+fqryI1X4LEwVhUg17nmzvg/pzBURzE4IyeyhvcZiIo3VMgu?=
 =?us-ascii?Q?1LnkNrW7aPnO39A3F86LRsVYU2v8jx77hyZ3QFojMc29FFnc8+k02fRdxOD4?=
 =?us-ascii?Q?BAwHjtzXpahtDX9oDe9LzGENdZlVTSpSogjkyhFKcK+Jx9fk4WjlmNTFlYHG?=
 =?us-ascii?Q?mFNTs4jN5oMMjqgzsPqX4ePZlb856/Lie0e6T3YXIwhOx+Bv+fsx836WFfi9?=
 =?us-ascii?Q?4NrfUhfiqft3VBR2CGpMcSbRi+BfB7fqm4uDjL09vLwLQqg1aphknRPaSW/x?=
 =?us-ascii?Q?mMh9RaJlY58sNQr1UxKQ+5kAEEfqnjfsb5f8HCNJMretAG8meBLhuPh/K2R+?=
 =?us-ascii?Q?n43q1Y1ckxTkR6b04l/vlZK4ngnn6f/Rxrs1m26VDR1lIOMGFMgXeLNjfJ6N?=
 =?us-ascii?Q?iea/CXc2vGDSfLaL9XwL4cY4zDIf2MjtjXmtdkwqQtvo9W5HY7QGtgWMtI46?=
 =?us-ascii?Q?sGa16lsJKZS0jV51dKp3q1sWgSF94d7wVK+qr1onHu1wMQTPobf8d1ctsinV?=
 =?us-ascii?Q?8JKjkKpv+u1yFvq30j4IJsZVnzptrwKit0mvf+0+qcGdNHK2z/aMnzEc3LPd?=
 =?us-ascii?Q?Aab15Mdh9U1UR+vuRp0d9RGkgkRLaSHWjy0FdDXTh2ZAxVY1Z2SY5m5F5t+U?=
 =?us-ascii?Q?UWvS5YvCWwiCwGQWpSVsszBCYTa867y8Cm7uh2A2PIpV+XrXSPU4PMfjwYW4?=
 =?us-ascii?Q?Ged2HcclDR0MYGdpT5QJc8TD0GER3L0bJS8cnwhcDkzctO7PHgH1LSPy063g?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	05MP1z6+eJpXahDJZUFvBw29Hd3JL/Ux4AMcRJKR3tl59s9Rb7P0bH4zf9Er9W7ViDrY9tFnIUuDrB3DvBXYQusk15nR3g+ZIiy0mpp10fEpmXPpOnnRXBkx0NrsHvZlm3bR3Iyo5G9R6GczHuxOV5wc45Qe3ZyrY0jUIn0C7x6okOhhJxf4nB34Yk1rGw4KAkj2ZX6KITAxKRX0G9RJN5DCzM5Sf+/ie4l1HQC8SHcBxq616Csp/5YkFuBlrDPoox/uoNMMhYwtSjgwAUA3nPxoqMduCfFWrE7y0tCXKvzt0v3B2WdIPd4LTcZgyWfNQvvQ9jeWP2MPL8D/5RohNCnXlxqlXnbA4DRhQ9qG3hndQpd9O9ylHZQzRNCGqIWrUKwtlq+HXy4jmg+OP8rtTrnLAO13lIPRXml8T4OiG6MF2kfLZR4SEiNl3nTyOHvlwzVSaGPrY+KS9H5363nnYjVFDPxKoOn2DLVhleHiYTJjd4yvFOg+D0lfc95UIthgS7CHfHMpPFETIKc1CxAuJeZo8aJ0ltwH8u2+K0UeQd5JU0rQJhBlRsmxtV4ivf1VJOqzmP5K/gtPpKHnRzUrihicf3zL6HcHx1cmI/7Q2Kw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf994b5a-2fbc-4eb9-f822-08ddb3c4a31b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 08:45:28.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2gbIioYi7PUl6b//KzBygQAWFdTRfPnqSrDQimMwA4wDQHZ1n5zggnkhXwFSauG1WFqGbnSwBFQFuHTPYY58WomR56rAyc6DC6iPBDNwsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=830 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250064
X-Proofpoint-ORIG-GUID: BZLvwMWUYVPqhap_-wZ4n6CYMkU_QF6f
X-Proofpoint-GUID: BZLvwMWUYVPqhap_-wZ4n6CYMkU_QF6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2NCBTYWx0ZWRfXw7UKBxgLVg/P M7gkt1oHKy061Qz+zntzMmJTMzry8Yes/L7vxHE6/ot43RIx0UWe82Nu36upxrPKycyKDXOJrEB WCbRmoFIX9b5yPmkF9ISmPzYXOj5OcRrz+eNempzmnrPYwCdU88ZKkTHyCnJ/KknJQH8EN/N1Lr
 CSmKi+CM2LtXut58MfIqVHn5T7/4pd+AD8X7YjhxiOFHdCQIHl/4zy0Mplh0CmDc2pMb7g0/suN A7NP+pvSZ1I7jBe2NDjFawu8GzyrKjLzW4DKzFWy0/apRKn3MSzJxaWoM636x9SIVvE22uGBEcL Gm/8A7rHGLAQabjcGtcfTnY0fT7Qjn1Sd1hn7NaF/R73QwdenayNbmh0WT3hDI3/wbXmKGteC+x
 /dNFvZgXdjOoldNCiwx7mEA0H5pVALtry28veoh2LnN/qLcekrPskZEDP7MrwjesUiriFtZc
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685bb72c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=Kv29Mg3f0E3HgrBFTq0A:9 a=CjuIK1q_8ugA:10

On Wed, Jun 25, 2025 at 10:40:23AM +0200, David Hildenbrand wrote:
>
> I just looked at the original use cases [1], such a use case is not
> mentioned.
>
> But it did add process_madvise(MADV_COLLAPSE) in
> 876b4a1896646cc85ec6b1fc1c9270928b7e0831 where we document
>
> "
>     This is useful for the development of userspace agents that seek to
>     optimize THP utilization system-wide by using userspace signals to
>     prioritize what memory is most deserving of being THP-backed.
> "
>
> The "prioritize" might indicate that this is used in combination with
> "madvise", not with "never"/
>
>
> So yeah, it all boils down to
>
> (1) If there is no such use case, "never can mean never". Because there
>     is nothing to break, really.

Yeah and as I said in my first response to Hugh, I think the (unintentional)
vagueness of the docs means we are not breaking documented behaviour anyway.

>
> (2) If there is such a use case, we might be breaking it.
>
> [1]
> https://lore.kernel.org/linux-mm/20220706235936.2197195-1-zokeefe@google.com/

Agreed.

This speaks to the 'I want THP now' being the intent of MADV_COLLAPSE. Not a
never/manual (but immediate) control over THP assignment.

Which aligns with the docs:

"Perform a best-effort synchronous collapse of the native pages mapped by the
 memory range into Transparent Huge Pages (THPs)."
