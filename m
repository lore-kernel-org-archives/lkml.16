Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346571DFD86
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837361; cv=fail; b=fjoIbUAKWXFG3EjknTT8VCSoL4bCoEkgFI9jA3IGg/pDBDiqk8a403bMx9KpsU4nCAmOEWOROVS/fpeM0e9oEC3rxBOcJ21MbO9aCLw9gCUFtF8ebQJmliNxVKkW8iAzyMWJgIN7QNaJWJF+PU6g7n9E4XIjgxbD43ju5f+zKS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837361; c=relaxed/simple;
	bh=bdl4eQPXJ+Ag8xo8nTbWEMpcMbqRbcXwbrM5O4OmxBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LLjn6duFUQ/PVwkzIedSSMWUjUv4mN+ERVPNNWq9WGu5zdzdWUfr/qScWGbriNt/KLv6gqaH2m6AKY8KzPlr9iuqu6fHS51jjqWraSTq4AP9t88yvF+RpZAYqvsEKsRSHrJuG6Fj9NlSciOA3Xacz/6Sw0R+9t5q5I68siiKWV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o+JHk7am; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R9hLzuvD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o+JHk7am";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R9hLzuvD"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fgSs019281;
	Wed, 25 Jun 2025 07:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=bdl4eQPXJ+Ag8xo8nT
	bWEMpcMbqRbcXwbrM5O4OmxBE=; b=o+JHk7amM7ebDuNwRskWbR0HeMfnuAd4sR
	Q5mdNtaTdwlF0xyAm16rwoBbLGj0/DMmUmxEwKvPqTxmgAoF+uvvNKhItRBAU28a
	fLodIJ9fS+ZJO4rZ01iDAYu9sxJkJAVp6HYWdeSVZAZbnmgFBLM1kggIkVkY9VAN
	0WF5K8W02KFguhE0dPCtNTR2BwXpf/l0mgBAd+2KFfNttyyRShcLcz0/cPg9OfgR
	8yBGgHPa3eHNip9TgDPMw+saT60lRnJ9eBlnx1DARMdA1p9exUu/voxYWSyICs6v
	KQAm/ILC8bSs4tZXvIvxP43mWK6wsaqMyzvIkmuxsIwl2GP796Rw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87xtsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:42:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7buPv024338;
	Wed, 25 Jun 2025 07:42:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkrqu7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:42:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVNjiQmv8HEP6TseJecPObRWC5CBIxT8qi2sWq27aUEDID9bR/sYdAcxSw8KaSLoBYqsNv0AVVF5W0pGzdzfvIreQGNEQfJgyD6LxzKT7AqZIFmkigVhSkJs3MJKbLjMbO16I4zrPQemOKBgHlDgI6/7JzHM8fQsSN7eCcDl1e0MwVLaiXcysaB/1yhb7oroF+OUA6u3J38ein8oFRMwFgOrTnQtYsxsSlJJsYaFoS4tp8lLofklzCnbOFcm7e9yUCubE3Wh0BKYR0dDZrQaGXFw+hhZgkaFig+Nq0aPX1U5armD9AKk/WnCIygywqc90I23h/26he1EEP0GpdDc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdl4eQPXJ+Ag8xo8nTbWEMpcMbqRbcXwbrM5O4OmxBE=;
 b=cgTQQq0P6asBlVAcHKrXnlWShTJrAOqbriLDfZFIdsX8HkkYUrJK1+ZnXD4NGb/ad8Y04eHeqgwKd4KfmA8M7eCJNjRJ4bc/+n082UDfiktBX1+J9Mpc9Bi2aEffnSqY+nq8bkfu4XUiJCmsZzmmtvG0fYBSMQE2i3hlu5H/Jac+KdH2qijMJ9/N5RuJd/aKkkNcuY+p0xpYxczyaLVeFJ4gcVW04i/CvZ5iVRCWVFlbuqoTUhNcScht4MF1kCF/2ma5Alesxdr7hH3kT3nfCjUR1AQNfvmLpWeRcWvRkuRXXSd25XLotjsEDdfAr/dEU49EbdXFNi8gcHjlUTUxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdl4eQPXJ+Ag8xo8nTbWEMpcMbqRbcXwbrM5O4OmxBE=;
 b=R9hLzuvD7wA4/xUZPvUwoZh7jF1w3fI/1OIVkOBt+YilI7V+FGYZa1D5CUMFY5nw5D+sFTocO3hZ4pRPdokr8G8l4KkU0u78gO21mZLIYQIFv/NPV/1nnP8SYP05VerHr39nWAzBdHWdQA4Uv7GBPHrDKe0WG/C/DcQ40PLqdaI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4579.namprd10.prod.outlook.com (2603:10b6:303:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 07:42:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:42:18 +0000
Date: Wed, 25 Jun 2025 08:42:16 +0100
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
Message-ID: <3b6db0c3-aef3-4a21-a154-6aafd639dbc7@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
 <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
 <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
X-ClientProxiedBy: LO4P123CA0402.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: 05418e06-188f-4270-797d-08ddb3bbd00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NgH53o3oRhK9TImPnMFLjcLyuLoUiS8cg8px+M/yxDMMEqoj30Tz2aRPdlxU?=
 =?us-ascii?Q?V27CE4l3qmlcamFeqkiwtB3+ugNP25eQUrk8jUq7JeGAIet63qf2Ymi707wJ?=
 =?us-ascii?Q?+0gt/5Ykp/sP3JF7AL/ZQB0kHDWE0DARfkCGZ/3jPSGX7aTkrSivXJdpZajt?=
 =?us-ascii?Q?0jZ3CHN/TT/mkHSiiphmsTJdDr2+o8zsK/QAtRqqsMbI+rr0PEXac9pdMI6h?=
 =?us-ascii?Q?i2SQ+qVY6wKGzDzWHr3WR+AbqJirhe5xCgqVtUV0M7UGOs5QNNnXVxHoYNGt?=
 =?us-ascii?Q?9vok5B8nS92+fSsEkKBoTp1CTYjHQZR3Wbd9sq/s4GT8SbtlUx3knblX9obm?=
 =?us-ascii?Q?oQLscFLHFHOLlCd2atYCgiUV8V05U/6m2j+sqFRl4AoDNAukor/jwHlk9Xg3?=
 =?us-ascii?Q?ofmQt+yee3Fq9YMr4c6yfsbHBlSc1JFzTnbTGyJD7vdFqwfskv2POVjB3eg2?=
 =?us-ascii?Q?Vw40bVeKSFQdIUDMKVTTN1IST8IWt028PNQAEEZJFeI0ujDcYyhbjVd4B3bS?=
 =?us-ascii?Q?e+Nmh/jxuLmpo7bE9OinWxO+NBWami84YnJENpr0LDXCCCvpYgM/MiGqu2cA?=
 =?us-ascii?Q?cXwwjLJv10bSgNIadVOD4xYv+NSzMVDx0sAkd9xzjW964Ok+0Kp9F5jryiaY?=
 =?us-ascii?Q?2VYFKoks+3H9w5e36SsSCo2QgLacrhWiOAaAUE94hAqwX3KVkZ0VAK8f3Yr7?=
 =?us-ascii?Q?ROzPjwuZ+2NgZd8Z8bRyvElh+bRmVYxuhv6PfROZUX3M6HvPW5fkagd0fgDj?=
 =?us-ascii?Q?Er2UbEuCRXG0zVlfHlOIZjxXWIOroFWWHC6VuvXNQeIy7Zl0JacRrmuOwT3T?=
 =?us-ascii?Q?m3pSGnE1jDkPGhux51o6BGI8Svw0+u+8Ahp0SlOoZICJt7yYTJDLanuWNu7m?=
 =?us-ascii?Q?OXcvrriMJIN0nOiPv2Vx36YPEPSrHqWYD9AmnFxR0LfnmibwZbY9UIX8eH5z?=
 =?us-ascii?Q?U4oVOZut+x69ZFNwy7G+gCM1rIWPdBJR2JhEMBT2sAa2uaAarfi4BBj4csX/?=
 =?us-ascii?Q?T705+C/ABrAoqS8yuej14z+Wf+COR4Bzc9S/zmq4GLrk0eAbnhpqmBxm0upv?=
 =?us-ascii?Q?oT0VuEVpnZP5wzc755hf7ZBzjS831lBug9A0GMghqbFLeJEMFsM0lKFotky7?=
 =?us-ascii?Q?8VLqcu2DoUeBc0/TKQvYtr8xUVVZpW24Xs7hoc2T5/z4ys3zohP8vUwgnKxZ?=
 =?us-ascii?Q?j1GAIFBdM437QCmFWLXbjbLXf/CdiMQP+UzNuA4r8jJjlD7dkwz3jVsQhfc3?=
 =?us-ascii?Q?5OTygPYRLmiZtPM1W0u8bacQNP1DgeLoHeol1YHl6SzAL6JWv4q/T07X/Y0/?=
 =?us-ascii?Q?IAU/+OGzjF6YsdFyMNDF1zqF+zL+g4csFORfMA5N3oigdFSGG+SpSUKra4O5?=
 =?us-ascii?Q?1BOJhxvlFVwv9/guidOIcj5RzpgHlS2EK+IVYJuMaeddkFd2FlJj4WhkXPwz?=
 =?us-ascii?Q?8DxYVRvw4yA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EOZOBgjgOWYXKIhuLpG0/rSAIphe/VJBkDlFdT5jufOyA6gfn9G4n7YVHMO/?=
 =?us-ascii?Q?LUBcxWlJ+1LEVvkDSRn5NPB8orfJyH9lrJSwLdy+GfaxJhKOum1cryta6aR3?=
 =?us-ascii?Q?PtwIA7pMw8LgAxYK4YKZXNyCi0BP0qf//fw7ph51XeANuzSRC7RYatpWLxZB?=
 =?us-ascii?Q?qMNuSyvmqvL4jD8zd4pHiwYCC1jXnwuvEFISR8xLDSbC9Py8kLAw526Qy+2R?=
 =?us-ascii?Q?HL2vs24cKurnxin/chh284hu6a4+zpfn5wQCfAWP42LIgvgs02prwm6juGDz?=
 =?us-ascii?Q?gTJ8mb2qtOEJ3ElUhkE51AN8EusyjDNR4YmjpQGBy3CWJwHdV+Xi1OkvamiR?=
 =?us-ascii?Q?n48/rhXgOFYTn65fAgpxMVtowECx3mOVW4Qa9HAlZQCRmwuabfvf/kPqNFOY?=
 =?us-ascii?Q?+r2TIjfdotZlSta88nEy876jHP8d0zW/5ezgzbu/chMxuMp3/1SlN6wFdTs5?=
 =?us-ascii?Q?q5FArExAPkxWKkI+eyDyHEjm4O9n5c8twFeyT7mpqRcSPaPmP3GEMAhxBSBN?=
 =?us-ascii?Q?eRfVekbHtmoDYOnCJv4yReZ13xqbBGx/LdPOpGX0jIMbALJMETgOgU1JODBI?=
 =?us-ascii?Q?vObnRDUbFg6lPS0N/WGEKNY4souKP2d2P03iMczSn0lk5g0VnpPc5YNp+/ab?=
 =?us-ascii?Q?Fi15xcQmC5hfRgYA/0/cMhYSpLXengwWuVSSgKZh+aoIERafryqd0shHd3cX?=
 =?us-ascii?Q?h0OVoyVjB7d9czOawAW/VA+1+Tm7ITT2fgX9CDAhG5QwwFNznsxi1XacIohk?=
 =?us-ascii?Q?UJRa/T+6GYih4InXZ2Nkejr8UP2gtQTo2dSI67bD8HbW9neL4O6Uxy4gQIwM?=
 =?us-ascii?Q?SgLAp6IBSxTpKn/eCF8MrwHiT9wzldoQd36oj3qdLn73TlAIdRPtxNTXghN5?=
 =?us-ascii?Q?wSG5iOGNBeFVp1o0mh3Vq2A3iyJfClULlVFKv6eHE1Xuml3YAcsQMAMyoWcZ?=
 =?us-ascii?Q?fDvJhRzQEGbnkmBBKG3RaigSPTs9cS2c1rodhQfRver3DGtImqD9FpTU6ZC3?=
 =?us-ascii?Q?dTE2u3PxIW8h+8eZPwFyfUOWN18ege3sPbQ4yVC9looxaX9XKOTr+vXe53nk?=
 =?us-ascii?Q?R4v1MDoD2300F2LDghpC1H0uAYXFt91ONNzOn9hl/h86Cw3VO8d3Q497Hyu+?=
 =?us-ascii?Q?QsZfDB5Dbq4vjlYYS2zn5S+Os+vGVVfP4vd/G23pstVkpElIeLnooG9Ye9Xk?=
 =?us-ascii?Q?0PgIAV5urUXK7tXwm6k0e8QcUR/DvDzRrhWp8Cs338PLPFrrYDIEFyBgLnvc?=
 =?us-ascii?Q?kytNt79oC9b7O4uOQP2WVZaw+QHQa0f2ji6d+jUmaifjCKd2isN0m8ShtmkM?=
 =?us-ascii?Q?XGpkTTDLWa/ox1ZgSiQh7rtF3pQaUgZDsmzmHsffb6Wa+2XMoKzFRy9j2y+B?=
 =?us-ascii?Q?FpMMtnirBt7HXLtA8kSKPTu0Inal0o3jT38b8XeziTuY/QPyv9QEvYp9GUsf?=
 =?us-ascii?Q?PwENBjci+kdslwEB4eIvXXWVSUQKh9id18ILnmH8IXxv7vc6VQxfyceJQ8Oo?=
 =?us-ascii?Q?UVxCQY6a09UhRMsMrthaBmXsjQzp71tjxoCLEHnlPpIXHPy5PN27RgnUakDy?=
 =?us-ascii?Q?BIT4g+4brlOvAGIozaV7zE5vRWYKcQRhhz+CVRrFeoo4UaNr+WgRb56c1H9p?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cefSjs13H0F/vaTIRUn94JN1xfcl0u9zwUH344vlK7LCbqdgCxilR4APevQm8EuJ+aHLj+icpSJkjCUWaklamEymZz+/vpntdAooYAXrCQVblHVrVWNY3cYO26YiTdu/H75g5NM2HOkJNABTDoDibryW7sYo71E3gmqmwTeAwtJmLZGM8+jIvM3x9Z89CrNALBoziU7HSipHGvWuS5L+i7OcLR9MmuWoGKJ7ysxokBXhdQojEi5HN6/q03F7GVz94kYTBpRqlWmz76HYhnnxjkwclJfN8Qz03SCf30aCbHy6HKxGsk3UzpbMQ4cKTiej/NbMDSYkpboP0v2DrLGeIGQKyRRyZ/3JYsEqpu6Z6g35IFGucipJvsF7GIf+Zb5LfOQAAvosNqNQbCoVfk9GL3ah57297tq+8rAZaBqleqJetj1bWtoAGIpvPrdJ3Wchu2fRrrh5qKR3YRzQoc0reBpvfzd0fS5N6KLKMgLuG/nrKM6GFDDmi2fieGLPNZmp3purpZRw5YDDyr3JLJkLgXV6FcWixQRmVczrzn5R7oHiqS0gKywQoIKYHvisIcdPK1W6ZprDTszwjAmMFePhsBeRVWh/4ID0VyuuHmAm/7w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05418e06-188f-4270-797d-08ddb3bbd00d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 07:42:18.7906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPevHFPl6jKI45MMcLBcwbKkMfV9mXA6p+b/4OXlPw9+KsuVIpD/ue1A4XdJ/zjIFwJ67yZvdVWFhcfl5uiohUDoFDJp7LrE8csi7WizfzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4579
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=737 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250055
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685ba85f b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=KeQBsjPbHRlCtW3aKBkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1NiBTYWx0ZWRfX1p2w7DxX9wco D2ycAhCdDdwYWso9h43Vr8bepLwLqKo0IHSW1nUhcYxV2ukVnLj/cU+EZlrUmmk/RsMrGO8qRlT ltzr7xqn5oFGP93G3ct/CBuVV0AdMD+gU1nfVBVkua6dljpGimsjPqRMn0opYCrqczP0bwV0nuY
 tOD5EgVYWl+QO/A4baaKW7NmWVxgIDjPT/iqYYK0GrXKQaD9kTNtpmuqKGm5jfNXm3fZDxVJgCD En/n5S9+Cd+/qbeXxMB9HbpfucWX4Q577yMtQhysD6+ufLnSXGymcEzvP7Yd6h8XhBJrFcRoE76 6RU09Mahfmf7/DZnIg+jJ1OnF/wDWqm+m7a8LKoweR6LEZUSmKgcBt+o2tx/WWXpScNKEhGFsJ7
 y9W4wM/SlSJwSpH/L6EJiJo1kN/7JGq3QZwlbf9iOc7gFvj1C/U/b+mtJFIt0GqUh8vzY3kF
X-Proofpoint-GUID: JvNvpLAO7rCyik-UMRl8YoGnPsSzcKh_
X-Proofpoint-ORIG-GUID: JvNvpLAO7rCyik-UMRl8YoGnPsSzcKh_

On Wed, Jun 25, 2025 at 09:36:53AM +0200, David Hildenbrand wrote:
> On 25.06.25 09:30, Lorenzo Stoakes wrote:
> > I _guarantee_ you that's what nearly everybody except a handful of people will
> > expect.
>
> I know, See my other mail, the problem is rather if there is no somebody
> relying on never+MADV_COLLAPSE from doing the MADV_COLLAPSE-documented
> thing.
>
> It's a mess.

Well now we have an almost philosophical debate - we have different sets of
users, 99% of whom believe the uAPI is X, and 1% of whom believe it is Y.

Now what is the uAPI? What is 'breaking userspace'? :)

Temptation to cc Linus here ;)

>
> (I have the suspicion that Hugh might know of such a user :) )

Speak up Hugh we're all friends here haha ;)

I mean if this really is a problem for real users then I'll concede the point.

Let me reply on other thread...

> > I really really dislike this. 'Deny' is weaker than 'never'. And now we have to
> > add even more complexity to the thing.
>
> See my other mail, for shmem_enabled "deny" is stronger than "never", lol.

OK so we're past the throwing up stage, can I cry now? :P
