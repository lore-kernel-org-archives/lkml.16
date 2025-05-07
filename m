Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC93928C2A2
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633076; cv=fail; b=loPYUUodKF4S3vAgSHrlMCDHmm4QEZdHH/Fyoa+FGwaGMAt+TrJz2XsKtycxuxlry1tF7CTL4tiJ4SfB5E3mXhLDj1omlCSKoPJpAJJmQVW6DgUjPe/Tr1HSKSZdibpdhTsHCvbHbm6FIIU9Y+k/LTzedu0TZ3hat/x8vPS6rEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633076; c=relaxed/simple;
	bh=DPADyBjv8aAel7sv0FMJEVaxe4g9D/uaO9HhtkakqvE=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dmtjjlHKyYTbzpMxsDL/kxF7MGHTFbZmx4K9t5lwRL5LjAjmGa5824cwW8tHzcGL2k34DyWU4YKsP+UBbHobcV0DzX/F6c/usHcEwl83bAeLbJ4nf+E3eh231s2I1/UtciwrLmwubDN7kuRmCtP9W6OXEIsnjl4sHc4IXFh7mx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hVmDbbWb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FLSHbxUN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hVmDbbWb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FLSHbxUN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547FHB1H015131;
	Wed, 7 May 2025 15:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GYSylFQtMns7gobuha
	bJ4qsgwB0Y4l6a5TMPEge4z4s=; b=hVmDbbWbkX/Q479QNJymBnnEp+kx1dmtQt
	9vsdByMEVW1MhvewF1/QMUtsC0LBVz8pDIWWmb4fjGdS06iq1/g32sWf6lvl3X9c
	CiqvPy8kPCdRMpY/fabC0PhVFa+96CuVHmHhRo1ndhZGcN1RtfAECfIo0frFlTQN
	IswdXRSOuwFVGoKsQJ/UDjwYnLj+hGlkMCMcKX/PbpTTYhMsE0tuIyQyzF5HVXaL
	P+x/z9mej+JLG2yH0poNWtzYC6csjbOj3Yn8NrIAwa+Q/L6m2fwRjTtAuiLSe/5U
	3E3sONwPU2/VKdT7/3CAU/ENh752A6M6EheCoJkbHCuYfSitniJg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ga18g3gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 15:50:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 547FZlJj007271;
	Wed, 7 May 2025 15:50:45 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012037.outbound.protection.outlook.com [40.93.1.37])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46fms960yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 15:50:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuwhMacTv0QyD8wjDtFJRCO6V/90+0dHp9zPM4bGYgz9qdQ/FqwB5fuiBLpLHYATMlQIrkLYW/A2Z2ZxCVozcgwzkA3N+2aGSVVsZIfZhcyk9QTbPlLlg5dAz/yahcSkz+BIX7BFl9gT14p3/GZvx4eJ1NsY0rlJyfdEG7s/sjH1rsqodr6fZPFYsSZLXMbcLNyhEfq8mpYQcx1B6kYeCeeVNgIHxT5Kr56oGWj2atiV5fb/3uqwW9Ky6cwx9F13sa+xb6UQlVSr79OKDOWANa1473A/6q4Wd9ZGQ0iC4fTADO5UPrSTQk8y3ce2aPRS0+4LqNL3wrQPtfD811laHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYSylFQtMns7gobuhabJ4qsgwB0Y4l6a5TMPEge4z4s=;
 b=SBND5xmEmn10vZa1PO/nPlab6sNBEKzjXtW7kgboRMhcL1B0iBfjf6erX6M1MdfeDOhHfxaRdt4zsJH26EHbVGxPxXNBT8Anx/k7JQFhO5M8ZDvhMYCHao08/JR3JlX6HHTA9YgLHQ+LlvvXgKh+DLAG0qbWC1GGSWj4Nf4BGYxJlV8veFye9H133x72aAFlcdou4LBgpZMv6yossWhkEh1o687UrNm/YgrMtr2bJaLVYI/7PEkZw7CfSUwXgoD8UL8sFSwGg3absJVef6KEpiei470oTutt4hPkUgUwl0iFf0IwhGgDtmvcyS2pmRXgzd+iW1dv59WX/U7mvfoX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYSylFQtMns7gobuhabJ4qsgwB0Y4l6a5TMPEge4z4s=;
 b=FLSHbxUNswQQY9dLur32KlrKtu0oVo23+BgF2ZFszjFrOrv7Yd/sPJNv+sgbYOLwI4fiIoMlWFILKjWXOGpPM+2IRbkTe0GW11OY9tkkNUUyCm5NyyAjAbB3ItZWRmZACekQ02T+5E3eSqV37psCjXRfqNM0tgNeGruxs11N0GQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ0PR10MB4718.namprd10.prod.outlook.com (2603:10b6:a03:2dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 15:50:40 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 15:50:39 +0000
Date: Wed, 7 May 2025 11:50:36 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
        Hailong Liu <hailong.liu@oppo.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix MA_STATE_PREALLOC flag in
 mas_preallocate()
Message-ID: <z2hyuganxadlf7guskolgd6epu75jutipt7uwg5sqwew6a7lyv@6fbcue5r745x>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Hailong Liu <hailong.liu@oppo.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	"zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>, Steve Kang <Steve.Kang@unisoc.com>, 
	Matthew Wilcox <willy@infradead.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250429014754.1479118-1-Liam.Howlett@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429014754.1479118-1-Liam.Howlett@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::29) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ0PR10MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2a8b63-cc7b-4582-fba7-08dd8d7eea82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WAe3KbFUDYh/BgDbFFZTdL+3F4GWL4fuZz7z1r6V4KjyznOKTjNr80P7I/nG?=
 =?us-ascii?Q?GU/d9CLkYrzrOD8Ubq/aH+cCYhijVHqDnXg2ZbZG3p2wqQwYTL3c7Eczl8dW?=
 =?us-ascii?Q?CDjdVSdFc0pA75SIIoiGFelm473VvfypK2/mRkWlcvOdUs8rDn7b/bMpUtiY?=
 =?us-ascii?Q?1lnNqomRCJUFbwz5QC+fKYVLlVSvWF5Z5Ko8BwRXyyW736saVmIS1e/gg+Qx?=
 =?us-ascii?Q?RMfAJ7CJVI/+H/Tn48XSLXyBprg8NQOqlutkl0HNaD8eRPtl6ljEfNL6mequ?=
 =?us-ascii?Q?4f/FNPRRz9zxjqsUhYXu/UGHoS/BSJ94qZxrA04AJe835Rm6TbskBJP7cWcy?=
 =?us-ascii?Q?uBoNVWqdmCHIgbeNRXXOedVd4BT0ASb46Z6HSe6ts0NVedRUj5VKqH3jt+2M?=
 =?us-ascii?Q?U3zDG9ezH//rVUhncb+LUihNkgcjNKxDHBRCDp7obfsc45fg/2v5mS3LuEoq?=
 =?us-ascii?Q?i64HyCDM1vYZ2eFB5aNS8MieAxsQegByywrVytdS8q/P+TniOqqIBQ6ue24A?=
 =?us-ascii?Q?zPGWVTsCZ7/vRjVwGWv1yTRUoRBUEjWn2qT19g1CSeq/d+cxv2pzsP6zKo0e?=
 =?us-ascii?Q?PW6L11zIFRnutG7BgE3NBPjXcghu0AJOAOSGQEajHaztgUb2k6zK5ExCX3OZ?=
 =?us-ascii?Q?k1yhB1SncNfS2MWgjtSDRpayYsHSQ/dd5+1bVao3UeeMdqgI9EC4q8ybU6e3?=
 =?us-ascii?Q?eySNUeLOxwyk3dpKD5Fs6t2Pw4Mk/1G+6+izfYnEaehC9dSmZRwiGFGtDpeZ?=
 =?us-ascii?Q?JqsavCh0GMgmQjaOvGtk/EIwWlmDN22DDCPQIMorz1CMPQoR2Yf4QQqtjFxn?=
 =?us-ascii?Q?La65KBRLrTKSo65wCMiYHnf22iJtLpo8x0jYCdYk+GQhnmTdHAG6ji9R+/Kb?=
 =?us-ascii?Q?kgBKFDJPPjQaLTOmfWG+bmPjQ02JTPP81TbIxF0TZnhRt2agFTuu02l5GUL4?=
 =?us-ascii?Q?EOkz8Gvo8sPPXE5ij5Jn7Z1LRWbJlEcBu/tvL+skh+YDud5edCBU0oBeeuSW?=
 =?us-ascii?Q?ZfAkbamBu1TYrEpMjrv4CecnaproOUOSpgoP5xCr8poKjNlS+Ndv4HE/NTUy?=
 =?us-ascii?Q?G1U56U3ObWisnJ6Wdz5R2HHkkPSDIqudEGa5s7rrTagugckpDrYRo1Tllpej?=
 =?us-ascii?Q?XsSYsuy/R7bCeQf2MSE7ZuPz2PXnbdBZK9+v3Pck1/y2ozceRfxo8yjh28h+?=
 =?us-ascii?Q?XUWIBlsXIpwZ9ve4LoxaDVuwPgUWQyrxJXkNatDXI6akYcqksq21MYDBebPV?=
 =?us-ascii?Q?ty+sHJCMuVuhIH6TR5ZScRlJDbdYSPLbISrZr8mTRQw8wkcJqLTy+sXp9OaK?=
 =?us-ascii?Q?xvrfrwK/KFZqfGCq64n6jR/hRdf7gfn6z7aa2BwONrRBVjfb1bP28Pe3xgOZ?=
 =?us-ascii?Q?2xn42HgcT1CEIDyevBRJYSTaerYXaL9X1mAaRfs68mooN3upQBb07ZhaXaxp?=
 =?us-ascii?Q?vCBqRiMs7nDphym2Tl+AxHWeLNwlAbtz6cSr4cOpfLy0jRp0CPQ5vmsaAIjD?=
 =?us-ascii?Q?w6Tz+tPa0uUCp5g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WpTmDQ7W3bvibvBAnlbUATpQA3uK3+hC/BL5JZaY5VtN8qwtNSTCpI1/Lz3s?=
 =?us-ascii?Q?I8Z3vPb/EevayguZ5HCIeAqBFzsIZDv5oGoXk65xrvquWF66NlSGPVl7ECIY?=
 =?us-ascii?Q?YRf9A0u3Cpf4sDRPz0CwvLd5xV1SxUXyiTMeeZ4o9O4UZJcqRZAaKReGCjVV?=
 =?us-ascii?Q?2/J1BN1DAIFROXlo3annJGGAmbqt+KGMgFudUtEbdBVhJvOANfcChINEib1k?=
 =?us-ascii?Q?6PT/fYYhpDHeJSea6i81DDP5nQyenGKr3mgTqcDXNK/JTGyGBPyLi8ZNaVGm?=
 =?us-ascii?Q?yVurlstZpAZdheFH2gAkiLkIJOtj/7PhwlvysLsba3xuAX4SzClG90n+td9o?=
 =?us-ascii?Q?AasQZ/VCS5gvDNK+H2X//fg89Xquu4XnfoQRYkYVY5szxlwghecvmifdeD+w?=
 =?us-ascii?Q?Xm4L20+zjdqKUciajpZzrHAfzPl8GanX+APhJBEQz6+s6GT09FQhby5SdRXi?=
 =?us-ascii?Q?v5oUXDUAtu4bUY4/GfXWp4nRFN1vlzYJJhGfYVPrw9T91UulBYk0qIEcCuw6?=
 =?us-ascii?Q?zius6OSMDmgLwsHDhvXLcZgaCM8UeQ5vdQA1R6sDw+t/8kry4/1CtDBZYZeB?=
 =?us-ascii?Q?fwVxpfyG5k+EeNbTQSK3l9akiRfQwrZWMvcza4F8DCertnzo/F6vkgOcdW4J?=
 =?us-ascii?Q?UcJEhzXl5E+X04NNirbnt8lR7bK2CkctZcMIf4knKn0ZVjWz/tkU+t9RF0rG?=
 =?us-ascii?Q?71oL2lBXgZ30LUnjQvAjKU2xYguTioqQcnmZa/1GxnylncFui45yuprjRQuQ?=
 =?us-ascii?Q?j3TUomyooYyRlMv2l5h1uNXmPvQe9gpYprpZjUDJ7KKU+9a7YyVUG/2zAEFC?=
 =?us-ascii?Q?VtqmlGlIXZrExX7WLQUV6ixZQtEplsPyoATXp/o1XsQ0DBVroB6qaL/bHh3h?=
 =?us-ascii?Q?I7xT04VPlOXv1ljTgyfR/U85SItOzpYnTGqDO7oypKFMNpvGXFoLaBd6tZ3/?=
 =?us-ascii?Q?vohbGy8BXMRn7UgMgyvQO5ass5dCUri0C1mkoGk3hWFtttkwQ+9CHg291OpM?=
 =?us-ascii?Q?Y3umH24v7wSHSdTB56Ms6iUMcVP674xa2+H+B0KgMcgqwgKe1q/QR3/4TXfP?=
 =?us-ascii?Q?3I47eGSqYuzsWk1CKRce8M41ckLn9S1ip/n+gP8Pl2EFSezDOgUZUS1vnGej?=
 =?us-ascii?Q?WcWoSN/5yVa4kHY065AYCqFJJlv/XeGSggRnSYifaHgpklKJKzsUuwp6r3qr?=
 =?us-ascii?Q?J/DZgwYqSW+PRMVPoJ/qiDgH9zJSkaaz77sqEyNISBb7XF8s/VGmlYTUfD8r?=
 =?us-ascii?Q?JvIO4bKa08fL9oV+V5qT3FCPzL1iHx2rPjLzfoHNgYFzq/Ykq0LScANOzFkr?=
 =?us-ascii?Q?oZq7TMeSzbOjIitb9OgTXOsFGJ0FCGE4m2fbhv/9pmgDHXqOPYonQzaLFkkK?=
 =?us-ascii?Q?JuVD12jJ5uGqoUJTrH1hQW6Y0YHq6OgN3p9AJRXIH1l26RiqqSrh+H4Wg302?=
 =?us-ascii?Q?omjMS6RhRFZ+4RzJLxE1mZSEiiMLMYZIVwgzCRXIAROhSnsc4JOGDCEJjqYK?=
 =?us-ascii?Q?wrTwJ6s18fbcbJC2N6eWJahm+EsI7LdwQZIA5FfdKpHtf9dApnjU5zTWnRNN?=
 =?us-ascii?Q?EGtoD5THnCW3lC3HRYsVqy6yh4KhrDd9z3nf1Arl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i2/y6HYNwoGmyMHf+Bm/Hi7ad4tGlHilbU5SWEI4mESy5CA1uSmLRGcSV2Om1cmttfdAM18mcTvA+W6h01izjBfU2gVnybxmalHUcm7N/AEe2SWC6u2ENcxadV/gDrmKWDif9HwnFYz7CpYKdkohe81slzgsrLWiykT72ll5EJrTmsPstYzMNkzsGFv+NhHrd0SVaMFVWyVGdUhVza5yK8ppJsgQVovDENgtJgnXb5Sn1gBntMaR8eEuzhSAukAyJIPep0e6v2w3yVYKzu5KVkEehn5JXZUY/r8iXikRiZryLfG1VTUFFPVhJW91exzpjahoFLTPL9paRNGmcBvbndQbmzBr95NRwnRYCaQsM1rryQhivZ0599i3G5Hcj3zkhCl4hyOYesARzo+0HCRMIZlJd7llNN9UEfrGhnQfqapjxmO6iICOHfxrxWSnRsLm4RItYbi2d4NMeIJYNnxl6wHnL3sN7MZb8EF/ZM/06F+r0U+8asWwXCChLB80adRxIaJJFXyDUDodvjXGvZLpeu+bIZTMZISaxNGuaUzr/hDjGzu5BwO7vrzKI1kyFwLcEjgiACH8PULYDx0R+slB2PEIdPQ1dR5FgBZZ+La+bBY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2a8b63-cc7b-4582-fba7-08dd8d7eea82
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:50:39.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kf5m3LgmZEAu8914mvl+VuNoW66qnjIXuXZsbHZbW19SNz8Iu9eTUJ/v0M/P5bbu8m5w7JmhkiH+It7NauBITw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4718
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505070148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0OCBTYWx0ZWRfX7YWGpSm5ePW2 0y9liQ3nZxjtwGAjjLjznvaz7ejfTtysQkM39ZS79oTICQc/hCF8AZfQo4kO7Up5wJU6PFWNxpf Ap9wxf29i4CbdqE3YW7c/ClO65emqy28huOTSnk0elFGBLmXJPK5ddCshpvsA0bngwXVr9GOQqy
 wwrT/r8cLuUieL2S42Ad5s70jpDKiFvkto3KmRNKTNpUwrsuKKv2lBY/Ln3DaOWhwscxDoIzr3P xKGL33jZb7VFRajz4/bBeyUaPDxmASvmUwmoNfOw3RY4Xe+Kjm5Ov37aP6WDvPIEj+Ft7ZO4KOR O6gQgrxetEc727m9XvBYm5bKHC5hQrhMl0RytzBYbQT0lnjGe1KnXULhHVHkWwyRgmhWC9r4vUP
 2KeFNsPFgqiMOAHF2uK2CGgtBGEb+AUL3uCH7uheSuUNCdyXrLY/9cFL4eKi7TJ1PyWsmqJ/
X-Proofpoint-GUID: tr_Y9dDyZJoK7ekb3V7zwC8aX-6HB1To
X-Proofpoint-ORIG-GUID: tr_Y9dDyZJoK7ekb3V7zwC8aX-6HB1To
X-Authority-Analysis: v=2.4 cv=G/QcE8k5 c=1 sm=1 tr=0 ts=681b8157 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=icsG72s9AAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=JfrnYn6hAAAA:8 a=Rs_sNsc084P2xk7hj5EA:9 a=CjuIK1q_8ugA:10
 a=T89tl0cgrjxRNoSN2Dv0:22 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:14694

* Liam R. Howlett <Liam.Howlett@oracle.com> [250428 21:48]:
> Temporarily clear the preallocation flag when explicitly requesting
> allocations.  Pre-existing allocations are already counted against the
> request through mas_node_count_gfp(), but the allocations will not
> happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
> avoid re-allocating in bulk allocation mode, and to detect issues with
> preallocation calculations.
> 
> The MA_STATE_PREALLOC flag should also always be set on zero allocations
> so that detection of underflow allocations will print a WARN_ON() during
> consumption.
> 
> User visible effect of this flaw is a WARN_ON() followed by a null
> pointer dereference when subsequent requests for larger number of nodes
> is ignored, such as the vma merge retry in mmap_region() caused by
> drivers altering the vma flags.
> 
> Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> Reported-by: Hailong Liu <hailong.liu@oppo.com>
> Fixes: 54a611b605901 ("Maple Tree: add new data structure")
> Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com/
> Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howlett@oracle.com/
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Hailong Liu <hailong.liu@oppo.com>
> Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
> Cc: Steve Kang <Steve.Kang@unisoc.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>

...

I have a version of this for mm-new and I'd like to send it out.  Once
this is upstream, it will be backported to the stable kernels with
something that looks a lot like what I sent out here.

Did this fix the issue in the longer running tests?

Thanks,
Liam
