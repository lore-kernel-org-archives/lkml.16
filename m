Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251102571AB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309426; cv=fail; b=ik0Z3wIH2h2LTN8xhQybJZtb+HmaXRs9mjJCKuszl31oNDlEQFTDTsb47CIyYX4JOOQ6TFHSjkHevg46e6z/H0+DZoGU/iS4eD9ntBFeB+gIa6yjTJhHt9uSLD+Fm1vkU/j9wiphC/5RhEQ7Ut9yVpv+oz6IvRVyA4B2z6pPkRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309426; c=relaxed/simple;
	bh=od9JR9TGITckGZhpAtaTUl2UInyO6QBVl+iSlVTZwKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CakfFPXvVEBSEkYvc06zQei7pVD2OiGFXLQfYzqlHSDNOBfwi4A/c8ty3dvusMY6GctKRTCKlw4FuviR0MADgXoMCh/TFsHfJIRo6i6Lb1xFM0l0CYQgDJsV7rfxAW5R0Og5lC+CDaVsxWET4SKQtXDxR2cOFH10WiwtDWKnAOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JvTDApW/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C6b2GaGB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JvTDApW/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C6b2GaGB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7Mxii006178;
	Tue, 22 Apr 2025 08:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Jc/FpWTukiSQC7dJBUQXCCq5hIzUITwKucp/3nq0o9g=; b=
	JvTDApW/GM0L6KrJ/31xvDebCEFrnHuNAQP0dFpf1+z9oeFnup9QItq/tsoiSpFB
	HKZXfEcKTgv4o6ib05LTrImg9qmjMh1WGpznGRCJ2XJypNqy/pSTFDP1U/yL6q0H
	vHc1blVVO3ZvINEzFJNivTlPHNQgIHnsGaibkn+cMtF+qvKuC+wkNjh6mGUB54q9
	0ZzHD+AqWE+F8lZbj3ovBPHQn0tXAWwmNsNsennoSLWHRPdTBPj5cbte0gVRdzYt
	xx+Vbe5AW0Cw2vD9Dpf4pnhquD3elYCkqK37T373vIRu1Bx8UDPYyiaF6jT0oIN2
	NvVFLIoaKdtTiyLrXRB2hA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642e0byt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M718nV021110;
	Tue, 22 Apr 2025 08:10:09 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010005.outbound.protection.outlook.com [40.93.10.5])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429fhsts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNrZnboBmWkOe5G/6LNJdMDPCe9XPfM5/fScQKZqYUS7nkeFwGx8E9G/S2wXnEXimXbzD7TeGc4nD4fXuAuD7wE9GBt1paOnx/8H3muGnEX7ZKHGenllmZwkHBDshZBivQwDJyN5HodVNrs6YPNxEU0hmAGR6gMqLUsugkrooMJeHMDy9w08he8Jb+Jmc3kkGj+pruKNvbzkpHgt0jCqFHj5ypNQbR1UyD2fKnq22yawqQVKvU13GYQzpJX49F5TS04Vjz6am+7OruvtOfJLIs++u+jZ5TS/NrebTizaec98NTiidVu6zBBpTF5LVpTigISwyQiLGd8Gg8OUSLluhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jc/FpWTukiSQC7dJBUQXCCq5hIzUITwKucp/3nq0o9g=;
 b=w2PwarOe/KydF55Rb3VU7iF4U9zCad69ORgF3Z+m0BVLBkRinbTgMF6aPaI80cQ/3sXhW87NV+ZZ3+ablgUQgR8mlHHqeTwKgOpLuD0TR+W3Klzshg5s2RBk+mhMEtFB4LAblktKjxWVP7kKcfyIh5jLgkouRu315bsyBzOcTjdz2pwCDe2gsiXq8Y7i6/Q/KaEySnkrqdvga7hU8xYUWoZizRc7Uq0/BTa9yYHvin19Xkjgf+zzc0aQb9X2SEGYL1EB4T59BhNvxW4n0aGTxnGIOu/8BaveaSA3td1i0K5PzWhHbTd8MdSt0t79Y4RPrqmu8/sdg96KO0bWKscnkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc/FpWTukiSQC7dJBUQXCCq5hIzUITwKucp/3nq0o9g=;
 b=C6b2GaGBDv2WDu49wqi7xGGionW7O24jl0pAu20VInr4hccDxDOQW+WCGSE48pHmyEA9o5tzO+tbCoLCoVf83z9dS/r9hLUURQrDmpgs1HUxcziafVW0wcy/vyONas58NlSp/SxPnL4PnFGw5odcXUvEZC5a/ZwV/hoZDJfs/rY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:10:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:10:05 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 09/10] tools/testing/selftests: have CoW self test use MREMAP_RELOCATE_ANON
Date: Tue, 22 Apr 2025 09:09:28 +0100
Message-ID: <1f22d7db2700bf8b920998a6acd2b1cd0f0ddf7b.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0567.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: f89c7dac-2d88-426a-b8c8-08dd81751723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZuvBTrGmzCzIvXr9ucTN0T1QEqYowk+Kfd63Y9bqCZBF/fG38gCkGqnuTM1/?=
 =?us-ascii?Q?09n+6EPH4q7Ty94LR5RxRE/pWBuiaHCjCKQKv3hUnZ0ibWR52wj+G4ohkORA?=
 =?us-ascii?Q?DgOvszXB3b6T/SDvhA/nDAQ1yG17oUhsJSbLI689pU8SgtwRpbk+Pnjrw47M?=
 =?us-ascii?Q?xFnkvRN//ltOd5sAvnKahVzxKQE21XCfaMIQRSLed4rQnuncECBlwIXHmu+m?=
 =?us-ascii?Q?BIpWNag0h7588hligLNpXayXcrM+prtiuRM9cpcNVKlcZsruteRbwIybaAOz?=
 =?us-ascii?Q?qzF8AY2Ncc88BFAq2gPuL1j916bSeErYAZMzy1hi+XP/9/WIqHtq8MRS7sSV?=
 =?us-ascii?Q?8b2Gbc99pWBplIHCplLhR5d37BJxi7Ti8eTJfqcAcLdJAnHUXarwktKBxD/n?=
 =?us-ascii?Q?pMqXZfSUKzuNANnLSO+qi767+QRY4nkj9myHImX0qKNehoqdJRZQI7WsTcA0?=
 =?us-ascii?Q?J/+mAdpYobvxmNUyASKpHma9qI+8iVAssWXjhnM/2CMsZHNKd5H0wFFGM0bS?=
 =?us-ascii?Q?S/0PNO4Aijg2AsQLpzr90opGrAtG2X37KuQS1Pul/COSpmRclrzYJtRIBIY4?=
 =?us-ascii?Q?Fb+jEZNT9eOUBtuVgf8KnoDVtZ7uZ+KlDPVdEFlkIpINesERs2YaFoTX5dtI?=
 =?us-ascii?Q?K/QNt186h3gA8GdpmbaNfWvaF/2XgmXRGPH2MZJmSthlfsoAaOY5FswmJMle?=
 =?us-ascii?Q?p1Jbnpo3vDI834TL2+6mLpCYnfk5nCwP4Ed3wUpAx7N3vjl3HI/HRwKjsnM1?=
 =?us-ascii?Q?+1KX4s4M0zxLbSQMR22U9q7G1I4hJPuaEMZFM6uKHczP1W+ba7Oub4i0Fy3r?=
 =?us-ascii?Q?DUBjhDzIy6AtMX9CMH7H55UW7rcX/9j8LLca1mz3aDfxCUew8Ib3dZfwnOzp?=
 =?us-ascii?Q?1UnA1FLQHEH98UoJMC/rDY0vKibGwWdmBGU9+r64UYhv+Ktme07DfO+aTyTJ?=
 =?us-ascii?Q?2SRo7PC8y/yRXfrsbygqoeLXwvUGvA2k9xXainJ7rv3BNxMVxBp4yKyciEcy?=
 =?us-ascii?Q?P+YfVgVjeWde8JGVUsptxtf6vruIQ5A3xZQQF4/8bWwPdZTITjwR0pJf6OAx?=
 =?us-ascii?Q?M3xzcOeeMluto9T3+GEQCpVyJDXlQdw98ZIfQoSPPDlQ7wzu3+27lSy3/N9t?=
 =?us-ascii?Q?iVxsgJBDp9zsfGO9+WKsB42hoH3L0gU8a2ynlOSU4FLKMELRrfNbWV8d6BVS?=
 =?us-ascii?Q?zuyKRHEYsymD2zjbn4jhl+kYBbuPVwre9J2KZAv2SXPQqtdL5qO08NWPr2Gj?=
 =?us-ascii?Q?zwIdA/36Zo6rl/pyXTWYP2aI+i8c1flt7J3LlJz+zGpLYy/C/Co1DAeupp14?=
 =?us-ascii?Q?IGTSvLaW9R0/7Sd5IAcr77E51qrgwLYKCCLsSII/5mdVCpP79RQzgCVz2046?=
 =?us-ascii?Q?XXut2pEh32amf6rzMgcfTbf3nt82FRlZwvzDCL3ZXzT5ca9/V6cVYg4+lwsU?=
 =?us-ascii?Q?GN2XKR6nWX8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VzRx23mpQb+86Y52cZCxwtRkTu63e2+66tqhS9e/95ixcPyKtYqRJtTGM0QQ?=
 =?us-ascii?Q?VeKe3TJ2LARHz7LRU1nLNc+b8JUrpOkDvEOSvXMKdadSfd1GU3Ble2HdFADL?=
 =?us-ascii?Q?zu/AY4nRqWxnahCQtNwH9RTSJe4JGwWJxFUPTURpWblCMWDO8OUKmKg1GZIL?=
 =?us-ascii?Q?DhZC8K+GbI0abOwCMeAyBU3yxQF0QZZf+/4W3kux1c7azm/xgUgFO3D+er7N?=
 =?us-ascii?Q?bUCDswOnVsAJEKUYO/ZhtVvpqq4LVfK/ypoX2+OmuYcf4+RqUe6fwK1RErzl?=
 =?us-ascii?Q?+7QrTqCjE26waX2oAb5yxwLt0s49JMIJsXB5SN0xWUEK3J8A/ZeYo8YB89j9?=
 =?us-ascii?Q?EWPA4XAy1uISNLwiJJx873Vkdvieadcn/UsGvqPpBWhP4ytVn2DXUOww7UUb?=
 =?us-ascii?Q?p/tsOpOLp4X+DCa8bApqAzRAxG4JMYezFRAUxenz7HOV3gB8R/6DJpIux1mT?=
 =?us-ascii?Q?tVP9HBBe39XtQGiLXMv1JGdPczVqwX6Gpdw0GbV/saPK6xOqZXQj3aA0P3Gu?=
 =?us-ascii?Q?EGZPQmBGpJ8DloKCvYLz3UbRIKY/1UTpd08cnF9FGCw0qnLivKcYWoNrWpkD?=
 =?us-ascii?Q?g38bqPq5YvIqi4GQq3/rW8lb85NK279kGvbXwWmpbjq2VZb4UU9IobyBtg6Y?=
 =?us-ascii?Q?nEdVjd/jMjpjmqZ7MwshZBPG7k++BpBTMf2tY2dHV5qn4aAKnl/Dynki97oJ?=
 =?us-ascii?Q?Kr8VGIlVu3ZNeMQsKuUyCCctxLV95U2bLw+8HDwIeak4OOpjfey1UViwk65v?=
 =?us-ascii?Q?suN3vs41J6c52fG2wWb1stGMM7ZLb9euRV+yyfJaB2Hg50NEyhChToYJQZxl?=
 =?us-ascii?Q?PHJz6H6JEEOfWEZfDBW9UOhcUifqkEouuYUVO/uvCD41wI22ZbFk1rC+ahZu?=
 =?us-ascii?Q?Z9klRDBhg3Hf98vCPCNmJkFfQDDsd6c7n3bftOo2hyqgBvfG+GN1PLWIfM7f?=
 =?us-ascii?Q?MVoX0s6Tmfialgzq/V0W2mGZMxmjq5c2hReXj5zqPOoqfTjN1CtPmB0VDmuJ?=
 =?us-ascii?Q?Nfu5ntF7bc80LyXESoJRTR8BeugSHed9cDOxjo+qXASl8Lxa5QHPlGbnX/V1?=
 =?us-ascii?Q?nui3FmZgK1AFi/wriy0zGdZi7dpNNp73eIqwMka5vQ8DQy8QS0JL8ijimgEk?=
 =?us-ascii?Q?D9Kx02Fa61zu10kzEU8HjwF1J2rdmYvX7k5/rQLuNcg0gzPkOW8YpC/z3rJC?=
 =?us-ascii?Q?3ytqUv3QrYZiMvrhw9jNVMatP4flxGsGuuNWQNlyXoVshwarZlq1Tv+nUT97?=
 =?us-ascii?Q?/QYYd7TR+C0Q6Qe7cGIui6QAMKyOmip9eBjhGeshsCIKWwjrJG7IJrLuG7Aj?=
 =?us-ascii?Q?NpOrbecL/ZNkAJB/+qXoasyRv9W83NOxUaLWha/S3FJTmdMMsaDqKARylqfM?=
 =?us-ascii?Q?8UXuaA0zhFgNtSMuLg4kLLHbvssPXQZYNMWVdtXTswd2D2EMmC4sce1EcMl9?=
 =?us-ascii?Q?9TUBCWNbTvsz60UbsrMb5h8zSwK7/WmxbCAXIQVIn50z8/TjYbQBqBly4bZq?=
 =?us-ascii?Q?9WzOnJbbVXYcy+/KPmuiqE4XLLizfKU0pluI8UvLkN2NtUsOxB/XkWX/t6Iq?=
 =?us-ascii?Q?1EH9eNkd6CpsFCphDuymmr9LiOULXCghlQxSdeMV3AldCxfrT6/k64AjkhxM?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	svZzuA61/MyItQX2HuAOxnwBqkh6DtOSKQSyIsfwEtQYH1DUPAksirPhT2gFgLTKvfbdfjH1onMe+A5xWMyZqxDGFD6HUt2c3EThfto4CNYW0VlKE6xw4i3/AlcanfPHm73E9/4C/BhYpXpX2gP7zwcUlljX6h+qHjwS9kQ7ycVWkMIcc45e1WzZ+6nlhQSJ+GFB3hkCIp07H2e8MaDzDNDMDmOuEDKMjhIg3yQt3YTQP9vtDOikpsgus062pRcXkAED293hnH+Itu6G1mpHcuYBq3d9K6P7ng9Z37uNrCDCO0Rb6/JomfNY4lZllvhftsPV8WCMouWev5udKuACjyNaZXTQYxAzZGKFMhyeTDb5louy3lp6Us2OZKKh6IiGNR9gWiNQRi8OQ695AouNlVaSXMpj73WGiGofhcLQa2daOEVp1Lno98SO0Xe+viDX3Qvkg+9VouAGTf088OepWM26dIwje9gcFOEo0f/HxBYhuVaVIqckkMDkTlAs4iUKHOPYan0h/EP9w5upySmTVWj/7RlH/rTvlNUv3MYRro1YQqMC67RNn0a4sQviqwji8tAgtRtjjSFEvL8VdFE4HrjL/mNijCUBTWn5ebizlBA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89c7dac-2d88-426a-b8c8-08dd81751723
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:10:05.6521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xViSk3nJyBYzZdwhkM4hYEO+MHHYpbBB5NIqyx81EhHEMxBMRhKhGnopELL4fysWOq5F2Ze8p2FxQZEuEpfwH8i2NBUcG9ZOn76I1Qnvk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-GUID: HlCxPCRUdgcwCePE2w8J8Gw3soYXENLC
X-Proofpoint-ORIG-GUID: HlCxPCRUdgcwCePE2w8J8Gw3soYXENLC

It is useful to have the CoW self-test invoke MREMAP_RELOCATE_ANON on
partial THP mappings, as this triggers folio split code paths and asserts
that this behaves correctly.

Add an additional set of tests to explicitly do so.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/cow.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index b6cfe0a4b7df..1770ebc3aa13 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -793,13 +793,14 @@ enum thp_run {
 	THP_RUN_SINGLE_PTE,
 	THP_RUN_SINGLE_PTE_SWAPOUT,
 	THP_RUN_PARTIAL_MREMAP,
+	THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON,
 	THP_RUN_PARTIAL_SHARED,
 };
 
 static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 {
 	char *mem, *mmap_mem, *tmp, *mremap_mem = MAP_FAILED;
-	size_t size, mmap_size, mremap_size;
+	size_t size, mmap_size, mremap_size, mremap_flags;
 	int ret;
 
 	/* For alignment purposes, we need twice the thp size. */
@@ -869,6 +870,7 @@ static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 		size = pagesize;
 		break;
 	case THP_RUN_PARTIAL_MREMAP:
+	case THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON:
 		/*
 		 * Remap half of the THP. We need some new memory location
 		 * for that.
@@ -880,8 +882,13 @@ static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 			ksft_test_result_fail("mmap() failed\n");
 			goto munmap;
 		}
-		tmp = mremap(mem + mremap_size, mremap_size, mremap_size,
-			     MREMAP_MAYMOVE | MREMAP_FIXED, mremap_mem);
+
+		mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+		if (thp_run == THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON)
+			mremap_flags |= MREMAP_RELOCATE_ANON;
+
+		tmp = sys_mremap(mem + mremap_size, mremap_size, mremap_size,
+				 mremap_flags, mremap_mem);
 		if (tmp != mremap_mem) {
 			ksft_test_result_fail("mremap() failed\n");
 			goto munmap;
@@ -988,6 +995,13 @@ static void run_with_partial_mremap_thp(test_fn fn, const char *desc, size_t siz
 	do_run_with_thp(fn, THP_RUN_PARTIAL_MREMAP, size);
 }
 
+static void run_with_partial_mremap_relocate_anon_thp(test_fn fn, const char *desc, size_t size)
+{
+	ksft_print_msg("[RUN] %s ... with partially mremap(MREMAP_RELOCATE_ANON)'ed THP (%zu kB)\n",
+		desc, size / 1024);
+	do_run_with_thp(fn, THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON, size);
+}
+
 static void run_with_partial_shared_thp(test_fn fn, const char *desc, size_t size)
 {
 	ksft_print_msg("[RUN] %s ... with partially shared THP (%zu kB)\n",
@@ -1181,6 +1195,7 @@ static void run_anon_test_case(struct test_case const *test_case)
 		run_with_single_pte_of_thp(test_case->fn, test_case->desc, size);
 		run_with_single_pte_of_thp_swap(test_case->fn, test_case->desc, size);
 		run_with_partial_mremap_thp(test_case->fn, test_case->desc, size);
+		run_with_partial_mremap_relocate_anon_thp(test_case->fn, test_case->desc, size);
 		run_with_partial_shared_thp(test_case->fn, test_case->desc, size);
 
 		thp_pop_settings();
@@ -1204,7 +1219,7 @@ static int tests_per_anon_test_case(void)
 {
 	int tests = 2 + nr_hugetlbsizes;
 
-	tests += 6 * nr_thpsizes;
+	tests += 7 * nr_thpsizes;
 	if (pmdsize)
 		tests += 2;
 	return tests;
-- 
2.49.0

