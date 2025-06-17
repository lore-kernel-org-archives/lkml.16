Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C39F290083
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150278; cv=fail; b=L2hTbhtF4OBteM3GAtZv3pbqwgj6ye6BovOQiKgX6K7u+Hoe2bv+DZjU8JAimkPFb3ItVI7PKiEvvd1zDegOptLUfupuPumZm8Jk/p17zge4xw5lacuXmq2UtEhBD1I4O8LIwg8PeU6EGP3F4DK58TfCuEx11fZ6Wvu5HJfvJ0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150278; c=relaxed/simple;
	bh=+64WjNepvRz1ivi4KCkbHYLchh+21CA2zu8Ye+MotxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ea0xWv9BFrLVYlIXBK8iGoGFn5Y1gRTTRX0u0D8AbnpnJsXN6pYSJHfZjc/c/y0l6OwUbph7sYVMmWkFNBJsKjMLwaT/NBHU1T2I4Gxow64+aWtEVCmu6NZZrrbk/R7N5bGvmf2X4oelje2glz8npLzMaY1v2otE+34im/vMTmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PeNAi+w/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ygPiX+Bv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PeNAi+w/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ygPiX+Bv"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7tYSf028106;
	Tue, 17 Jun 2025 08:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EzesMGX2TjGD6UGTj9
	xEdP9W30O7eHx2cp1wO0c5iEA=; b=PeNAi+w/8KogafGkVozMg93oSL4SmjmhUt
	15scYVAQwRteD97VKaH0MLPqcIyAJIZVnS5dcE1y8l1R4n2ytY2CnrI6KF3+CpGQ
	43IqFkO8Xk9ghDzxlWC1x7CaItSuSvCk9+P86sOhEUlDotu95sS7cTwKazB4dwbV
	pxBuwMPd3FYd3LbtxQtOIjFi1SNe8tGPOvBHADQMNnx1vbJXXmbmyh24e4Fq5qvZ
	Z5qyIH7ersQ9JKtjkestZRFb//vNcNlT+KM5VJAXs1xJ4gAACThDmDmkqrSNdHE+
	tCdZ442Hc3achPOadYudflrmFbdBhz3Pwz0OfSRbd72aSgfPrMVA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900evwfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:50:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8RkQK036274;
	Tue, 17 Jun 2025 08:50:55 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhff4cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFl8ENiqN2dIT6RHxaNm5SrjBy0bWmr7iIGUfm/mpymHBE2YLCHR/quh66ZmcFfpf2+L5oTk65U+Hu+16y+6t1Pb5XCKYASzWmBBr4WFmpKJ9ipSsk3VI9sb6NrUhmLfzyzXqTpkZfoweWL82szLLKPGGfmhjO9H63Rg1kSy4STbGo39nHiP/4/hLylfDwISDK1giQ3tB0Z74vdPSnYxO+oiwOX8HSH14R60wG15XUlE1zqqrNQx5dWrx84RQqSGmKW8ap/xXcdC2SdhBMW+J/VBnnkM8NAebmfUOVuE0JFp1UXLmUwswkPiw49iGDm5tCcfWrNAHP2zlHdLX2zstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzesMGX2TjGD6UGTj9xEdP9W30O7eHx2cp1wO0c5iEA=;
 b=hKFUVc3kvLsle6QlVoOf0rWYddQd/1bC1YxcIF2vtmCxA4npgDvmTd491WTH1sN7gl3onycWTOGcznTdEncfz8Bo9LtzweGzcjYl2TIrcp4OWluzdtOyAMvajObYTtYEpc6couv5jNZPbZrgj8BIMbpFXbmUqWpd5Ue/LtUiFepAbW20ndYlHkzpDmOEg+bjJQed55iQWiGwqHPBpBEAWeqHcbKFe0M4k4T/U6QvO4Z1FR+r0qyH/D9ZJFRCOv8fwjWr0AKTBJbit9WpwUx2IZrzFgB2P98tUyFhWjTnCevqRrNju3IAtImtBOl1JIFrkakAUOFIEcpTgKEAYdi9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzesMGX2TjGD6UGTj9xEdP9W30O7eHx2cp1wO0c5iEA=;
 b=ygPiX+Bv3LHXX4CROAkgyLtzeA1uYfipg8eHg5W09Zv+bSK0yVOKii1CaqAo44LMmCtfSCG+AAD5PYySaK8d4WFQvX/nVhGcYfBMKEseszf00ynNdmomfUfFEqi8gqs1FqeknVAAcIKyH4cS7U79cK8LFD7kRBKFJTaf4oocDt8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7455.namprd10.prod.outlook.com (2603:10b6:8:161::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 08:50:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 08:50:53 +0000
Date: Tue, 17 Jun 2025 09:50:51 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
        21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Message-ID: <8aa7932b-e30d-4025-8503-726e01bd7539@lucifer.local>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
 <e61a7aea-a87a-441f-809c-10acdfb82df4@lucifer.local>
 <f0a867eb-c66d-476d-8391-f8a4e9968c75@redhat.com>
 <9e80cea5-fa78-46a2-b2bd-2f3846c24a34@lucifer.local>
 <e174d4ae-9467-4fd7-906a-d575802aaecf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e174d4ae-9467-4fd7-906a-d575802aaecf@redhat.com>
X-ClientProxiedBy: LO4P123CA0649.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: e9066b15-5f60-4307-dbd8-08ddad7c1117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LgBtZdsiBBvkAzdbgz6Rjdc/1Yt73oJPNCiWc7h2ony8cLtBxqrcTBStCzZG?=
 =?us-ascii?Q?mBVoI2QznNi3tRL/m0HmI8sISYfGsPkbWgf3e01qHOwK5o+ftXlAFp8xySXz?=
 =?us-ascii?Q?o4p4JvxSmZIg8e+zHBD3mOoJjJF16+5VMFl4HpOl7SBd824j69BM+G0Dv9Pi?=
 =?us-ascii?Q?5gWCU/y2gr6Gi38NnzQmJsxmep+tp9BCQKykVW9drsJbHAz4Afrp0wHaRi0I?=
 =?us-ascii?Q?4jTaG/yC03R3DFDv/KJ+5C89R86mR2A0uLur5xulr38sx03s+ZeirTx/LIDx?=
 =?us-ascii?Q?4Kq/WcMqCZvDtTBUQ22H7z0nR+GjRrZYpfwo37Y+1bAj5+JnYc2/0/TmwYho?=
 =?us-ascii?Q?btRyKV8eLXNE0jx1D8puQMLTk9vDli965B3uaHuSjqda+5zi6L8Gx/mU9OLi?=
 =?us-ascii?Q?HypxnDiPh5oCOUSiI4oMT0iQNENL2jeu49qdw0B7sTjZPLifkncw8vGGeq/G?=
 =?us-ascii?Q?yFXcrT+uQ3soJfifz4CzkFTgxJp1MwgG0LNOWqD4J2M7XGOfAVf2QD18VR6i?=
 =?us-ascii?Q?sKkHUqDJpBWY9CHioYODZE6kJV7LBAgpqKKzjpqbJq/mNTBCELFNjhgka8T2?=
 =?us-ascii?Q?ADqrPr4S3QBO8UClJaWx71ONPwNKmLud13u4dkXNNrfACQ8bv10AQS5gwwih?=
 =?us-ascii?Q?tfROPWk1/h4gBVYDNrEnUU65PaGjJzhcDusgOt4jRTVYQle9e3+jKru/Krgu?=
 =?us-ascii?Q?L19GN+ooDtwzbyqJ44ma2AhiWtWl5KzN1xy7knS4IpzBihRzFIM5qgBDYp2p?=
 =?us-ascii?Q?jqF34Us0OZ4yAQ68/uJcP4I35rLr8H9/DKAKR2zASF/wA9KYDtBskwGVslxe?=
 =?us-ascii?Q?A03AEo0B8OWXKRGwcjFhU0A12R45sdd0NlkeB5KQOCgy8t9YGYqB6FpzakhQ?=
 =?us-ascii?Q?93n56DiGRFHx7kkt1/+y7FyBBCAIhB/lgy+tel5XoHfxB7c0gdTtVc/m0Jyc?=
 =?us-ascii?Q?F+cthiNIZWzk3G2LAx7OGDs46cV0i5N9ojY9Sb0pXKhP0r9VkIDWYWEzYMMA?=
 =?us-ascii?Q?kzWprSjOn15QSRf1JInde7hw4JwjzqwGifad1T3Mqaib0rO3t2GKp020ABn6?=
 =?us-ascii?Q?yX9ovFXrWL2qnkJdjidLBHiZQ/24gW/hpMICZOxirCsQuE765XXHeR4qT2A3?=
 =?us-ascii?Q?juL0IXFWNcuGQwijJQL4rVIolPlXoT6hmsQ7rUJWwyh/nKdRFm7YJHycLzb0?=
 =?us-ascii?Q?2jCA1jZIfHyl0E0P8HD4csf6voabc7C0DB46MqwEZAA/nDEo4CrxeUL1uW16?=
 =?us-ascii?Q?M/mw9OP/yeBzG2LPxkuB0wNDNowbEWxuILFS2rewA9Ic+7GevF9zTIgy4D9M?=
 =?us-ascii?Q?cwuFN1ZQo/jdEYTXgGtUPfMcrybXne0fccAIENGiKJ/hPNltZiTwK4CX4Nq5?=
 =?us-ascii?Q?lohKowRNp0qZinv/4KRwyE8FpZwZCATfMEOPp/L6bXvezk/P6Q/E+FZodgcS?=
 =?us-ascii?Q?8V+P0N6U92I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOU5vkCRaqFqDfxo3lJ373K2vubScCoFHsRsy095lvFITqWA3e+6Z63BfGJd?=
 =?us-ascii?Q?1VxJQXmYVRU7KlhZxH9VgvDfo4G3FJV5L8FrOn80sG4jobUPVc7rW4y4QmdF?=
 =?us-ascii?Q?P7TnGk0cAnm1ccc24Y8zBoBK+nSiUKf6Hk02zxIy3w3CAGfvev44OcQg6f/D?=
 =?us-ascii?Q?i9TPgASHGI6GCTTx2xIoD2MAMNEzihAJGPYcvQ7Os2T8Xc6+FQW/Bsxj02nV?=
 =?us-ascii?Q?vQoyLObUSRQRpNgZkx2ppdApcMvW0scaKe4i4FlQ7PhU/HBHBk1xCBbnpOVh?=
 =?us-ascii?Q?mp8z5mNNh5Tpfc2U3YcFCIsojfV1EWQ7bBAA1hrHGmbIguS/6W1dcJNzW1Io?=
 =?us-ascii?Q?WIaH/CyjEZSmGGTJhZMz4ncd9QE4eqvuCAoZVL4jtH4lR6JPF/d/7HzJZ85S?=
 =?us-ascii?Q?fF1UFjXIZCQDGQWUJ4Rsb57fySYv3M3SRuZAwZ8HMdabcyKmxfGAxnemFO3M?=
 =?us-ascii?Q?sWKko5hxpeAzceZPVygcedk3NoVuDFYpqZsv79cEtz1VCXed6Oc3IytKLg06?=
 =?us-ascii?Q?t5XQF4LD0xkYhg0sImNtXCTiPjhAqPNvc8OcLNG0BXvPrlR5Xv8atYH3eukM?=
 =?us-ascii?Q?vRdeBOc6IddBC2qIrpYq/J21ElmD2huZ4bYFfsxcMPtb+ax0kwWVO7Ta0VHV?=
 =?us-ascii?Q?lG5TgI/GGzYAzHIkTGVzjrVc9RsFeXowAIpy6Oy1moDoOVTCjrXZhO2xsHAg?=
 =?us-ascii?Q?vbFkmMBHhD/gKj8mNuRUSczVWCtZeLbe0URuguHBHEjkvyuVmjJeL/RhfoZ/?=
 =?us-ascii?Q?XhrP4tY3AtTaVP2rHtfd9lRy1V/TtKUyYk14ozqCJ8xBkJ/Odk16JrUjCtY2?=
 =?us-ascii?Q?Kyx82cglLmy0uR3b17nvPFNz4wuYdar2u3qJF783PznjyBCRxNCVw51LJ+bp?=
 =?us-ascii?Q?S3vMAWZgEUva9dnrFk2L1UwdzeDIkSX9fwuw7qRrw55rT9cL/9n8LRmT7aW4?=
 =?us-ascii?Q?oYFbKGKGyKnD9/NL5h2ESPV3jI5RjlChzLgjTn93Lw8voujTnAvoaV7s9POL?=
 =?us-ascii?Q?w+4LQ2SCzs2XqFVNOtkG5m6EkPPy7rd5EqNgF/qcamQfowanV9ana2cw2Vet?=
 =?us-ascii?Q?cHMmX2BhS8cwJnSCyp4AFBLsA5/oCzL4c3O5aDQiHmxb+Pj16z5EambL6g5T?=
 =?us-ascii?Q?aJucK0qotQ0ruKKA+0S1nuKdtPdeC6SRSKcsJqPY1JbFdfvJbaZt4I4nEoWJ?=
 =?us-ascii?Q?rVkbGMbuOj6iK7Jx8ZuvTcCs6fL4GotV7YfmValm5/AhvFdVf6Ntg2Dht7v6?=
 =?us-ascii?Q?R5RjXhqKoIil79X5XP9qmTFCGowF1v1HmnhwyF4QPTG6q9sou+4yupWQEJsD?=
 =?us-ascii?Q?zFYK+ATzACRup3CMOJZbXtpIIw923AlPUwIQvpTSu8SiXDHHlDJgbvWH+4rh?=
 =?us-ascii?Q?VPh8251bunvuedT8zeTzLYHeQ3DEWz3C6wUWwkWbUP7JYop2LMuh+HAaoXBp?=
 =?us-ascii?Q?wmy2dh7NRkGZtySRUW0g6Kii94aZ+Ab8TxMGuZTm4fzL0bh/C2H/cjL8xxdn?=
 =?us-ascii?Q?7I1dKU6Dyi5h2Rj+TK+bktVHoSMdcKrgvisDhnnQZo+bm1QJVY5++aKegvh1?=
 =?us-ascii?Q?SMmYsuBGollBkdzWKoe+gIeJxKnosjJOBICxUQGGML5cA5cBfl+0eKtFwLxy?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	te1p6GAaH9+EPmIC3k5v7HtIsmwjwMqf2E45DwUeuqEZMombKHQ2Res5x1CJhUkSaP7wciNNwpQ9DX2DnsfkYxc8epxdpi8hTQKE2iSNN742YlMVO6Yng4UJ1PjsfFlO3Fw5C8CsVbsdlkGaYUpXTsYL7LEj2t5ylPetuu8fII7glNBRRfGZaMCeZRsQeoNv/kwWERYnw2tJXH+S9c+nEAO4Z7OmWNCtxSkSuiLN8h+YDMsbN6J72bLWOMv0okB0Xcda2/TWsPpwFCyAS14eXjF9ggKWBgKDJoHhd4QnngrpmxLi6VoEZTfleGJ1aKos2/3dJcgKC0bb0AcQ0n2jJLZhAs1QLBsh8dQsBsRleN+ac291QcX273Vg+00egz7rd1LJw8v/+g2PgMFJYs5RK+LnaM5/kEI2gqiXRkpvkSAiYE4TfNEGi8/JwXKZOrBcb+LluPPz5EadVNFDDzr7S0sRk75XpSuvCL1VV1BvgGD1kqbPKIGwdODSrTTC9Z06r+dV8ZTX/9n99matzor2d33Tw9FVPfGYjcHAOXuv+Xrb1opsY1HozWeNE3M61OmE4Md96BDvxLWQWJJkta0MCWcpUImiOc3Xu3ah6GLjIrs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9066b15-5f60-4307-dbd8-08ddad7c1117
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:50:53.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46SY3g6angK3VgjgF+FLU3ICztvYDtzj9gHXwVRYps80inmq20uvJusXmY/We9+KXS+stdhamqJ7hk7y5xoDplkCwL7UTPaGNQkg9x6Mr60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=899 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MSBTYWx0ZWRfX8COgMxORHk9T kcR4lHtEu2I5pHvYF8/8Da7pCaiTw4xmwL4eR//Q8KQdVm/9EtShK8QlXOqEDpdss/TejtD/qjb NX6S43XjDlNDie/wg7R2JSQd968O7YLsSuQp6bWEsvJumsYQemaWnBjcQ6EBEMDtKDq/JpYoHmB
 PBagiyXMB1Bvzd0JQkX+LYOuAnblst4B9HmOCSUyD/LWKHsbuIViGzOfQjDmB0uvrjBuFjsTdRU gJM+qyKPAUTTFGmVeVPNfzvggHB1DFOXLMi10cvA5+mbckAzXcW2zPOt3ERe6Qv9h0w6PHhh9bG w859Qquz4IuE1VOCRvGxWycfqnXp5xv9z7U00Y+x3LjT24qVSyX2PGPTB9HwHsJy6YlzX+ywQeD
 rAxpJDs4MEeNBuSi6wrsRfCeKhwfPLTKHlxjnbqbQcXDPhVcKqpXHvG4aF/iy/VMsmcj36rB
X-Proofpoint-ORIG-GUID: AGVwimieNu4vfQ8SWH4qHYP9ik3_BoHG
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68512c71 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=yIOh4j67iJqAcC_1vu0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: AGVwimieNu4vfQ8SWH4qHYP9ik3_BoHG

On Tue, Jun 17, 2025 at 10:38:07AM +0200, David Hildenbrand wrote:
> > > > > 	vma = vma_modify_flags_name(&vmi, *prev, ...
> > > > >
> > > > > We should use Fixes: then.
> > > >
> > > > So no we shouldn't...
> > > >
> > > > >
> > > > >
> > > > > Acked-by: David Hildenbrand <david@redhat.com>
> > > >
> > > > Sure? :)
> > >
> > > Unless I am missing something important, yes :)
> >
> > This solution isn't correct as prev == NULL when prev != NULL is wholly
> > incorrect.
>
> I am not able to understand what you mean :)
>
> I assume you mean, that we reach a point down in the callchain, where "prev"
> is supposed to be set to something proper, but it would be "NULL".

I mean if you tell merge code 'hey the previous VMA is NULL' (same thing as
saying 'hey this is the first VMA in the address space) and it isn't, bad things
will happen (TM).

>
> That would indeed require a different fix.

Yes this patch is wrong, sorry.

>
> I wonder why we didn't trigger this case so far?

It's because it only happens since Barry's per-VMA lock logic...

	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
		vma = try_vma_read_lock(mm, madv_behavior, start, end);
		if (vma) {
			error = visit(vma, &prev, start, end, arg);
			vma_end_read(vma);
			return error;
		}
	}

Otherwise, we look up the find_vma_prev():

	vma = find_vma_prev(mm, start, &prev);

In madvise_dontneed_free() we always set *prev = vma _first_.

Let me suggest the better fix to Lance higher in thread so he sees :)

Not sure if a fixes is valid here given this isn't mainline yet, more so this
should be squashed with barry's series?

>
> --
> Cheers,
>
> David / dhildenb
>
>
