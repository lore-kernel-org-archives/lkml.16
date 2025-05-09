Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C92277003
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780245; cv=fail; b=ieBZnEL5hds3Lia8YXObgoEPVfygzgjzLzJg+VlIuC229lMVS4Vvyv2aNJY/KOr66RRYodvV9SWnXGEeAas06+q+c6yUZNKZoKMK/+akWZGCSfH7mPCteTQsYv3lNS4SfYfHJrwU3mdAXyLLXIaXPJUe0piHHQIXCnrFv1Jq6ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780245; c=relaxed/simple;
	bh=p/LKoTv50EDKJ7fNfclucW+GEoGhksBmg0CdWMXI/XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f7SdnQup2qVwY4pMdvpefKD0y0qi2tTHhAoCaQ/qBhEQh/eurgFiEidZ+YGxLMXTW6PvlknqA5ZCXJ4fELI/VyEbdioHYzOQ7+GUAYqdZfpvDS8DBTZeObPcJLOmEps+Pu2ruGLiQB4msO2CnJxDlzgZ1MrpSf/Ky5Jz3KzELfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IxbgmLPS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xDeWktgF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IxbgmLPS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xDeWktgF"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5498M8DJ005480;
	Fri, 9 May 2025 08:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=p/LKoTv50EDKJ7fNfc
	lucW+GEoGhksBmg0CdWMXI/XU=; b=IxbgmLPSJkMa+vleix/09tTxVjlPaAyjvV
	63k3HA26hgFaD/w+BgLg1q/6PIaYH6XLQutzjuRNMgs80RZfPwh7fKudT1DCqjhP
	dUanZMVa5dpvjpqj+pjuU5OPGq/k7cURHIOSUIVmZEHDEQBgVqE4hRbhabRpzb5Y
	dl56xRt/Yyha14lkIKDmnMLlmv0gR/4ymM7sxvu54sFnrJ8r+BGFZR/2enVGnwcW
	puz0B7TVVt7GOq9bPiCjAl3yUpWtClzLBRLlVtz9V6M7XJhwjHiFkHr6HB+vD4gw
	VZQooXWXPnXWY4C2j7soFKUV/mjORQ77omphR5uueiz711+rOH0A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46he4qg221-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 May 2025 08:43:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5498ZMQF038324;
	Fri, 9 May 2025 08:43:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcfyjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 May 2025 08:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3oyP/pI7p+GvNlh18GsJqDaEiXNEw1MjffldaYhrDejmhqTi2zgAWP8u3DdccgQwHG+arTa2Z/aBRjySEDFt6c2326dtZnzzc0kIxcx0VhGq5sztCb5mRj3lH+rg+CSBC1+R6zyMi05IF/ZNq6043/ZS16+I7i+iAR4XV5+wR8MiYotlYVAF+C764Gz+D3mqB8TNn4U+M7t5/eDBpEPlzMsYc/H8IAVsis0oJVYCSDfJ+3ITskBDKOncUoyOjZEi4Rf0CpA3P/ggPS4pUFz0QJBqCcNoOYVP/TT07s2c/0A2H59gcAW9CBY0EILeXURFJ4PhwiouaRHFRp5LNhxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/LKoTv50EDKJ7fNfclucW+GEoGhksBmg0CdWMXI/XU=;
 b=EkgKLlRWV7DLREcNiWBqoO7a/Fu+uEPJenVnQiKIpURPmQjqHhc+CJ2qWivK/NhZiAt8R7ZeNe3cFcX8BbVxWPz4pm5mw1KYpHFCaAiLbqf3j5729ijyJ3j/dICCOeDG8R3YVN6lBRBT+n269pDidz5T8r/r/T4NfHRyTELu9A1vyEQSfS3SPwr65pltcz32cG8E4wuQ/8fylajFNbVBBa8FOXybblfsU07Udj+CRWlS/nLdK80n082eYgGjZsdzsBl2gVPLSa57DzG5rgPiinKnGG9+qvMKh6Ym6MzMchF7H0DI2wQGaJ/cqSVgtDKguFVRkz2fJ995zbzoYV0ATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/LKoTv50EDKJ7fNfclucW+GEoGhksBmg0CdWMXI/XU=;
 b=xDeWktgFX42XB86gnK8vFzn7ARmqRvRJvkWI2giHjxRWRlFcTZq5brBljJCqWj8s0hyEIUi/NkwZpcep7aSTPm9L9IqvD3w7HDgsKYztRRxaBK2zX4UQ96ZmxxGOTK3wqglnNbvvthc3cuBhKv8Bw39IhPBByCbISsUDXSshzq0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6091.namprd10.prod.outlook.com (2603:10b6:208:3b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 08:43:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Fri, 9 May 2025
 08:43:28 +0000
Date: Fri, 9 May 2025 09:43:23 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
Message-ID: <0ce7ee4a-b731-4d3e-8eb6-b3dc0c0606af@lucifer.local>
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
 <mhnz33dwwd3npj2re7dn7invntzk6dk7u75ue2pzg35vdappjd@tgqlccmoydar>
 <7d214c08-56ef-45c7-9ba3-18d7e4691efd@redhat.com>
 <20250509053248.GA606476@cmpxchg.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509053248.GA606476@cmpxchg.org>
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce2fec1-7786-4e88-ec5f-08dd8ed591e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Wwms0JCJjxe6rRpZE8zvteLCYe+p320y5wJKEwNCxIt7e+sypFRYHYyjC3i?=
 =?us-ascii?Q?kNppF9sOhcziA18Nn+CQNl1JLK4miHrV23T7aFXQV1r9NIGd955P4kLROrVV?=
 =?us-ascii?Q?OdkfCPx2kFSBOYWUKllgYJ3ZlJmztlN6uHslEUQ4/pmxazh59eFJaDq0Lfmz?=
 =?us-ascii?Q?P2iS3tfMNjgVjIKiSTU2GuI2eWEv0SedJPv6JBgGIr8uuiKOCf7nmXlTvn+Q?=
 =?us-ascii?Q?Ii2S5QRJNqfw0KBpe7q4xc0FwR3jidQKvxiAVVR6CTNfw/hbTlPvoyo6Y5sX?=
 =?us-ascii?Q?HDIZMtLJoI/gD0C//oVaDb1DLTATUb00m0/4hbeeLxh9KJn1TX1krHStHlfE?=
 =?us-ascii?Q?VaB9X/+KIUIPXayytlzaD0vYw7w+XPFIjNOV4LUzNPuIc7WAfrttWMwKDHbF?=
 =?us-ascii?Q?byimaf+d+DUZ+tmbjW3nNs1FQwLBmN+fHfQKzb2GtCYhbeXfNZ2RxsK+hy6W?=
 =?us-ascii?Q?Cs35wMdBzR2NSBsz2nC1QbGhgPR3JmwhhkXBW5MQ+igg9WpFX7Gr9+ULWy8a?=
 =?us-ascii?Q?PYuSXGnzBmbyfLOc+ZhY790Bba8gW4e1G/iELCQDLhOxctrDz4ZP8NRix5Fv?=
 =?us-ascii?Q?96theMQd7tg7YRlYS9xi/pTp9AYJqvZpTrVmcBAy0PwAWlwBeXK+69lgmO0o?=
 =?us-ascii?Q?vjigfSUAl8vjLONI1ppK53Fah9a9bzLtZQp4R2sGQL6hDz7Tr5qXJyH/32pY?=
 =?us-ascii?Q?XDadfJEM1ws3MNqIRZ/fH+OT97VltmQcq5bUUilVyH15C0eOikTq2G4TVGyr?=
 =?us-ascii?Q?pe/pXHl0kx+1SVtcKW/hO+9H0Rw1E0gnHBp/YJbiiR7HwVw6/JLsKoRUMm8s?=
 =?us-ascii?Q?DH1fBikmVtJibSbPd14s7Ji1P7skecJZW05JO5b20aV3YSGPnBvWGHfczA7/?=
 =?us-ascii?Q?6e+dSkQZaxbEIMu2a90usmQuKLwlao4LsrdLvtWw0R+BLO7MQU42P739ePaI?=
 =?us-ascii?Q?uXHlAeO2wNYv5ajbcwO07EqrefFSb0vf23APVDbvRUYpWXbnEo7UDNbtkbZ+?=
 =?us-ascii?Q?TV3v+j8LL1IOC8TaL1BqMK8VZ0Rgy2heVzG7miwjDBZn4hN9x2Ax1S/NI8A8?=
 =?us-ascii?Q?o2qyEhLTe/XRw6/NsWryDyJssn30e5PR7asvEO9Cb76KSufc7ttaf58IrJ4M?=
 =?us-ascii?Q?cmaB3pM8LtEDLvsPkHVBzK1cN8BL7v9T78wqtP2COxkg748fktG/tji9N5tm?=
 =?us-ascii?Q?nt7Vw8rGD8MQY3+TMho1FWqJPz3yYpVrtSisvc0AReiXF5HeibIPoLP33Clc?=
 =?us-ascii?Q?5nIy9R4Q/kReSwvJm02odJC8BXBox/rKu6CxTw9e2rmfZKfLR1i4T7IGlQVF?=
 =?us-ascii?Q?N2L4mTs+FO115cyhoIqDz6jwRxJiY2qIN1C8QJ8SqBacZWfoe0vZy0bg13nR?=
 =?us-ascii?Q?V5EFci6gliCF6IABRcbCZwzCKsqexPyyPfwwqmOEFe/BF2TjGBcyZO3Lbvte?=
 =?us-ascii?Q?3xEANLMFtMo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AWEmZdpzYVPqzzlVvclEUasU/Ut83XcQ3LzQ3FyC2+B2V/10GKlXScCchqQh?=
 =?us-ascii?Q?3YsTg/r32jYAGhltDngahCMrCsEi/iWPaq9We6MFZM9T3qUWth9MEY+mkqqw?=
 =?us-ascii?Q?+oOzeZ/tEwMJDnc8loAPq2EwXm2byczrNB9k1cUu64lSRSw5eThKtR+LxxhV?=
 =?us-ascii?Q?+Hdj2zqvA7Zam+/E7fLXnjjDM2utE3QIPUyCIf5Co87cYubHcAyYu4iEd2uo?=
 =?us-ascii?Q?8qNMFv7LvQW6oNtw82xTDbnTUn2QVsd4qwF3jDFME8NlAglC82EQ2UYdwM72?=
 =?us-ascii?Q?D8BLta/pv7wlwjJ/bDrcLiXorcMl0ZjBDu0BIzKmXfEbH16C8nj54r9sMl7F?=
 =?us-ascii?Q?nKbRY5Gh8/su2XVGjshyWJZtb+hwChnigxXUnTPEkn2c4tbkBuISvu2JNiRK?=
 =?us-ascii?Q?UyjvynZ25PWaUZBsAvPLXULrcx7wZUV/zheKTZSlOK8waljJ6xzTg+POVvt7?=
 =?us-ascii?Q?uaC+RI8lHADIpIAHD4COoN1hc6jEpbMFsJxj7iGKUx4Dh65jqJRhJPdp0MMl?=
 =?us-ascii?Q?+TxgcTcZJdcStERXK3SsuBPtruxhAPZn1lLyOSFEiP7UlzE3S0LWzVu+Y3a6?=
 =?us-ascii?Q?RZxhj+gkTHt2rId9B2mWgpYThxgmW9Q1Wn+sVR3w08uakPSPxH9Ed7ipsARr?=
 =?us-ascii?Q?4IYSxfn8J/3a1zKdWz68IA8d8UFeai1BfpTn17hRbjZF1Ye2tkI6KJW5Yd7g?=
 =?us-ascii?Q?NDy23JiY9Pr/2mb51Bq5Cmht0AhK4FPTrwQf96QfJq9qKDuY4nhrTbRvMQGK?=
 =?us-ascii?Q?zIrKYLSQ4c7MBp47cL1hobk8Vb7hbcmquRmAPJtTAREl5P8ru+uVDd82/8YL?=
 =?us-ascii?Q?8zmUiieYfK4hitBMMqG/UjAta1ZUzuCPz9q3yq8pN/RxTgSQ+qb1Oqa43O7y?=
 =?us-ascii?Q?15Eu25k98cxUARqfuaiLEViG9CNcnA8wdRJG5hgbSJ/+aVBpN+0+lDJAJWaX?=
 =?us-ascii?Q?Fb0EgYq2aEQlUNezPSXAZ9I5sGOLScvdbselR06AJXerrIAGHv8yNSGxoLze?=
 =?us-ascii?Q?4DFTjJiEe7pgQCZmkOGRpWgCwFcHdztJg5otjyZ4PdbeXH0Rc0BaX7pQNqDL?=
 =?us-ascii?Q?lPCkPZ8SV4VYr66/XDoShD9ad72KSeiL6CbOKZtSRP7YJtZY7UHiUYAjcaFl?=
 =?us-ascii?Q?D+AWxs2ZXFgK+632DJj81bRkSbhwWo261lMsau5Za8GrsBuULCpagDyoy8Ix?=
 =?us-ascii?Q?GjmEIK9s4DTNxQEDHgE91M2JOr6n5Q9DVI9/6ja8LCro8YfK/RJyml6cb3rD?=
 =?us-ascii?Q?D87IfX8BbvcTTkvXpAbHdIyyQGRuHN2BS1Y+PyAAEp7DpG2L+kZwCAPfXICi?=
 =?us-ascii?Q?84wnhMgeotCKXHXr245jyRlbcNGYnFVfBBLAtbrREqSsA8Eeq84Gi6CjCW9N?=
 =?us-ascii?Q?YlOsfvJjK2MLXiHkv9+zauz3xyu6AhG0/01nyVsQv1R1NC57DJ4uJf60YIyZ?=
 =?us-ascii?Q?mwrMdJ0LuRlQ9RbKFu9Jq0civ//5g35UKpC4a67zavdKWj2vJSBtKnPAOCtn?=
 =?us-ascii?Q?chE5IngH/E9R48KJEiw+CElXXf/uaIDMR6RZv6PR73IXMX5zkPGWv50hVLi9?=
 =?us-ascii?Q?Cemf2GpcnEvHbX6Lv97Uq3WofejVODseZDy5nY/MFjTZaJWhxuEFt+aFA9iC?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gppJJZNvoB+/WnaMeLENrQRYURWDOnQXt1hLGirPC4ekF8bR8EIhGVw+m8vIBt5Z+cHJamGqZKFaRRLjAiEW2lOFshza1k3aYbUzeLfZMvu6NOVDKHBBYaC8SkO8m2dB06W3KYHBYQj0bM2jsheqa9n2XTQJEUS7d8nNXgpvR1zLL8UUPPZuqi5w/doQTNqdq7h3P2mSBZrvaLT9Ln75r6g+cgazE/GI/q65ZepCcnukY58tup24Odsp9MbHAj6s2Mi+1czZOko+hFNYgjWZuQUlO+Ux9k8N2VX1eBb2Z1xnkcOBVkFOuqkjotqt1IvNjy4wf28g7fwxOitfLLcI9Z6diPXX8GRdNSMAyrbhm/7JyqdwWraXn+74qrWeOflt4kRk1dpFPBOHTTEjV7BPi8tF/q3dZw2P2BJyWRKXsBmM0OTktRAPQwDz+ZjmpV6CQDbdrvnOIb+PZnIH0/D6qd9C5Uy+jcooZI3ANlLdxP99rICCCKGiy4RCQ/VgwNhLhPCDl9qlzkNq2DpcAAJq3TtF/0LVmJOTZpChAd++roFMTZQX6XeyGjU4hXfUy+xmBgEJp6seSb/2uTklpcMfv5bzA4EAPgsEK5Ct+OHCo6Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce2fec1-7786-4e88-ec5f-08dd8ed591e7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 08:43:28.4473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zQWy0r4AfD0BhKf/ldglEtd2mh07pPIhzXbEE7hXSs1cpKsFTxO+HFhcBPq0/i8522UPOGXo+EhPW0pD4MI6MJynfiQMErvMOa6fcBoiao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=971 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505090083
X-Proofpoint-GUID: 2ZjhTKlCgLKmr-jJCEj7Z74j88HAuiDO
X-Authority-Analysis: v=2.4 cv=FbM3xI+6 c=1 sm=1 tr=0 ts=681dc033 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=5Tsbo_7qpPIHlwyut5UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 2ZjhTKlCgLKmr-jJCEj7Z74j88HAuiDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4NCBTYWx0ZWRfX5tSgsMQyawi7 3am+BOLrN1OC79NycEdOI0CTxOL2xGAQBV9UpvU61BUTAodKILsagjW4S0TqjNHOfHThsSp9h9U s+OWmzZKJNzITppiM40rMigd8HudSmzqpt/vZvxGOdApKKy/p5awzZJKeOzQ9obi+oLQ763YDbC
 3uD91VMc3iAzmYitZtm/bImzPjVavkxJb+CWhYxtECq8KUpHr3fNd+yiYgC6HHAZW1+kZ6dNkaU uuaDbE2ND1kIO88ebV9gYpaZCQr4/Ra3YwoJ1j2KchKdWXbdhObwQVdC8ZxoZJWzlFVT6kNE6wA aw67U5fwQz6FI57H3+MpjheEPJvtUD1Inc+xxGI4xeCNNtiW0ZdojF0cmxQO7cHVTN/pdP3YaCC
 NdMlXn8IhJjwirH48ZqnBUOvDrci/tQESqKAU0L8BnppRYiZFXajE7I4/ua3aTcKxNz/nFdZ

On Fri, May 09, 2025 at 01:32:48AM -0400, Johannes Weiner wrote:
> On Thu, May 08, 2025 at 08:31:28PM +0200, David Hildenbrand wrote:
> > On 08.05.25 20:30, Shakeel Butt wrote:
> > > On Thu, May 08, 2025 at 06:37:35PM +0100, Lorenzo Stoakes wrote:
> > >> In furtherance of ongoing efforts to ensure people are aware of who
> > >> de-facto maintains/has an interest in specific parts of mm, as well trying
> > >> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> > >> files - establish a reclaim memory management section and add relevant
> > >> maintainers/reviewers.
> > >>
> > >> This is a key part of memory management so sensibly deserves its own
> > >> section.
> > >>
> > >> This encompasses both 'classical' reclaim and MGLRU and thus reflects this
> > >> in the reviewers from both, as well as those who have contributed
> > >> specifically on the memcg side of things.
> > >>
> > >> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > >
> > > Seems fine to me, though I would put Johannes as M (if he is fine with
> > > it).
> >
> > That would be lovely.
>
> Thanks for the votes of confidence, I'd be happy to do that as well.

Thanks, absolutely support this :) Will switch you out for an M when I un-RFC.

Cheers, Lorenzo
