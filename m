Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15F81D7984
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426175; cv=fail; b=BOKQwIZaYqzLvCHsyAlYSvCTqi+halkop39IUWDoVcFvsIaiVx+ww8IEgT1N9Sax0wjTefzwj3U6WFYPFlnWprI5Q6sJYk3zPIhQzwsEzBMBKj/4BdZ1RxdIbEZy43LpIOInn2PZA9UY4FinKD5KTx5AP4fnXkVuvuMvYe3hFe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426175; c=relaxed/simple;
	bh=jPM7e2tqh2yCG3NlD1YrDKYNl7icFp/9hu7uvIht6Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LZtyYZrZ+nbMfFu0bq7qvlapCB3Vyux5z8AHueIw6GpcwfW2Lhggd1PHE67kth27JBAgkfNy97Xe2K43edWNThl1Ql5EpFM6aQo/EefZzmj8sCJLA7qQKoei9CIuKLyWUVbuVtjugbxbZFHUGDOax/Bp+T2M+/mLUx9EBj1MRXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ax1Py8a0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xZVqSlak; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ax1Py8a0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xZVqSlak"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VBu2PW020332;
	Mon, 31 Mar 2025 13:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=LjmlzSIbtg8aFe6GAi
	U+lncUDk/+HZr00OMSN6uJPuc=; b=ax1Py8a0A24Z0NjjLwkjjEGl9ju9yay+kL
	9Pa0DcfNy3S75NlK4T9r7Sz4jhtWrhWYi9Cd5xAYegKjKsGFb76wZ8B5X1E1O4M1
	Ke7/7y3IObsdjEkyo4aKldRL6EVHdut+vRY6R1h04CfqjkoSfxk2v4bbGwntJ/NP
	exo5OoRgAnl0ALm6f2t407goJjc7VfHPpZd9xdgq6D/adETOcCU4qjbuBm+lBG4M
	23ldFHWH6Ri2Uq114AG0uKl3j5GFgLFuIL6yaOdJXGk6P1zvqvCkdXUzdoNd0CIk
	9lgRRh1l8YypNcMV/oORvmp6zWzor+aj5+sXZNjDnUhjgTMXDYSA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dtb4n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 13:02:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VD0I1k003422;
	Mon, 31 Mar 2025 13:02:42 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a7me5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 13:02:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOz/MYuug6ypkBEi3PojYK1V3m/Z1ZikeM7dbz54fbsoGLknlTk+gwjgfR/gzWeY8bdWH8eAPg4iAz/16p60n+yiD95u7HTlAiQvMxNAyvJENKLOyd00G7oGYo+5jSeV6x9ELYBxc/+xWsBfNW2yLB9OJhuvQulAFHwT9Zwayxpe0jv8/pxGni+k+kadoxmiORN8Dt5lEcvXt303AZVNtIPT7+HZHl5HisiHSzDGmaJXRe1UawA0XA+qYsMccoUlZFSiC0GrWw+RtoYQVhfxzQrfvjvDVRVMOdvJji/mI9vd24BvjUQc3K6gF0lxbgAvFzpejZhnVdvoTOFV2ne1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjmlzSIbtg8aFe6GAiU+lncUDk/+HZr00OMSN6uJPuc=;
 b=wuqqWrs7H4q31hM1mCc2mpgRyEntQy+348kUOL/yqtCkAGK2qxDOC9524TIPgqjX3l3YpJD5kbgUKvtHyjkaRdkH1AB6cUpRAb88vO4Z0PoW2qwI/LCrHnqTjaKYrW1e3AARwPODuWkxpeS8KdVXAFNtaATlUk0XB7QD1UR9cGyjOffymIkggopgMJIWlvBnz6v+PS+vicbnt9HlcWlr0099j19ExxBIueG5kRLeDlG5POuxuqm+Bg8k6BGoU4kfqk1dkSO7nUbJcWyZ473MDjEKPnOzbRT0Hcp/Py8cSiHljwkFW8QfQoz+5BS7VIvDZzUKBXGUlOP4A/fHOjC+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjmlzSIbtg8aFe6GAiU+lncUDk/+HZr00OMSN6uJPuc=;
 b=xZVqSlakUAOFV51M5JHiEo8r8iczR7LytFkJwJKFBGBU8NMUiQtYpdxMFZiMgFKuFd8vNN7XSVjpA8M4SbiDiHaL6UZF0i/UWcoKMQuX04JhpQCT+n646LZG5qRoFxORx9OZ/eOVCPhub9kX2JHr2c3+Z13EXfYLBy3BovogHuY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8687.namprd10.prod.outlook.com (2603:10b6:208:564::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 13:02:40 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 13:02:40 +0000
Date: Mon, 31 Mar 2025 14:02:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] intel_th: avoid using deprecated page->mapping, index
 fields
Message-ID: <453f2b38-7b5a-4086-8bf3-2947ab03fcf4@lucifer.local>
References: <0fcfc239-19c7-404f-bbc5-70a29ccf6ec0@lucifer.local>
 <87v7tyyrvb.fsf@ubik.fi.intel.com>
 <64514bd2-0271-4b2e-b1f5-a35520fae4ff@lucifer.local>
 <87sep1zw6d.fsf@ubik.fi.intel.com>
 <Z8drzoRVJL3P1jlN@casper.infradead.org>
 <87frityadj.fsf@ubik.fi.intel.com>
 <3a98bce9-7508-4ab5-b2c0-2493d2256c53@lucifer.local>
 <2025033131-surcharge-depict-9b55@gregkh>
 <77e9246c-5976-4661-a397-21776db3584e@lucifer.local>
 <2025033141-unwed-pleading-0f0c@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025033141-unwed-pleading-0f0c@gregkh>
X-ClientProxiedBy: LO3P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 546f2e60-1112-42ce-2ab9-08dd70545164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l/la72Bmh/ZKwIWI3PS3e3XI2tRxr1fOzCiU98si+ZnuOSY+GbQSJ7XU1DCr?=
 =?us-ascii?Q?bI8leY1LQN7T3+4quYrfMq2ltBdDn/iILxlkW4bFgM0lsgfninNPLWvwcxP1?=
 =?us-ascii?Q?ZTWIf+Ndd0hiapKI93qxw5uG4OxnaO0HhMIWTDN4touaSop4AMj0SqXoOBS9?=
 =?us-ascii?Q?LNOL79ssWpP94V43GGpVdj0eQR6C2AYw4sW79dSxXjjHeW3u/b3leCG1snLV?=
 =?us-ascii?Q?AqTRihvsAgaRPCtBDj5c8Ln29PvF3EZ1ESi5NBoVvZbzA0b5owhm2lkulHay?=
 =?us-ascii?Q?dmDhGheyPSgZq2bxqycl1U+aXmv1DF2as3Ck3sxIVuAM6gmztztxeU0fPtd9?=
 =?us-ascii?Q?w3+oBrZi801E/XpTaf1qB/e0Kizv3Kd7nVhkS0iQfkK1zoHYfWBfxPFfY7S3?=
 =?us-ascii?Q?Uy7lqqAqIcjCyowXO6zMLWU6fEhp4X+18qa2c1iX7ZB8CmY2ZbdbokMv9DJc?=
 =?us-ascii?Q?LlLBozivcdqwI0tv5FA2ZVYvrzGL5sPut7EZhhz+y92Zkc7z+WqKS2EeEbi/?=
 =?us-ascii?Q?jgFITUfgf8hONomIjuY56AjI7KlwDMcfnDy7pNcbcq8DbWKXvsTYDLFbJaDQ?=
 =?us-ascii?Q?9hBBg9ffkA7LnyGMue9DcvktkGTrbYiRGkprSZze09UFLQzqk7fznjA5/eS/?=
 =?us-ascii?Q?LcIjiC0p2JJfo3UaB6vzBIn0zOXPNDSCPC16VZTVjav8ln8wySisxuI1Cfpg?=
 =?us-ascii?Q?iK5FCY7ajKYUallaD5yNGepgqq4qoCapqCnmJrToLlm7WYffDjSNz58drW61?=
 =?us-ascii?Q?AgoV+IqYvc6swddAsrtQBh+BC+Y/tVg87VXhturnwFf7DqG8RxbcZemnEj6x?=
 =?us-ascii?Q?NyK15yJ3LvTqJ930p/0VOM6+Kz4CA0+PJohVmPr4yUbCoBtjRk9dHeaWAFAJ?=
 =?us-ascii?Q?j1ETPYfL8B0g437cM6EjzGWdXC99bw8KDz9Fwh5TP8RFrTwVd+FBbTKkosxA?=
 =?us-ascii?Q?dRmfUuDE5ACl2PSnEPFTwOTgCCfdK8mRvBGGLjQkwjEw1Y4KM58VBhsvG9Qk?=
 =?us-ascii?Q?M2OFvFe/P1zgrsu41OFNN+zxR5702n1Q+jgOhTQF41btBUb1dWXIKpB/2uDI?=
 =?us-ascii?Q?Gc7yaA+ADFu2wmoxtMrcDvZqyk2IyEtacmThlHpTHdnWEkUY+LoEZhuG2ZNf?=
 =?us-ascii?Q?N2RLxX911/7aVY/pQITW4/SFuUBzQgPz+YHjIWSg07KX0FT85HWKRVCd9GS/?=
 =?us-ascii?Q?zx+aTrP1US2sGFPJHBPGUtcdkqdZ8XD+l7kepCsZqZlrRyc+RBApWMScoqpI?=
 =?us-ascii?Q?pfp9XWGnbRoeGgQlp52SMtkRi/e7uRutNwN59jk8Uvx0LJYuB9UmQuPZS3vK?=
 =?us-ascii?Q?I3Gb9kcAGb/RhTTwq+qkdm/COCZOSQ+2vWGQPZi4SR7SF4yVSogMOERLrNRM?=
 =?us-ascii?Q?8j/6sOrXVt9tKMGDgUVBPbRYmqRB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ukNeVXtZkQ8VNIcygxaHyaLU9bBuVM/eqsMD2naw8yRbdG8orh0XhqEBra7?=
 =?us-ascii?Q?XOieEEDzZTq5fdL12LPQ/K8BNFpUFMOhfndr6AfdxD+mSD8IfkHr/r0Hf//n?=
 =?us-ascii?Q?SZVSAjYtkmw2C2QUjtwV5RIA5uaEXWwnQ6bugXjq49jHA1yjRqWsyj5F9VpM?=
 =?us-ascii?Q?H1qUJ4YqPr7brnYqH8zRg+P2/oHxVbJmvj7bqceeuUg0SSXKTOresW7de81Y?=
 =?us-ascii?Q?/621TPxeK3jiAGcDeAMOeD63CtiFQ4KDiISVpI4VV7cmN1qxFmJFPkBorfmx?=
 =?us-ascii?Q?1cdOUf3gqEk06qktJ9k0dYqJQJU5XdfghpdCvKkp2V0x5xnoIEhnDFR74E8V?=
 =?us-ascii?Q?1b7dNgrv7jnfZPmDVMkzcF3qMyV3u3eFP4Uqn6HFknUoLk2KZV/i9V6qaiBx?=
 =?us-ascii?Q?Uk3fwHgVYo7eMA0v+DS92Xcxjpz0jSCweCvfnGrbHEtYNdK/ScveFPOCU/lf?=
 =?us-ascii?Q?OWL4bSN2FMuY+Ci/daOcNZQaeudkxpd2lFrvI56yS8Pgdqb3E+2QIONQFCgr?=
 =?us-ascii?Q?Ewa4oAAxkmy1V1sbC6jbW7o9KYCdzjoytxPRrADxWaSfYHeRL26oJ6hHZKgc?=
 =?us-ascii?Q?3Kgor8JRuZjcHfjSNxAgbvnMRfijModHaBs3rMPxoaOwYSiy5kTgbYrq8Dgx?=
 =?us-ascii?Q?fQQENXD8xRQAM0qRjfvVu3PxIGrtufGoJBXL5Z38n2gAbk2kZ08cqbna6bSi?=
 =?us-ascii?Q?6F2FEjQNaTrBRerxpY6qbNoBt/1JVxR8lpDp3AgaWXDO1HVPeKgxXm7aet+v?=
 =?us-ascii?Q?CsQWOK2OSzNvlAT6Hvap4yczboSSs+PhTrswYgesoX1d5guE4sthGXjPayRH?=
 =?us-ascii?Q?FFtu4bqa2MGTSo2t9ad8phZlbVQZi9m0Ck5EkgyK+1OU/Q4OAYy88W8dIKMV?=
 =?us-ascii?Q?nznO8+kHcH3Uv4Gh4FwKUlCdjMDh0OflIoFXX3eExv1TGVF/uKpP9ioh9dKn?=
 =?us-ascii?Q?iHia+AY63Q2wf8FBYDb8PVccxTpJYAhg8/9A4vEtKn0+T7QG3F2HssqFvQoP?=
 =?us-ascii?Q?A4WqJYNYbsbTsXfaEQxYRGcnzHDvUqodLGRhIB2SedSgv7WM/3PwPMIb4XnK?=
 =?us-ascii?Q?fkHkAHzODv8HKlQ7p7nuPg1gI9KTfOP/Ush3BoWhaThlt2TyoDWHMnrkArso?=
 =?us-ascii?Q?caJEP0tL4ROxkXrMOeqxdMZcOlJoOy9pFafgnuLmCJT8hnhpO0j8oHoZxriX?=
 =?us-ascii?Q?eR8Pm1bY1AIZJKIj8dLXd9qHU77I+p9wgH0NSNQth4scQayM1AbYJBCgi9bf?=
 =?us-ascii?Q?9Qhcs8jHkmZIYOEoZzH4uE2ihukw4ctl9rJXXaszoExPlxDWg4JypY4spLH8?=
 =?us-ascii?Q?/K+MBq/Ak2hclW6sxpYVAvuQPOQ9KgZfzLXx1DLodF7Boj1C6CyZO0VS96JR?=
 =?us-ascii?Q?+l7ccENpUgtZoniVZMqQIabB8UBwWCFIbf6IAYt2+aGYRu8cX17WA2FT7Eh6?=
 =?us-ascii?Q?5vyZyTkhnfM7M5Fv64gZtduZpSiJgnw2sLkfmVJod54E9WBztFA9tAvK0cSM?=
 =?us-ascii?Q?km5K0I6dNtJCawRvHvVNd1u9VGu2+xxnLZ0Qt1nmjQYDwD1329S1bcRg6omK?=
 =?us-ascii?Q?m7Y154Sdjp0R6EGPwBhYh/RR2oBR9gQFWrkQvPxmUMUEzBHYS1v2FN+swch0?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TJ60/Q1J2N5YVYY66qSF1JGQiPLX0YvvOLsGDl8ChN9jznrCNRlEMeHhPFWWMLz1+gVuoOBQNpcKz8gpXY1KQ2C3A1A9HpPasdloI8UyRhkOlpMgZpeaXv7JHyIhZyj3C29vL69KCEnOg2WMtaLw5yRCCaKCNwu9GJ2/WqIigtAKBX3o0Ct2IdK89/QKvYCPDpfIJFszNymNozAuA8unZhu0H6UUyElKzUYbjKXFQHBNVHk5i/g7EEsXc3lzEThICo8V+TgBtjUJPNlNc9UgLiKkE3D943UaSXRq3ZSGXZI4/qq5bruuW5cbiiOvH3lTVumCUcJI4j4CU9Yo3jQ05xFfhUtrAC77d//dTu5pFD3NY+ZdZOM3El5aW0yJWM1ymAhfGhZ4qhY8uMRaxWHMjqR0HkU/5XRyNIgy8GOatUXS/NkWHJaKsxQCs6OSHnjlCEMOBuYxvFS2g59U+3yxtZEUXxgdw8IFf94IwNeL99/y4rqzbWtrPCYFz5k6yVLzzXWbNZ1h9qWTR9XSoWa1FHqKyjxj3vmU9rbReQ75/T+WzTw15Jz8sL0R0455+EcnAxjzvb6El9ODbVyo2xqagJLdXCaEejHzjzyQ5bMqlew=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546f2e60-1112-42ce-2ab9-08dd70545164
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 13:02:40.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lb3MvLLd0ZzuXD9IpXCRWI/E+wsjSCimpMls9qcagWSAqwMAJAEinboGp0R3JbKPrJNplwFJmXGfsH/H4bdM48UFOTom3z0sxpDdMiukr7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8687
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310092
X-Proofpoint-ORIG-GUID: OviDimvbu36eAq_YjA1g3xFqiH40xRty
X-Proofpoint-GUID: OviDimvbu36eAq_YjA1g3xFqiH40xRty

On Mon, Mar 31, 2025 at 02:39:14PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Mar 31, 2025 at 01:08:43PM +0100, Lorenzo Stoakes wrote:
> > On Mon, Mar 31, 2025 at 02:01:38PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Mar 31, 2025 at 12:59:36PM +0100, Lorenzo Stoakes wrote:
> > > > +cc Greg
> > > >
> > > > On Mon, Mar 31, 2025 at 09:36:40AM +0300, Alexander Shishkin wrote:
> > > > > Matthew Wilcox <willy@infradead.org> writes:
> > > > >
> > > > > > On Wed, Jan 29, 2025 at 01:39:06PM +0200, Alexander Shishkin wrote:
> > > > > >> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> > > > > >>
> > > > > >> > Thanks very much! Yeah just keen to get this in as we are moving towards
> > > > > >> > removing these fields very soon.
> > > > > >>
> > > > > >> My understanding is that this is a part of larger effort to reduce
> > > > > >> struct page to 8 bytes and an optionally dynamically allocated slightly
> > > > > >> larger structure, is that correct? Just curious.
> > > > > >>
> > > > > >> > Could you take this in your tree? I think that'd work best.
> > > > > >>
> > > > > >> Sure, will do.
> > > > > >
> > > > > > Hi, this doesn't appear to be in linux-next yet.  Could you confirm it's
> > > > > > scheduled to hit the next merge window?
> > > > >
> > > > > Yes, I'll send it to Greg once -rc1 is tagged.
> > > >
> > > > Right, is this ultimately handled in Greg's PR? Did you not send to him
> > > > ready for the merge window?
> > > >
> > > > Or did you? I'm confused.
> > >
> > > I don't see it in my tree right now, is it in linux-next?  Nope, don't
> > > see it there either :(
> >
> > Yup... we did ask about this, quite a few times :)
> >
> > Can you take direct, if you typically handle these from Alex?
>
> I do normally take pull requests from him, yes.
>
> Please resend it, with his signed-off-by or ack or whatever he wants to
> give, and I'll queue it up after -rc1 is out.

Thanks, much appreciated! Sent out.

>
> thanks,
>
> greg k-h

Cheers, Lorenzo
