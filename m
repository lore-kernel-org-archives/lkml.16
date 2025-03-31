Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F971E32DB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422941; cv=fail; b=UI4ZpBHeAZXjoVek5I8H9QSjlqWPnwPQnNauhH0TB3hq1/ScRTgZ6srVuTYFftUFkbQ/AuhKTBaAc3xUwC6YzsVWVJpwkLQey7EsL+fAsIgqa14INrNysoID+9u4T50Srpc3+IUcGTr/b5/2p1U8qPNNbtBjuq1pPgYtXzwCn0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422941; c=relaxed/simple;
	bh=zZiPnu+PDR1zhC8ytTfEFxqMNVP6w0ct0e7B/AbDl6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=enwjEOP44xdWA7gwtqqDXoBLQ4Tnii2D1QiG/4mQF52fIyjhxrEbUnU/+4/BEs0BvPXUH9N2iq2RaHL3rBFShlaT39YChx6cd+1IXbCBPKrZ3aCHaDenlSwjHvdFIKsIjxvwGOTe2bW1wzTfyNmdFfZ4nl/KCOjg4iCLsEEf62Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UoL1Hczi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jk3x/rCk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UoL1Hczi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jk3x/rCk"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VBu3HH007490;
	Mon, 31 Mar 2025 12:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=+eexP/G3CJuUdRxOY1
	A+0RiwuRiR6hwaNxz4uF32m2g=; b=UoL1Hczil6smFNHoyBdv81AuOrz0lj8dub
	9125a3mzh8copPUG8JyOEJiIZTzSRNdMcRHpE4syoZpRKH7xPDIgqb/8HhWBXDpC
	4DNRjXwIOgrkdxl4DlXvAu88d/oMazp/Jnosmgqs00cgDlNT4tKzXCNUpi9unsi/
	R5E+vteTwUT7jYisLVm44H5KEas3royBOC0kE4gnDn+krEZSgxV6ajZKI6rYss12
	PjIsI4BYw7sgaI/1aOig9AiTPfP+SdIjK7GaWS14fbivBvntc1YjoXPYJ0wpCJbN
	9yFgmEJYj+AvDK3jUNEMzXPNuwBVsL7m0zN8we1XLWu4HjH0errQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8r9b0kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 12:08:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VAOBXq004574;
	Mon, 31 Mar 2025 12:08:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a7jxrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 12:08:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuiBFQflbxte9nsJhcmb/q2tC708zaerAhEbMaY704fPpMCUAMuwHp+pTRdWDro/sG9tfkUCKJ+tgc8hkNHdmLY+7nlr4r48ROpstr7jjcXg0Wq/5sEHUZ0SDYukZUHL9fIqmWl5x85FJ1gKN975A6Joepueuh+IgrEBfrGHn0AM/mdJshDF3vZSF8S6ylNsmcuyEiSieP9YlL4U638VU2r/Ck6v+4kYwzsy/5j/NtvkWcABsmSa0gniENbgj8bMb6TPYTr1+jZcuzaW2Hr6Qugu/u1yQGeq1Le3dk2ztiw6KKvvoZjaCajvKmseXqxRwrDtBBBgI9O/uLojiJaRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eexP/G3CJuUdRxOY1A+0RiwuRiR6hwaNxz4uF32m2g=;
 b=BPZJBjxC3sp9RSU8IpBTbCuVFTRQOiIkGrXj/4pZTyrsRUMPlVhUGXw9mseFjpj1cuyVm5p4mq8MK6XYCt1Rb2mNaBvNOWAYoyrpMXWeSFfl0AdPdhdUxpHcuDY0Qj47Re9qbDY0pVLTADvSHFmjIPCBR9IqD4s71bfEkQnlS/6cAXUDmbyzEA31Jps0f2RJjZbAbFgys7W0jYXv5KUvd5pmseZn+n+sPdcO0MSqLujAwSbzXzZmS+1szeGVrxtbpBkJPT260tMmtBnnHpz7ttb3XDL2mwGweczUBvMdc9uZ/dHUp11/h8ZBjYttn5mzB2aaOQA48CB/7ZWUWR9Iwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eexP/G3CJuUdRxOY1A+0RiwuRiR6hwaNxz4uF32m2g=;
 b=jk3x/rCkqY+cnCQ4168zTcf6HAybiVDA2gvW1o1oqUZwCfb3ast2jsa0TOT/oFfohu3L+y32ZPoV7gb00BRPFBW4d7xG1MRPhgbC6N+yzjGgMOK3GYNpa+dsO771f3NSfTS972RW6QY1JDwNVao6tJb4dp8ILADi/FxsQrtlBig=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8277.namprd10.prod.outlook.com (2603:10b6:208:566::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Mon, 31 Mar
 2025 12:08:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 12:08:46 +0000
Date: Mon, 31 Mar 2025 13:08:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] intel_th: avoid using deprecated page->mapping, index
 fields
Message-ID: <77e9246c-5976-4661-a397-21776db3584e@lucifer.local>
References: <20241203080001.12341-1-lorenzo.stoakes@oracle.com>
 <0fcfc239-19c7-404f-bbc5-70a29ccf6ec0@lucifer.local>
 <87v7tyyrvb.fsf@ubik.fi.intel.com>
 <64514bd2-0271-4b2e-b1f5-a35520fae4ff@lucifer.local>
 <87sep1zw6d.fsf@ubik.fi.intel.com>
 <Z8drzoRVJL3P1jlN@casper.infradead.org>
 <87frityadj.fsf@ubik.fi.intel.com>
 <3a98bce9-7508-4ab5-b2c0-2493d2256c53@lucifer.local>
 <2025033131-surcharge-depict-9b55@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025033131-surcharge-depict-9b55@gregkh>
X-ClientProxiedBy: LO4P265CA0109.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e62b619-eeec-4d21-4e6d-08dd704cc9e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qqCjpiAf7coHdFvn11fL6TBO4bGVl3kugTWmPR+yrfi2WwnEy0wI+X0wI4iT?=
 =?us-ascii?Q?kyutbnJsCRucgGLfpCr22x/f8mfZYdYV7k99ElKhrAFkgTCuNDOlwFQbW0RF?=
 =?us-ascii?Q?1tzfCCv7Sh6agzQz4nBKG0Wn7apoFTbqmc4TDm9X+10Zgw/CsN6OBlRKAxjO?=
 =?us-ascii?Q?D85F96goxAW3f7zfu5EkiuKNuB4oZK1+gkyIfXz0+dcjNpFKWSgRrAKaItgT?=
 =?us-ascii?Q?yNt9S531scztZl3QZv01NKpYlRGUCvfY/I11fHA60X8F9UlTXUGtTig8fxgO?=
 =?us-ascii?Q?dyH3C6EzL/eq8fqqLpQ6gkNd8TSG+QBzMe8UJm4ZIwqki4LK6fGEO2PVms3F?=
 =?us-ascii?Q?dWeWburS1GyGcBLK+3pef178GYj+lPFB6Qh1gAABwbZne3+gfkLSKbLPLGnk?=
 =?us-ascii?Q?QsJFgqqCxoX3+X9R4+R2yFsH5wI/Ao+eDzBhCy6PewIHBJ46FcaKRZYe2ZHd?=
 =?us-ascii?Q?6wY6+VnGmVlPaQVS54HFsEc9SShroOo2BE8L+0d901yKmN06gpMMnOqJ7eVh?=
 =?us-ascii?Q?Iar4xa5JliP8RgVuv+e0t+nBfwogj7P1hGDi/rKXGAVY3/D43PlHmT34GC/F?=
 =?us-ascii?Q?7HeH/YMIYUPnQqjZMYYU4HixgTOc9RJ4W4G/TRflunzoaZZ85d2SXsY4hInx?=
 =?us-ascii?Q?na6dw/5d+3yzCQA/vNohTlu6p1f6bTLAMUHcB+RSKnr8K/KV2kEDmWQAP3by?=
 =?us-ascii?Q?LwkG8DZUg5eUxOkOibmACNbe6OWvQbFASrNDO4czXJRuC0QQm0vjlOsVRmwj?=
 =?us-ascii?Q?6QneG2rL/BsO7li3V3Sc7DP2ORCv25lOo4HVTZPGCQQARBuAk4+o/0wiS0xr?=
 =?us-ascii?Q?FGc65KklRLLdntdlTIFUAcMGJisZEm6LtBIZGiH4HBal97NTtQg9QHyoXPXq?=
 =?us-ascii?Q?PA6P8LwJn1CJa4sTQVknI8zreYazzh3mVJyTKXcPFyySdEvTjDAaPSZLnTCM?=
 =?us-ascii?Q?4zhDcLmm+CfVjmFFfgGafkRaNEweXvcdnvbKA48Y5puLDLLwZ9L2SG7KyZmp?=
 =?us-ascii?Q?6VC7/+EEzggMbJmO/nNbVIYt6pdlQvVbCzsdvKxVWoV1wN3/TXr4veTD1/jW?=
 =?us-ascii?Q?kchhtmJMtzrH2jhTzt08kLqzofcQ9XV/wP7MAF0eparVGvay447Brl7LvPZ7?=
 =?us-ascii?Q?7gPkZeDpnegJ7mXNCIWWY5slmQPwXCXquHLoiQZEmnx8KEBhzwk5g4XWwPzt?=
 =?us-ascii?Q?1ExF+2vQxdxNrS1MvZRYdlrcMSt5WfIXJIBw4XgYn8wamwHNtZY0pLhxN6+4?=
 =?us-ascii?Q?22sR2x5idCZYOZi4HrDNopIjF7ImpTCmMonniufbgK+Kj6zpe0UcJ83HHYjU?=
 =?us-ascii?Q?bWwJf3zwCd1O+e9JFptDT9PiD9I/5P6+ELrJyL4EXFWW8JHkwhZ+5T9cZtSy?=
 =?us-ascii?Q?2VFxm3IE6gfS2B9bpS8a8mKrgTfHvJBh4zJ1Oe2g4+8VRxpODQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ETiO9P+CNHiu3yNfZxHjuGhJWlQe7yMJ+2e8lXjUlU5YYzJOySV+XXGbHp9a?=
 =?us-ascii?Q?jEJtAfxDE5NAU9+fVucq8hmmBY1MySprR7axhbCnHvL09PVHE6IBLpFw77dr?=
 =?us-ascii?Q?D0iKJHlfvjUklhdb7SXdLnaWh9XsM/nqlFXeLVj5hUr2EWHpPNnQh3je1vR2?=
 =?us-ascii?Q?EymD5DSOqfW5AzyV35NEtPeePQxUVsxpEvYC+CyzyPnyPlleUt+7Z+o90olz?=
 =?us-ascii?Q?BINPFwQTCGxUCwWeZXoPtsKfSlIra5D7D0jl7bKTpXvHeqogeBjRmTRrdAXi?=
 =?us-ascii?Q?53dP5n8wFEbWSMxH2+eAq1XSsfK/yYncoQDJpSi44RFtQkaW5WzuIhtlxDaT?=
 =?us-ascii?Q?krpwG/FjxO5WzYBVB8pRaabLlSPSz72OQJZvE/ss5Dxya61S+JNfaxgUD8oH?=
 =?us-ascii?Q?rBRXTdP8bm9GJcimwCmhOCyJ+3fejsmQCW2JESwWZPRlsOklu9u3aRY8VNaM?=
 =?us-ascii?Q?CIm0KqzxNxZi0rI094ev2SUyGWQ795vc0C22lytWfmrsqytt72m4VEOsuO10?=
 =?us-ascii?Q?AAkzSAYc8h3thtwgAz+njDKc4w0oixxpk/THf+Szl/GfLkpUMiQQv6SNwrcX?=
 =?us-ascii?Q?sqXPSK33zA2mXccXYZ+IQ3sF7oWbTfu9+5Ng85+nGcv85KbEBgWomzKEcujo?=
 =?us-ascii?Q?nY8aLQzGMfxcMr5+Z2RprQdOGhtzDCCgH2I7VTaL4cv4VTNNPd1x4w3xt213?=
 =?us-ascii?Q?TlnA/Kp5HcAZGwOTG7brJzv5ijIrMFRGt49Lh2QweEb0Wl/SoUgLSfLTrpcx?=
 =?us-ascii?Q?F9hxLFyGrtHgWv1aduQCa/BG/cE7IiI8a2B1Xry3pI7ICtF8nVgZRUY6qEQK?=
 =?us-ascii?Q?ys4lzainnA7jimDUf8TjygSSnH0sOuR89VUQZuJhLQCHP/DSq1O1Z7wAWITa?=
 =?us-ascii?Q?7lNZvUYUrj/dKZLuBrjZAbTGQqJXdvLn/ndWopY5s54A22Eo8oTVrVFFwzBB?=
 =?us-ascii?Q?/Q1OXb2t5oSAcuVtKfJVsK7IUryhM9yc48+HbKtGGNizbgWv43UU263L1yoT?=
 =?us-ascii?Q?CQdqzWQ0LU7mWf7qp3uqjxfuCapbw5NTVIKqsD3U7V1YGz65Eqq8yCHklmKX?=
 =?us-ascii?Q?LHWw2BZ3mgP5/WyaEf7sCha3yrQncUDGRo/dvFOenQz6yR5/dF9O4gJaAdo4?=
 =?us-ascii?Q?JAVdvXTC2HBW+SBq59lP2GY8RSX1hs67CQsSCNbLoKnRgMFZqEn5b8+izH10?=
 =?us-ascii?Q?6nJBCe5oVg1FfC+qoycTyd+H/bwsQcGZIwD+7sdUqb61IbBAW/RhWaUSRdYJ?=
 =?us-ascii?Q?ntruTjfywb8NXCA8u59Tdq1vjVqJBi/DQ6Adyn2bL6K70MnoBQ/qSdiy0Fy5?=
 =?us-ascii?Q?ciApS/xhT4aCc43iATgFllIsh4gJJ1dVAkjB4ZVgAyyTn44ea0/oseDPMNTl?=
 =?us-ascii?Q?Qyjqj/H0iDXq94mWTfCCO1/ByzpTTGR3QMFcERVHpH9igtDv42Cp7kD52vEc?=
 =?us-ascii?Q?ldlA94xHEKsN3zQYBetIkaR+fHZKLPowILQS1A+axPfdHgStMNUYZYOcIhjT?=
 =?us-ascii?Q?Nosn0IijK8c5ELXS5x2nxM6cMhz9eGnbO8ZXh3A6x2lqdwtbokguyHhi+AiC?=
 =?us-ascii?Q?4lpAxndcnPANnQXNggFfwi7VDjrBcM9X0GEFJW+s/6ej6eK29kJWn6cz/uyZ?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2LAbPGzB+PgrSh7c+8Kg+YOUbzfkruLnT2Mv4VDTjYlBVIAtKA/c2SXLXv/rJT/qbhslAVf1eFRcGYMdSN2oBWCq0j4zLNx9PuTxcMP3vH0vODro/Y0iLv+ZcndeWDElM5nS4K2suOTktff5cMXnuLt652o3R48JNV33eDey2t/CVHzcJgU3MuiOkE+W7teh9QTtUnd/a30OCb8DZS3AthbyrqGry/Z+2reh0BnOu6ap8Xy4g854OULa1XSxBzSYL+pk4D2D6Jle6IpsWbD8G7O9buaJlXQpfo4FKOUZ/K7MR3uFrBQuZB/qo5ufUz/7+I0zF36TN7ihyIRMPJsAFodCjQY74vSt4PUxLa4n+NEDRynVbnEyXmGETWyc3uMgA/J/eLsqIfS7vy69EoEKtNtulJg6kqB/W3Qc59CtgEpyE5YeNeivR56z/aKQ5TrYN++wdOz8kj3VZtcEXbTJLVxG9Ayo3QD5TykcUlqIa8zt1tVyfoIVY/j8HQQDmHhe2uK5/xp/o1VJHjC2zZesp+tGHYX+3lGBAJA6OP8hmng4euhrl80z5IjW+w0nGeh6XojieT82Mxo27gat/T7Uy2zrXDt/2tyuIffzI1DmyOw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e62b619-eeec-4d21-4e6d-08dd704cc9e4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 12:08:46.4145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: te3f8BFoKqeTGg3l/CI3o8nQSKIeevuN1XDA/pA/JbGAdHI104swuvb4EAho0wJG6AnbmSv2dwHn9TdvV8Lbl+HK5N/Ly4JVlbYhiXkf+p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8277
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310086
X-Proofpoint-GUID: mxTYrZM3kBG76cKm1OmLI6DVgUpzbD_4
X-Proofpoint-ORIG-GUID: mxTYrZM3kBG76cKm1OmLI6DVgUpzbD_4

On Mon, Mar 31, 2025 at 02:01:38PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Mar 31, 2025 at 12:59:36PM +0100, Lorenzo Stoakes wrote:
> > +cc Greg
> >
> > On Mon, Mar 31, 2025 at 09:36:40AM +0300, Alexander Shishkin wrote:
> > > Matthew Wilcox <willy@infradead.org> writes:
> > >
> > > > On Wed, Jan 29, 2025 at 01:39:06PM +0200, Alexander Shishkin wrote:
> > > >> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> > > >>
> > > >> > Thanks very much! Yeah just keen to get this in as we are moving towards
> > > >> > removing these fields very soon.
> > > >>
> > > >> My understanding is that this is a part of larger effort to reduce
> > > >> struct page to 8 bytes and an optionally dynamically allocated slightly
> > > >> larger structure, is that correct? Just curious.
> > > >>
> > > >> > Could you take this in your tree? I think that'd work best.
> > > >>
> > > >> Sure, will do.
> > > >
> > > > Hi, this doesn't appear to be in linux-next yet.  Could you confirm it's
> > > > scheduled to hit the next merge window?
> > >
> > > Yes, I'll send it to Greg once -rc1 is tagged.
> >
> > Right, is this ultimately handled in Greg's PR? Did you not send to him
> > ready for the merge window?
> >
> > Or did you? I'm confused.
>
> I don't see it in my tree right now, is it in linux-next?  Nope, don't
> see it there either :(

Yup... we did ask about this, quite a few times :)

Can you take direct, if you typically handle these from Alex?

>
> > We do really need this merged for 6.15, can we make sure this actually
> > lands? You did confirm it'd go in 2 months ago, and the patch was sent 4
> > months ago, and we have been chasing this repeatedly.
> >
> > For reference, patch is [0].
> >
> > [0]: https://lore.kernel.org/all/20241203080001.12341-1-lorenzo.stoakes@oracle.com/
>
> What changes in 6.15 to require this then?  If it's a bugfix for older
> kernels too, why isn't it tagged for stable inclusion as well?

We're removing page->mapping, index, not required for stable inclusion. This is
a hold-up to a critical mm change, once of many such changes.

We have confirmation from Alex this is fine and he agreed to send in _this_
merge window well in advance of it [1].

So I don't think there's any reason not to send, it's just for whatever reason
not happened...

[1]: https://lore.kernel.org/all/87v7tyyrvb.fsf@ubik.fi.intel.com/

>
> thanks,
>
> greg k-h

Thanks, Lorenzo
