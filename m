Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C021E2845
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422400; cv=fail; b=Od8mYXOBcS0DRY31Bw//zwa/g42sbfSDj2ed6AuxpSSwLumfZqvk247S96/fGiwagp6F3MTLMc0tSjTFFCpDH0b9q8/sYEHtIZO0ZzIJonLtJIQd898b42Vkt38I0RKxgdKzMLfBBSE28WIaAwM6gm7jgVitAw01LYoKgdTtWbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422400; c=relaxed/simple;
	bh=Z0PysR7lByjXM65xzjRMhwnoAgcR2hggBvoBaxoZuUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rF9Vezk+ufrCkaB1RaNj22ooF7Kr5hGGpXBNS6R5OmfVdXrHOql/kIfO4ol8ELS8+jSHC/2dQ7SaY72yGxgmk1+8IOoRERmPWbFJMLVqSmxarEHwD6g8Fykp3HXuzYHgjjWZyX3/O9kvASm4Pt8LWz2nLFSqs+614+WP2Lct2iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j0M7c2s8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EqRvTrlT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j0M7c2s8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EqRvTrlT"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VBu4BO009189;
	Mon, 31 Mar 2025 11:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=JZP8aZQ+rYbhVVusTX
	HIGAqbNpNixCh9uSz2neerEwQ=; b=j0M7c2s8FUEkmnIaJwSUb8ScOAnjSXclgT
	VG2r8pqK1taGB0f9a52flUse1S/EwRnH32CpNbxYgnYGOfYPhXL+c6pPa6OB37zN
	aG4+SAzqWUsGQ+NoGaMwvpHKybbWDWB4nRMAOihiBLabThbfAXfTI3KiqDowBJ5a
	9luqcRN0E6gWyG9EDGAon7GWnxBmCJeA02xPUsZEeWydctv2+8ZA2gc9M7+7CK6I
	nzFyYOp/f29DSgVAWqGPlNDUDnZfbwX1h0J1uxqDMImmlfGRXDKlo2oEZzXbfW8a
	9phn30H5/cCLokHWKL4ZS0SwCO1ha+v2kSjo9qJiuDe9MU49wAwg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7f0b24e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 11:59:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52V9ACt9002610;
	Mon, 31 Mar 2025 11:59:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45pr8nr87u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 11:59:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTULlMt/wJOKpDHr36PbjscKEDnTECio+3o4OjA9BB65JoRBtknX1OCvrWGXLO/jVVkYsaQ1nOqOHzvLqxt2sB8iGKWu/9mzuzZjiN73KHTnBRvWlUfQKF192fzVv4tqPYpUGJMpODpGpCU6Qty4Ol6XykelOmwBMDUwwPj2oFR4T+ywMcffRhaowC3E6UvqQDOxZf8CkIsMT9DHDXmbzY+JZyMk3FU9Dzv46PPkkrf37vgdoiewnJccWsAKbU+DCB/cUEzrBsCHBwx9ls7aSnIpziUPWyyxJkxfzX8NMufxuOYCnmkxul71jevs50gCDATMMC0DmrqIuXVrTzNKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZP8aZQ+rYbhVVusTXHIGAqbNpNixCh9uSz2neerEwQ=;
 b=Uq26jQSDnEviqLft9u2kZkMaMNUZX6LNTb9b75GQMei6mmqu22L8fLjeedOGkrS2DLjq7WHPqRwqIIZysd6x5z1JWEQE9MyornDzerFHC97NQRsGAcqOAmmS2mHTOjHrtZ0LwzcWFYFoo1GZneb8IbRG6VeOVhX5dcZOaiA8/TSQ0sHKV2KhH9UrahLF07J3qlS2cDJlDFIt6g+UrcW2rno69iVOUHOpincLllmztU6f1SQUHPt9/l1krxb0SBX0QBEjECdx/i5zKzJqxbgMiIb7XA+dscqv6hc8crhFExPuQYegEdqsF9UA3DUorJZEZkqhi9aWx3zd1jMG/XjAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZP8aZQ+rYbhVVusTXHIGAqbNpNixCh9uSz2neerEwQ=;
 b=EqRvTrlTaaU9ERVLzjpl6RGJOb3P3mxdCMZhSJ5Mn4Ps8Czqa2zX2IEeeGlOZdIVzOhWLhZZiz3So+mPPArW5PfaXISUe968kj2iCn3ez9p+qFYIYvuvwGwXL/EaxBB7qC6VftJhmG5gbVMJ6GZNm2Ee8WIAETmOcmMNqaRZSsY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB6229.namprd10.prod.outlook.com (2603:10b6:8:8c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 11:59:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 11:59:38 +0000
Date: Mon, 31 Mar 2025 12:59:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] intel_th: avoid using deprecated page->mapping, index
 fields
Message-ID: <3a98bce9-7508-4ab5-b2c0-2493d2256c53@lucifer.local>
References: <20241203080001.12341-1-lorenzo.stoakes@oracle.com>
 <0fcfc239-19c7-404f-bbc5-70a29ccf6ec0@lucifer.local>
 <87v7tyyrvb.fsf@ubik.fi.intel.com>
 <64514bd2-0271-4b2e-b1f5-a35520fae4ff@lucifer.local>
 <87sep1zw6d.fsf@ubik.fi.intel.com>
 <Z8drzoRVJL3P1jlN@casper.infradead.org>
 <87frityadj.fsf@ubik.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frityadj.fsf@ubik.fi.intel.com>
X-ClientProxiedBy: LO4P123CA0359.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: a82ad0fc-2a5f-47b9-22ae-08dd704b8387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?drLLR+/PSsPCqYbW107dqiiK/W82Xn7UqcoD8h6FUnLnYuwRqh3985BkExsc?=
 =?us-ascii?Q?NXfc97Xao6S5BBg2BzvQv0tJ6CpPcLfns4FnT4ULi9LXypk9zSKAXlB5PSrE?=
 =?us-ascii?Q?3aQYbhK1SbDZLUU1UeFeDdbtWYEuxTX2brJ36kpR+ms6/94E0F8JJPjP9h0Q?=
 =?us-ascii?Q?u1rogsIO/vFr0f52V/Z3+zcG49VRNxhcLDPMYDjaB2ynwoXZlEQSOrCOYZmN?=
 =?us-ascii?Q?mnLRXJgEZpkcFLWMrAkXqrCaHVF44jY2qkmXLGK3m3kJ+fSpc4GPr+t8S2a8?=
 =?us-ascii?Q?RuBoRGNln0kqnr0SgtOaJpqSlqz2QDEuCGcT9CQ9OMA56Ckjs73gfVQ2XeOl?=
 =?us-ascii?Q?CHcy7pQ3/7MzXemqS95EvIlG6wqLRB1ZTq0CESpumVH+I0TbF67llLLntHz0?=
 =?us-ascii?Q?G6B1zQMSmaLLqJ4lg2rQNt7jg2rp/r7fW/cTY19PA4qzPLVr4SvQaVK3ZqfU?=
 =?us-ascii?Q?vBJgbhPX6gUpftG3KNmirOCxhTQ/BD3xq5oAS4U5tZeKNPCrie+c3loELE+g?=
 =?us-ascii?Q?+ID0qMJekIJlbE7ACwVbPGT30iHNRY4z3I5Dt4y2lo5xa57aYN7hejRkgw9p?=
 =?us-ascii?Q?pe1/l0C/RKXRFt0KeJNe/GoucaRKN3zP0lLzmR7diMkDkY9KpZCl32m1rJnO?=
 =?us-ascii?Q?aLrBRNW8xqEmznecJ66kG+78WQJ7QZPKHfap9MNIfRhmoST+l6ZtJd1f9UBg?=
 =?us-ascii?Q?jaUJHtRL+40+ZOUTYW+AXVvdaVdLLC28ZRSn9hq9nl+zimgydT2xnshLQLHG?=
 =?us-ascii?Q?a66Lxx7O3rcHnW/ZVq2bhoZ1sQG1zOIBdIMl4i8fZb61KWqGc8GL8PBYfu1t?=
 =?us-ascii?Q?2Rs9q3SXgG5bmr09DGX0syuegE/PCkM48WS8IL0bnXpG3j2CUK58NrP62Vwx?=
 =?us-ascii?Q?ztWdCTIXwls9kVA+0V77hEcMJkJRY5r+xnJ+X8eIComUjYVAjxSMD4gYhtuo?=
 =?us-ascii?Q?ZsO8RnX9kH2V/Qsbd9Jbr1aDOmEHKtCnOgMtOddySMs6pQW7f4+/5oln++YK?=
 =?us-ascii?Q?iXUq1CCm47HAnY0c0wkDgWsngwAJOQKJrzi/oWNXVOtdpO/YJkg3sZzu0Rkt?=
 =?us-ascii?Q?EyqkRptnuDoauxymmZpIhSFYD/JUafHq33EIuSjFHx7RxvYoK37AwlWVfI5b?=
 =?us-ascii?Q?611E85/Lt9Ou2RR0DACPe83vSlNlLvWLx1c7y8JeGK1B1MSHaBEsyToGjxbp?=
 =?us-ascii?Q?bPxCbR7zRCXf/huiwxvCYR9wqEwy0zVo/8Y+uEHpmKMKahC46sfjTcN2q0A7?=
 =?us-ascii?Q?ldYcomtuhUtMUBhABLnklXJTC74Xopszj/q7emcZL+mT0+xMp9N9rdWD/SSi?=
 =?us-ascii?Q?XQf6TVY4HZCxcSuiXFvZE+dDbQ60rzwSvWqygNqxmHvWXexQw8qt0M7Rkexr?=
 =?us-ascii?Q?O9IeHA2N78CnOk06fzFuv17L5SLE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pua9DkRU9w8ccDKJYT5PG0W947j8xsJnLFGISKprCYp/PvnnsGTDw8Bi+nk8?=
 =?us-ascii?Q?i3skJDtr/Y7GUf+q+pf7k8pT3K2XxiRxyMuPG4vPbcii32HmtW7GVZ0l7vm2?=
 =?us-ascii?Q?5zAtF3CDY5KBzSFXuuDcSZ4+IZGiZIfHKnEp6M++WjNJCxkx/qJgTBTYBN7E?=
 =?us-ascii?Q?wUMyqULivEL/yywQccM86jMkL3FkNFD93es95MTJLTEUlPKXiIEoqQLDh2Mw?=
 =?us-ascii?Q?yyM0/D4i+EiDvqG8T7AaCwpGSIF0h2mGlm5bw4EfK+FDbblNDpOW16VKaA6X?=
 =?us-ascii?Q?C8F37t8/QoSX0rgDtHc6r035e31OgpJIgWQjgW8F1e5CK++6jP9TO0NqNgLJ?=
 =?us-ascii?Q?9etPegOE51mwoIqdBoGL+isLbDysUK79jMcpVgwd/Ozp9IuSZiHm06+mzgsO?=
 =?us-ascii?Q?J1cbcqyDQSViPzLTco91/pVsxsSj3gm+o9Dk5USLbmKorX4PZyIGtKLv3+Yt?=
 =?us-ascii?Q?nH+d7K//D322D84eZy7+HnUGqhVttHwsCe1hbnkS2fjOQvM3PdJdVP8vmQKU?=
 =?us-ascii?Q?W4DPmYsv92C+5gE72SlNxBnON1giW9CqZbklLzvk8pwG+AOHUID9mufV0VD3?=
 =?us-ascii?Q?6EssQefJWrkzCMTEnuEPiSwi+F+5ZRSC2rpk8RWlKHwQlh56GxMB6BgqOuFA?=
 =?us-ascii?Q?WDzwkuKgbSrygqign3Apf1Wc6qS0hIuTTU+Ibl2h7l6R1ciHKyDwOb46f06J?=
 =?us-ascii?Q?o5PaPJqe+AEC8r53FcKogB5bh+NvYLO/buJPQpzlzCEBtEhqoGzmj05IRagE?=
 =?us-ascii?Q?f+zVpBboN2VcXsuLYRwNUuBF/DRbt2jlgHWLwJUtILwJR16IWmJmscUydIm4?=
 =?us-ascii?Q?p8nJUtzA6md+3/ni3XEvSKSoxMpMqKpxCCwV6mEFIhEY1wYp+RIm6IzuH7rD?=
 =?us-ascii?Q?sboDMCpIYXos4PP+K430n9Bp92LP1G8+e/7VyuZHvFSS7W9jPCi9xWpqGNJL?=
 =?us-ascii?Q?qpJoYjPpAsx4Jqg9JHmLPwnzjc0O2UXBRhiRSoK8BLDs+EDdg+v/BUgn0qYf?=
 =?us-ascii?Q?72/2WhEEbYNHyGShgFKlDhVXMQC83NH2qtv1E/sbzE7/sDnS38fZiYEpNrJ4?=
 =?us-ascii?Q?kqJGEu2e5z2H5HouseeS4O1tiQsL0l/z7CTIOEHWCWiMH9O06oo2QlqA9J0Z?=
 =?us-ascii?Q?+NVHwX8HGaBX36IRWupRXrPmWRdGYgaTTjFUYVIeSPFDpMjIbqlwdCrEx5b6?=
 =?us-ascii?Q?QsZhaOgyeWlvDs+CR+eh9zh2rSGC92e1Pt98o66SCqjnOxfFFLTlQEUX1Zej?=
 =?us-ascii?Q?LFH8nZ8uvj9DadFmRTeUCoeMnoEiQkDQj2ysoDKQclmtZ/EmznS2kHT0a6GO?=
 =?us-ascii?Q?2+siAVA02lkeu80u8dnEyztEqHLiIVQ5lDIa6ZRUsj65qi/aKeV7EJlFWbWt?=
 =?us-ascii?Q?N/okY6+5WRivYIQuLG9uAf531e+7NsoX8Ib91vsOq1GHDdgRYitA1jTGTx27?=
 =?us-ascii?Q?iO6rn1JPDRcgG1ZJLrIQ940UHDZ3UEj5dlBNoX4oWlnqhvTiF9b+x/YHzHCS?=
 =?us-ascii?Q?oYXqKp/UjusxxjXhsRsnzUgvMEXyk5McsF2DbjqrxvyMp5fJZ79LL6/LYwEe?=
 =?us-ascii?Q?yACqFNq8umkPDujDb0mgpcvXGPF1/zEwB35CQ5Ap3X3zmVWpIn+ocFzft5K4?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4akxCio1SbUsuOzU4oxh8rWRI1Wf7dnfVLRrjAsHi4nvdiEip9UWN6LPN56AbqpWCKNSCMFyZtr0Y+Yz0A5FTfj0citdT/ACLWJj73YHOzLzff38lfi5Z6UTEJT96xIbuovgtZ16AZDP+QaSKq4Y8decdiNaeFRkUHZwWQkIavtWhM3gwD+My8VDMt51zsk4WxuQkP9eGvtjmPxeOZq1zXybIcgdi0oYRlkepgbwKfIdC9Ly+znIteQo+7wmwtDUdfjvPTZjLLyivdEvJRwruudFrjQHTheCiy6KKLdJAN1EF9u3wyoVu+HQtMFVsXZpDQ0n7qUCA/qb35dVJLSbFX2yadpPdGGbRFEbHVIpfTP6XdW/d7WdBFZm+lhBJkFfXWS5NfSZkHeMSjI6wMMr4w+cVZW3F6aAdGMl3NT0zgh3aM6uxLU1evqIKIFkKTrMSLmRIod1yrIiQjx9wL6VxWpys5dFv66jJygKOyZ6EF6MLOv56VXdoDQlmJSk6lwjbdU4VOGPVZfmmRWjp9BLxBAzsnIkatHvsxF3T0wXCjw3PQdww6kW8coL2hy2oud6mRsFFXe4Tinkj79z0+s2fka5UtyDbRxUB3gDsIUk9vA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82ad0fc-2a5f-47b9-22ae-08dd704b8387
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 11:59:38.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOfcfClQzo+461UMbNNqY7VgogeRec65BkpPlpLqi4lAcY+D/W4yu5RYzY2xlKP+qP4p43ANWXOomrA0bKOwEqS6P8B/D2jmFhKvNLw/kdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503310085
X-Proofpoint-ORIG-GUID: aEjJtGkscjBdzDAlDUY2-8bkhQDtKLj4
X-Proofpoint-GUID: aEjJtGkscjBdzDAlDUY2-8bkhQDtKLj4

+cc Greg

On Mon, Mar 31, 2025 at 09:36:40AM +0300, Alexander Shishkin wrote:
> Matthew Wilcox <willy@infradead.org> writes:
>
> > On Wed, Jan 29, 2025 at 01:39:06PM +0200, Alexander Shishkin wrote:
> >> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> >>
> >> > Thanks very much! Yeah just keen to get this in as we are moving towards
> >> > removing these fields very soon.
> >>
> >> My understanding is that this is a part of larger effort to reduce
> >> struct page to 8 bytes and an optionally dynamically allocated slightly
> >> larger structure, is that correct? Just curious.
> >>
> >> > Could you take this in your tree? I think that'd work best.
> >>
> >> Sure, will do.
> >
> > Hi, this doesn't appear to be in linux-next yet.  Could you confirm it's
> > scheduled to hit the next merge window?
>
> Yes, I'll send it to Greg once -rc1 is tagged.

Right, is this ultimately handled in Greg's PR? Did you not send to him
ready for the merge window?

Or did you? I'm confused.

We do really need this merged for 6.15, can we make sure this actually
lands? You did confirm it'd go in 2 months ago, and the patch was sent 4
months ago, and we have been chasing this repeatedly.

For reference, patch is [0].

[0]: https://lore.kernel.org/all/20241203080001.12341-1-lorenzo.stoakes@oracle.com/

>
> Regards,
> --
> Alex

Thanks, Lorenzo
