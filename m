Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6FE1C6FE5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051402; cv=fail; b=moYzq+FCi/hypmuUWYPmR0JuyuWjgG+qzZlBmX+ov1LXASn9gMpb5vwLM8LF3FS2rT10/wzw9xhQue41ybIl76u5EYvIDNP4ZlL3otZnTqOos/sAqwt4RYWnDV3w/roLLbtSMNdabx+l1CYCEWIR8rD3/v/WfZquK6i26i6BhHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051402; c=relaxed/simple;
	bh=jkPhdBidoLjpyjSEsL2YL8OYthM+KQsjyqbSoWSkvNE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HmX+2aorlpUlJEt9B3bMqgDnuq2Ky+H+c27emnAVEjODQHMTzS6m5jXR316KLHeYJ0fAm5p3rmKRT2sf1i29mT8UR5nkw1IfKWZB81YJYD+wxg97TDQOE3lELa62ttqBNVIMlZc/33LPASoDOQ43Apmn+DlSoB1V7k+Cf3Jw3Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KljX3pIW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kDc1QJZn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KljX3pIW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kDc1QJZn"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNhmPY012576;
	Mon, 16 Jun 2025 05:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=5ZydepvPqiZpnsrN
	Mf7RyTMYaM8ThQ9EAzP+IpNQJ2Y=; b=KljX3pIWD8LmF+IthcQcPBcUWGFYYq7P
	QrwkH9VcfJj2z9RQagzCGXVG6VoxHEIR9q3lr2Zg3AsP3SIQ3+EHqYDjXvP323Wm
	skh8OnhvwfK+YVNQeMJ8lrUlfwNxRCpzpsbqnzB6Ge0KHXUZukekmODtGF8ysS5i
	IHZEWEeilrFWg5KvstDs15AByxS6q+PFexpb/dgtfmdIaeEG376PpjpKNd6gNxlm
	n/3gCNIQ95i/wTf/TfHmMKjuYvmy1674jhuYC9C3+xMr7SdXdxIWjZIAerzSK5Ur
	7cfEVGtGDcRZjEBKDRk9DdHePyw8ftR8NCLB5SYOwbqRSvbbfs5iDg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4791mxhp5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G3PkvH036362;
	Mon, 16 Jun 2025 05:22:29 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhdxw7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fx4obSax5sCFHdpKWP5DztfMo8dEzABZ5jC153DAjQnfSalCiBBI2Yy+E6OVyHxPAMrLjz92Bna/KCjb5pcHaQUxKZQForOTmFmMeuqgA6zBuZtPvYu5XkZUUnUBF5vVcBbHwXcDBSMqn02i0RpBGT74nDnqwT5v8iaQac6XrlcDqF7Carn+9ZPzWcSU7XWqREbBpz8BxyDgFhTe51IrXZS7lHId+ee2lbLllCi4ki/BOsVBR9mcb2jc4ZSWV6uktSFFYnH83Z5Si4ofhQToXcUxSJKPo3BIEqAjIvFfxGLoR3DL2ZraeiE34XXljQxzeL2ZABC7w3H5cPBydo8uJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZydepvPqiZpnsrNMf7RyTMYaM8ThQ9EAzP+IpNQJ2Y=;
 b=gikkHVHhHha2oTGnW2Bly3fARtDzPsJbN+fmcBX4G3IfUDgsDa1AUjTWsSjWWk3V6nvRx56tsE1/uRLyest8DWaLJwXbhPu7oZ+BxvmURa3SNUqQD8KvdmSmT5UpF7aO+C2ZJ5jdhek5vwCBcuEevIZdUR6jKK8iTOkh1fvzlHgrM+W3/65EtVu99FZHttURjyVNA9YlIqO3vLW4MaXwJQUm6Y2yUO4iYi/nMuAA6seJ3kSBsg6GBrq6xvMYOK2ByYaJ2iWlobutopbJBdL5I73M93cBV83th2Wb44/++Zaqmej+v1ROAR+5gg82agmdDvNJwJWI8+n/xMX+QMznjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZydepvPqiZpnsrNMf7RyTMYaM8ThQ9EAzP+IpNQJ2Y=;
 b=kDc1QJZnUjtYWAtkqV+8+6TOcQrlRHV7+xncPZQfDOWSBe2URPX8Ues/PwWQM5RWG6XOwRXara7qcOs3Bn5XB/UJmLHEwVLeXwlCvBmoTz/C/yTiqk8M0Ef6WPle0fDqULg7nPTLl7y2rin7hdMViTF+65cZ0li5mA1OY39LEn0=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:27 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:25 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 00/13] x86/mm: Add multi-page clearing
Date: Sun, 15 Jun 2025 22:22:10 -0700
Message-Id: <20250616052223.723982-1-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::16) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 95fb89c6-537c-471c-3c64-08ddac95c796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p+gJq27+jbV8bpn8aSSPYyc3sO4go4vX5CmbJodOUQ4eZVjbJlt43rdbNEhk?=
 =?us-ascii?Q?Qr6mlQv1QNkQCJEI0s+Cvr5A3d4dk3X7Umcc84C7im1D6LDbkMaFgDUME0dD?=
 =?us-ascii?Q?112cWwCxEoDEOOwGBy563GL5LUat/71NXB3BK2YKA5Lt516KE7G7xTdFpyqg?=
 =?us-ascii?Q?fsrtmEHM/fGWY2VsUn/qh39rBggP+7KuFYXZa62ZP0RXTcRbptabbTUnDogN?=
 =?us-ascii?Q?3kcRoOTRsjGnr/1SJZVC6S0WCwHvB4dTH3GfmFXTQvjuqfHOWtb3n5n8UJXb?=
 =?us-ascii?Q?rQgjRJVxeXymawclJTyo3doJCmyv1O7roWMUzZc5yhWwV3nRSGzoiGmoy9Mz?=
 =?us-ascii?Q?GPy1bufjjnO4OGUrV2OArad8Zh/bhzY/m3u49fptxmcmCUsfU50Nbx7pcvMD?=
 =?us-ascii?Q?OTPa+o3rZC+GhBlULzvEW7hFcjTUiU6TEDCzLis1i590d1zapVZ9W7kqhhof?=
 =?us-ascii?Q?iud9LIbZQ7KnnydFc7fzjZsYFv85BWWcuEcIIvP8W6XSrUNs0gzsN6xa5bBx?=
 =?us-ascii?Q?sHjfAAmgCEjkG2h3D1/Kf2/j5zpkMIDT8PVNP7sQR++h4zxu8EZ2+2CaYsMl?=
 =?us-ascii?Q?coZfh3eIn6uW7jXIN/WKaw0CVQ5gmZtgTWqFPx1YiuAyKCEkTm65I9lAYZVs?=
 =?us-ascii?Q?DWtOh4ALqngMwtxmyeJpsd4a6ShLi4zv94D2tjv1D9MeZ5t/PHhRn/lI/qfc?=
 =?us-ascii?Q?VlOcfgTPM0eSUV4h+7JBpqDICcgRWO/GJ8X5/mCI8D5HGIiI1PZSqxAMuBlM?=
 =?us-ascii?Q?3RpX+glVK2gZYjZLyvz7Tv0wCYpTwiuNwkFNBs55iWNXKiaaTfSllF+vj1Q1?=
 =?us-ascii?Q?uZG9WILYYRee2LwA1YFnQDziAML/JEIIjD0zltK0ZrU/9FWpPyG0poT3jaRC?=
 =?us-ascii?Q?JROlUTzZy1sueWjcyGJTvF6VuBNjlb8I4HFVZUEZKCuf9GwAcFoyA1nnpEu/?=
 =?us-ascii?Q?MHR30WpErvTkq3vt45BeH2CVYsZFIE1DOquI94YcsByROSxTnaR6Rvdf7Ywr?=
 =?us-ascii?Q?bMwkka1+RMhVu9hOQvtrA+FKnv1fEdkKBcKHiJWuphFibxDNbcG9lAjiCbej?=
 =?us-ascii?Q?Uyf9Q11+fqKNPFw78+6iqmJf134hCZu3Sv2M8xHjW7UPHVfPZa4lP+NYuhFx?=
 =?us-ascii?Q?ApIhAEDi91G5NKxSrTaCVu24fEAiCWvhax+YuW7GBp/+qHrCGpzlfsC1b/ml?=
 =?us-ascii?Q?LLdtD5Sd8/8LPnLCgk7d3ZnuHlsnB/Cox6YQ6h7zRub9ZggTPGOL5TD3GWie?=
 =?us-ascii?Q?C9kXo1umQ3LDMu1SoIpTPkAJ89GwcBCERve2de65NEqiOYfGI0itmIU+69hS?=
 =?us-ascii?Q?lDrjK/U2iie1NfaRRpTWcP3HRj477L2lmBaUeypfMtUF+gsp5Gu0RP+Uoh2F?=
 =?us-ascii?Q?ZXPTMSeI8s5HQ2g1xnyEASvc8c7acHLcfL1aDuQZkdSUy2C/D+J2HTz+4cp1?=
 =?us-ascii?Q?uepfk8664gs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pnFdVpoA/1E7Jw+JSoqgkY64AW6597/69guUzZZoTlNYPjAwd4hgHAL+x6Su?=
 =?us-ascii?Q?xJkNwtAZveEnA/YR+zl1OX5ysgFP0BREkDVWcy/PMDENCqONBebQe2oAp/e0?=
 =?us-ascii?Q?dAQ1WMjpd+RP6YdNFIrlv/Sl3bV2Nu+SP+JsWB4u0rstyJPKfmQVmT56FCut?=
 =?us-ascii?Q?WPsPXmKpun3zaFGQ8aSam4sRY7/0pPmtCyIkJamYAgt7LxqtM7Djg8MxPGnX?=
 =?us-ascii?Q?cJnRUkDE/HLyPRm6DECPG9k3tMNjHObwttS5PVt4lsg10xv6jfbaW8yboXw8?=
 =?us-ascii?Q?Ec1yxCtCPsr8PbKhmpqSTgBhTL2ZS3d3d7L6EH7ThdSg4ZG+GDun/JWF5+UT?=
 =?us-ascii?Q?f6iysKrh2vejQTyyzwKVZtpqiYX97QYl4fI9lyW/TfXQxhaPuV7H9iHvGVLm?=
 =?us-ascii?Q?17FeMmMGY56Q6zDLyIYaWWY1Ad20Kz7/l8O2lq+8EMj/YySyH6henDgVe73q?=
 =?us-ascii?Q?Fm3MDbRpT3mr4hnuNrI1QsOS2emb0oFyFBFePLQhkJSkzoktPmGdChuPjPLF?=
 =?us-ascii?Q?zrf1dhoa55ZWq0tf86J4E7LPf3kCjifxF2ZgBqO1CEhO9LDY0Tv4IZgb+SjS?=
 =?us-ascii?Q?9pk/7Q29xS7TqVVFEzFq/R4zXCdmAiqom1gh9uz1Iu1LMDbJGux3PciV+gP4?=
 =?us-ascii?Q?mSReytNyFc5wmPh46wIUAVEoxG/JIEN4krieQQ3arL0Vj//25qCybOrO1OSP?=
 =?us-ascii?Q?T/O9H+v4tqsCh8A1u7aVn/cobUOKDqk2plhhTpsaf2FFmIny5XuhwBVhPWkk?=
 =?us-ascii?Q?CiVtxqrLpHE+rLyijD8ZNOEdc5rZcmG9sBo3yhkh2nAkv6+9vxmnt7zE/CMb?=
 =?us-ascii?Q?pxet/4ZORAsrrN4fs7550SDgBJ3bBey7ohy/zLd857dXmEuiT1BbZvbPHrr0?=
 =?us-ascii?Q?cZbXRFkdwjaQN2K6cYqmMRsJ5LXS8gq/Ia86tBRytBOSbFmbnxFR8FOkyeSF?=
 =?us-ascii?Q?//FK8s/L2rq3qxqoXWW4GLyhsXE/xmgGBeH5hKjvJXbFQS00qJfYTFGx0TZ0?=
 =?us-ascii?Q?8KrOO7YiyMQLdJ7LO/Ar6gT+l8/op2BZdagBpvwiJTBcmtqimB3EW+Zea9Q+?=
 =?us-ascii?Q?W+gvicMq7pQojhSH2LxGHSSqNYtBzv10+qgHqsPiE4QiBawjtRRaoAyKBmgW?=
 =?us-ascii?Q?NbFxz1sZW50cCPk+mDScGHYt9TBZK14RHQya5BP9n1yQ5RX/AqLenXycnHl0?=
 =?us-ascii?Q?cv+Ej7H3hvs9+NPbFxCqAJuXQ7lK8MCZJHI7LLlcNJ1QdWGGuw4cfk5X+6d3?=
 =?us-ascii?Q?hDmhNRkG0v0ec6u5yzK48GCIXPFhor1e7Dbk9fBxFxtZtY0IS2VA7XthvU1Z?=
 =?us-ascii?Q?UmjKa7SOM8jjBGHTRA1Np6OJP7FDcSwha4KuncQNz30MZAZxohA39HJ7tQ38?=
 =?us-ascii?Q?gsckbI+REZVqWn9DKbWsSrp4KkvDeKsGxsz3YPvgX4VVsFnsplG7m4NkIn22?=
 =?us-ascii?Q?j8gk8x/V3pMfpGAMZL4XXl9KtEz00HL8qe3Dh0U+dPSgdSZw5BQp42zVLt8J?=
 =?us-ascii?Q?8lZ5X9fMmwoCBWREo8/1HsMhSaTSxX6TzGEZSq3AvncY8ezNV41KgiiODcud?=
 =?us-ascii?Q?hRTUmDDlG+DG80e4oPrSQ3fNiEm34d9oMbShCcuxl7lMJ0nPq8vtGhRTKl/7?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XS7GOH2IqpI9nUEFegw0ZvrCQd4NCzWhJ3bLi0FbJC3uoxajvqAhCtc52MjJeid3MDF4gX6LxRFinrn7IwJd3iTvoxtsBp2fd6iKmkKEZik4tac3mfCM003atmKR39HubfV6jyltHd3p16JtxYYJ7BoR+kBY/OPtac5ueNgEV105hUraRGh0HK5kt6QO1J9K1TLKfeJJv7X79cATVU4ORHZIiDFKVjzO+EQqV24aiSdDybZ9BA3+94S/+RDBvilyYyF/mi15gVmGwnt1v288iem9YgiqqGpYJ7P3+7P/kH1cm/Lou1jYOAEoymCsHha5to37naHFmsJEl18B5mQUhTXGaw/RHdyQuE+yohbwMj4emqTSsctmjzOvXw0KVjicXiZMbABwbiYcj97u4pRmhy0eiuDdCh8Y2haMRK0gt4r7DZwP7TqxLL1sVjaCYM2B4tQMVcZjJT+UR+kM1SE6b4UzZPMm2+w+T/TPySVcUKNGYGA1CFO2un9nfJ1RPjVItFcgxGULoQd7CJ9yewbOS3qPIi7XLhczuqxPMH3Wo+UMoN/mNddILJfOibXG/aR+nPSMEbD4Ty7UKdFw3NlWTRGyi57uC9kWnuZbMdh8gBs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fb89c6-537c-471c-3c64-08ddac95c796
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:25.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqjLXzYTBLDGaJllh+jfMVbvNekzMgWwNCpmqrH1ZnwRP/ZIWJ1Iy1EPzeYNl3DQND+2LZsqQ4nJfnICqgWkMRqQMe2yD0O/pTVxBTZPVA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfXxfseWpLyFo0v rs2Llwx7Sr8m4qltrehON8bTAaModWX57x0/AKBfVq6eclGgfxn2Xgct1ynaEdSEGXMnEBpy+W3 zcfbZRkIoFKEp1S0pOEc9YOjCE74ExoZ5KFpDk4hDrAlCxUM/dGxAov7Rq44FxN+7zp7JoZYQoC
 pL60eWzyoCDT/i6p18eI9DmtyrC3to4qDRubL+I99x1MkC9gmkUqm7EoMbs9PZvbxMhqREnm0ek Vcoj9Pw26UF4EozqyzZuvrMOnxAF7RMZtIDTLnAw4BOiCyCakbY7FScttNNtHPDabLhoihZ3Vb8 MkyRHJobHDjSgHt9ySgu8iF94L82l5kRTA6i0TPjHsqUQ1jJZcAtRcfCwqrE6FwHR0m9xWn0LgO
 feKuyPkFdwMxOwjOPV9q/wT2EBHcq7NHJ6A4NfRF3O18VJwHkKzVK3GGv9Ih1LUeGu1F73d2
X-Authority-Analysis: v=2.4 cv=HvR2G1TS c=1 sm=1 tr=0 ts=684faa17 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=zd2uoN0lAAAA:8 a=NEAV23lmAAAA:8 a=CPFh8w3XjK0KlD4-iNsA:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: fS31QMx6rjPTf3_yhgpHKAcwW7FRxxhn
X-Proofpoint-ORIG-GUID: fS31QMx6rjPTf3_yhgpHKAcwW7FRxxhn

This series adds multi-page clearing for hugepages, improving on the
current page-at-a-time approach in two ways:

 - amortizes the per-page setup cost over a larger extent
 - when using string instructions, exposes the real region size to the
   processor. A processor could use that as a hint to optimize based
   on the full extent size. AMD Zen uarchs, as an example, elide
   allocation of cachelines for regions larger than L3-size.

Demand faulting a 64GB region shows good performance improvements:

 $ perf bench mem map -p $page-size -f demand -s 64GB -l 5

                 mm/folio_zero_user    x86/folio_zero_user       change
                  (GB/s  +- %stdev)     (GB/s  +- %stdev)

  pg-sz=2MB       11.82  +- 0.67%        16.48  +-  0.30%       + 39.4%
  pg-sz=1GB       17.51  +- 1.19%        40.03  +-  7.26% [#]   +129.9%

[#] Only with preempt=full|lazy because cooperatively preempted models
need regular invocations of cond_resched(). This limits the extent
sizes that can be cleared as a unit.

Raghavendra also tested on AMD Genoa and that shows similar
improvements [1].

Series structure:

Patches 1-5, 8,
  "perf bench mem: Remove repetition around time measurement"
  "perf bench mem: Defer type munging of size to float"
  "perf bench mem: Move mem op parameters into a structure"
  "perf bench mem: Pull out init/fini logic"
  "perf bench mem: Switch from zalloc() to mmap()"
  "perf bench mem: Refactor mem_options"

refactor, and patches 6-7, 9
  "perf bench mem: Allow mapping of hugepages"
  "perf bench mem: Allow chunking on a memory region"
  "perf bench mem: Add mmap() workload"

add a few new perf bench mem workloads (chunking and mapping performance).

Patches 10-11,
  "x86/mm: Simplify clear_page_*"
  "x86/clear_page: Introduce clear_pages()"

inlines the ERMS and REP_GOOD implementations used from clear_page()
and adds clear_pages() to handle page extents.

And finally patches 12-13, allow an arch override to folio_zero_user()
and provide the x86 implementation that can do the actual multi-page
clearing.

  "mm: memory: allow arch override for folio_zero_user()"
  "x86/folio_zero_user: Add multi-page clearing"

Changelog:

v4:
 - adds perf bench workloads to exercise mmap() populate/demand-fault (Ingo)
 - inline stosb etc (PeterZ)
 - handle cooperative preemption models (Ingo)
 - interface and other cleanups all over (Ingo)

v3:
 - get rid of preemption dependency (TIF_ALLOW_RESCHED); this version
   was limited to preempt=full|lazy.
 - override folio_zero_user() (Linus)
 (https://lore.kernel.org/lkml/20250414034607.762653-1-ankur.a.arora@oracle.com/)

v2:
 - addressed review comments from peterz, tglx.
 - Removed clear_user_pages(), and CONFIG_X86_32:clear_pages()
 - General code cleanup
 (https://lore.kernel.org/lkml/20230830184958.2333078-1-ankur.a.arora@oracle.com/)

Comments appreciated!

Also at:
  github.com/terminus/linux clear-pages.v4

[1] https://lore.kernel.org/lkml/0d6ba41c-0c90-4130-896a-26eabbd5bd24@amd.com/

Ankur Arora (13):
  perf bench mem: Remove repetition around time measurement
  perf bench mem: Defer type munging of size to float
  perf bench mem: Move mem op parameters into a structure
  perf bench mem: Pull out init/fini logic
  perf bench mem: Switch from zalloc() to mmap()
  perf bench mem: Allow mapping of hugepages
  perf bench mem: Allow chunking on a memory region
  perf bench mem: Refactor mem_options
  perf bench mem: Add mmap() workload
  x86/mm: Simplify clear_page_*
  x86/clear_page: Introduce clear_pages()
  mm: memory: allow arch override for folio_zero_user()
  x86/folio_zero_user: Add multi-page clearing

 arch/x86/include/asm/page_32.h               |  18 +-
 arch/x86/include/asm/page_64.h               |  38 +-
 arch/x86/lib/clear_page_64.S                 |  39 +-
 arch/x86/mm/Makefile                         |   1 +
 arch/x86/mm/memory.c                         |  97 +++++
 mm/memory.c                                  |   5 +-
 tools/perf/bench/bench.h                     |   1 +
 tools/perf/bench/mem-functions.c             | 391 ++++++++++++++-----
 tools/perf/bench/mem-memcpy-arch.h           |   2 +-
 tools/perf/bench/mem-memcpy-x86-64-asm-def.h |   4 +
 tools/perf/bench/mem-memset-arch.h           |   2 +-
 tools/perf/bench/mem-memset-x86-64-asm-def.h |   4 +
 tools/perf/builtin-bench.c                   |   1 +
 13 files changed, 452 insertions(+), 151 deletions(-)
 create mode 100644 arch/x86/mm/memory.c

--
2.43.5
