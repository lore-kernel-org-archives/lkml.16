Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98778F43
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747055459; cv=fail; b=h6fvHMNop5d2JGKqckCr/ZU/nzyuVh+y79EgJC9kbI5NtBNymxKZlh55dLgiVQrFPDIRBiSTTtbAsyWjZx97zbTBYmqrJ5g1f4cAPoSz9ubZ1srYqReoTPkZyuh7jOnjI2HsraNfultH5x5nSEbvKfc1zIyviSxpxygGdWK4wSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747055459; c=relaxed/simple;
	bh=TvhG9DMDTByOMZ1Io8RZlz7k4DmhNkOmTbETMREwtwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ELdDY1UiAXjTUpSmRBN6UWa4meWwFrS6EFZuFhRF/2dpn22otRoXojF27YWFYnbYhjQs7rD4YbJSJ4KKzUYM3vUdagRMlpKmuaYuzwbjC3fgSS2FJBC39kVYwtkV89V+sJH8lG7AJxP7a1afIcH9fz7kq6cqIDQjC2ABMZ9y9xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=leIuKZFQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l28vzcP1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="leIuKZFQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l28vzcP1"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CC9dDF027145;
	Mon, 12 May 2025 13:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TvhG9DMDTByOMZ1Io8
	RZlz7k4DmhNkOmTbETMREwtwg=; b=leIuKZFQWsWe6EKprKYjCzKvAnBXrtkepS
	eLGX/X3RcrrA0lUO2q3Aqx2Mpf927FPEXQq50u5nOdbV/elKeb+bwOEs0sullCYS
	QKrBhbHHLhXRQccGcW3xAHMubvpIfeVrGQ/Jr1IuFyxK6KMo+PTbJx9kEU5TJPzx
	Mj7ErvIoHv0Yla1n5W4XGySSmE3F/No8UZ9ZyuxTceSorPvu2I8JJw8uievo9obf
	ImBU/CCt5KoLuB5Z3vXCI7m2Zuq/j4SG7L7rb3mtqSsP1M1naPP7La361MHIlsPF
	fuRXbVWp/1sXz+OJlwsQYcMJmuWlV+6tGObjZmtMRDwBe7V3Zb5g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1jnjfty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:10:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54CBiDxo016012;
	Mon, 12 May 2025 13:10:46 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012010.outbound.protection.outlook.com [40.93.14.10])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw87c2r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:10:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSkZV2mgtZJPxqVrXDm/9qDda2BwSrHkO8xoSIZnRaljkTnh0FXzZWnrhhaRa6n3P/Zo2H2UpfwIT8dYaTfVgBcGOuRDKx/Gf+qMH9oXxztIuZr25qupCuVQvqaO6sYNPh9MsT5wY7p0yMjT9EV6BSRf7EGwlMJ4iBZzSkTxEMOcKkWnAUxOAdlinOKHkC1oLFt9yO1Dq0ou3GAFyxboiePWsNL9kDDSQgLNyrgrn7OI/ukAd7GhW9nj6Ag01xkfRvg5wNazmrEX2Eqm09mAuR5OWrDMyOI1gTh4wkdlDxJfTTdPqaJJfRwlMwdeIDxKzY/sN8j8qJmve9LE1RO/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvhG9DMDTByOMZ1Io8RZlz7k4DmhNkOmTbETMREwtwg=;
 b=nSUdKnew+McHiNEE5a8HNdvLTyY2UsYA/CcCfAlxa5FgkkV2addASZ7ob+PU3cNVK5g8HKFl2H73m99l/PTbsouY+fCLL4YJUD0m+UMaQPycWIcbD7L8tR3lgfRiisNN5lVItzNpA4VFEbIHiBMQZCmoSe+4UNu62uWnWeHl4SNpyA3zZznKZCrzxZ1az0jcJTVVRoXRTd0QcL+nZpckcooIL6u5RwnVTL/ss0LuWpIREoF1JJSXx/iNz89Qz0KH2uHWCSPj0sdX3OPjdztdwPQMAD+5nXvtWvYxiyBmDWSiYwv0MCkKGF2812vt7BRgSKagtQPMQw9gCm1lZXAoLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvhG9DMDTByOMZ1Io8RZlz7k4DmhNkOmTbETMREwtwg=;
 b=l28vzcP1ucP3amqqyPxmQeOjC92YcbSx+HIEF6aKhE83LUWb3roG0P4CNhSKmHMGeCVzmIcGFOXC68aXl7xBsfBUdwqTTiIzCH9trxO+1StPyU+kJzJf2mGbRA0vGMsG1uWSnrYARqE5waB5lEVOVeFNz/9cG7zIPzYqs09KwTQ=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by SA1PR10MB5868.namprd10.prod.outlook.com (2603:10b6:806:231::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 13:10:43 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 13:10:43 +0000
Date: Mon, 12 May 2025 14:10:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
        Uladzislau Rezki <urezki@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <7deb77f8-6ee6-48c9-a579-4d76393c0532@lucifer.local>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
 <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
 <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
 <eb2b0bce-6012-4019-8ff7-c35c24ba7aa1@suse.cz>
 <9AF9CF7D-D4A3-4D97-9B7D-F259E33E982C@nvidia.com>
 <a6789c57-af54-48e8-8be5-4ae2aa43e9e9@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6789c57-af54-48e8-8be5-4ae2aa43e9e9@redhat.com>
X-ClientProxiedBy: LO6P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::19) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|SA1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a177ec4-310e-493c-5219-08dd915666f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ta1dJhClna/2uRqQ3KmnEfWupfpaSytMv4wYo8jq06SIGoB/kcBucd6rQ0aI?=
 =?us-ascii?Q?xWyWXOZhuda/9JrZAR5QYnObKlrZCcHnKXp5TQL79d5JfHivDX9Ss4kuyuYp?=
 =?us-ascii?Q?Ck6uxgZEljivTsphO20iegGCSLkiVe981a69Ie1Wz7ja+463Ci/UUxhXfmhk?=
 =?us-ascii?Q?sMS4r3WqooNHeOcfYX8/4zfSe9z5VjDps7mny4Su1qL6eDr4vJNMGAI4mUpN?=
 =?us-ascii?Q?4mOI/onYbg7rXlN4s7xHtzWG4yqWWJiDAECtYr5AV8o4/cVw19g0Bkx+K/vO?=
 =?us-ascii?Q?iUEtGwgpZMwIU8J+W+aqst6gv2QtB3fbrT1WMsfpxQ10OrIasgurQG12cGbj?=
 =?us-ascii?Q?6Q5GNALFaSupowF8y+ue9me37uSwu3ot7eK2n0yKvlZJjd5bVLe5WXbvWdot?=
 =?us-ascii?Q?QeSZyAMty8M8NQFtYU9sEbiE/AXcFZVQ7QC4Udj3rEXTDimKL5o2VoJWf4+n?=
 =?us-ascii?Q?EogJo8IXvhFCPErhK+WMp/Lw6bwItmiWtzaiclMZr//A8HHwVYVz+UCHYIsB?=
 =?us-ascii?Q?xLTS4BxTKxbACqdYxra3RN5R3uBWGwZQVpAbwOHaOOFMJP/ffgRDjLBfrl3v?=
 =?us-ascii?Q?Q3qJ0ES3BrTVDWcMAeSJqZS3zs+jglj+fuqDyc+ZSFR9YtrXdg6HbAPxY3qf?=
 =?us-ascii?Q?i0aJBv8nOBY7pAb9luf3U7KVzgFGqnT1dNYTbNGPLuFQk9ewl7ZJfc17/w+F?=
 =?us-ascii?Q?Ftg7VyBSuTz3EqDwAwS90ZeQ6tZA6hopm0j0yEgARwFQmPcQHmvy5GKtPzKu?=
 =?us-ascii?Q?9WbDUBcAQ+RJIWw3tLhh0gzTr6ZdbakUK115eoVy9QJZfSHfjMFxXjfHyeLk?=
 =?us-ascii?Q?zsrF2mVuDHkLoBMaJgkPSDIkjYKGikhKoc9pyXNivTQnCd7KxwxGgwaOFfrG?=
 =?us-ascii?Q?07ea7rmF/unwQ28lBMwOO+OD9JYUg+/LPJ2yaG7BROUfY0hdzHxmxE9zA/EI?=
 =?us-ascii?Q?PJF5hHivXorb3fjtl8NagVGLgh41hl9h1UEbuY7Y5CFJrJ4wAusmeVAAS+6Y?=
 =?us-ascii?Q?l/+d9jPNBhX1/LE2JwdW6XId/ZWW2/KDM2VoslAtJW+xMYz3agso4fnNbJXC?=
 =?us-ascii?Q?R+h6Rxetk1mKwuueZJL8AUXDYYeY1PEwp1wZ50lrp1W02ZRJkUjnQuZqCJmv?=
 =?us-ascii?Q?lrVBwRwhrgRJR+yzFdJlcPZBg+ZcXfZz30xQmM1JrL811KIlhADVqiPYfnBd?=
 =?us-ascii?Q?Uuex3Z8JY4QfmN+0Gla4ixPplxcgN6eANBrQrXKGoyh//3LiyVOfw1qwtoC/?=
 =?us-ascii?Q?i4pzz359wlu40tCPbV+e8HdN56UbRO6giMngOyLrV3xmFvE25H71Daf3E/vL?=
 =?us-ascii?Q?R0tCDtw1p/3tGZfaWlLAsOgCapTnVApqNXESxMBpJcGeSR/wzx8Ou3K62/PV?=
 =?us-ascii?Q?bl6yygh2YzJtPrqMZeJcAC5FF1NcDzTHUJdFBLvyHk2xZlgIkjxTj7JZxWlN?=
 =?us-ascii?Q?bczwDlwr/WA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MiDrCnc+qw2l+lVTTZxPJ26SXBDLvltan9x4XIU1C4/VAuyvdrSoXuzRegzj?=
 =?us-ascii?Q?wFIgGsrs6qR8qtMGgVyU7/wbzyA3ZvrYVTWKnOBrs7sLqEnI79bpLAR0kHtC?=
 =?us-ascii?Q?gJ+6fCQAnhVm4E3wcu9RmT4TCJ0wQPfBxZfnIRFHyRhu4AV9hJY7/wPbRWtQ?=
 =?us-ascii?Q?b/zkdhqQhIc6+j+ENCS/idcYvqz4pBotrqh/IQeJigXEiyljbKZTSEnN7cnJ?=
 =?us-ascii?Q?/lhDpIuo6fiSBUicpHusOAq5ACW7HdIKD7hjFS1iwA1WuRht18gmjSRIQvbt?=
 =?us-ascii?Q?mgGG9g3rzPxbHGGvIaY5XD+VPumHxzVH2kfZt7Nd3NLF3r/JZA2Gf+FaRxvO?=
 =?us-ascii?Q?GLo0NteuH3nGwL8EzOQe6mOxgkxhi7NaF8Rs4MkQvOq4rwRBMrquR8e0JvNu?=
 =?us-ascii?Q?HFKJDnbqbBCqbY/zvkEq2CqEq3ngUWsI2DcFwdbuWn1KmxxRCo+pYyXYbkTw?=
 =?us-ascii?Q?lwqUNv6PQqwcjopRWqAYBMtT4f1X1GOU2CK6lr73l5I70Z5mBHhHDbzZf/rO?=
 =?us-ascii?Q?EAHcuZgG5TmIc4QhVR12wWtrfs0u3Nn8zyqcUnz00+nd4TCdLoIVjaFFITyK?=
 =?us-ascii?Q?5Z+jQcBOUvOCSPPTHTT5l618SAHOI+xiaENyRHlI0bYVFI/X03auDIowtJr8?=
 =?us-ascii?Q?2P2AbYgNuH4110+2TnCx51y7K7sVulPzzRuqi/s4KXTE87H76tRi6YXfAdfp?=
 =?us-ascii?Q?pCQ48/To/jEMnsLWZWTiAH1M7sajye8LWd8totxGvF5PBemp9tXRSKoELKrd?=
 =?us-ascii?Q?C3BGzPXRuSUXoBDhe1O8TC6kyqLlY6DxkLqvaHuH8EV8n58kL6m4ObxpCYeW?=
 =?us-ascii?Q?NFvBWZv+LqfG6iLixRgMDFLxBxccI3K46vM744k/gOKcOvO9thg3skqZ6ro1?=
 =?us-ascii?Q?PhMtRpzH9482RzMnE5P9kOAH99pQDy5Xh4Hmbu6uIx1NzbaNnedq+moeeD/K?=
 =?us-ascii?Q?jxmSgT/MWmN8lgBxFJ5UVwa1+ygFLS8EVkIRvxud36z9/Rz1Z6+PJM9GOm/0?=
 =?us-ascii?Q?KzN4L/ZALlSeCsvVCak3WRa4A2PkvnnV5aEddekvnDTXiM01vY2MbKY0IDwQ?=
 =?us-ascii?Q?M6uJ44mGc7+vyEdSg4Czh373V+mIrjKFBYO1MzbNn4XYTygoNaJL5YjFdFIT?=
 =?us-ascii?Q?Dhg8+T2zg7UfcjpG0qbBE0uULqvW6nFtZhEiLT2/S79k9/Li+QmR3ZXs/JZy?=
 =?us-ascii?Q?PJhDyBB6PuejNk6085Lz3ILMhTn+u/yl14bddOMaDFl+KFNasiQh3sPVdwqJ?=
 =?us-ascii?Q?uZbINfNuLTzfTK/V4wKwa/0jj1VKqqbUCNEeQKGJeXpFgsRuOqBpy0ZrDysS?=
 =?us-ascii?Q?ezuYcLCucFtimX82dYLTyG/7v3WyEsg+EEcMdm5f1FtbtwzyyREzC/OmkcV9?=
 =?us-ascii?Q?y233y+Mmv485rApjAH50AX9QwLaU2xzfm0DANbkYmr7PbfKNMFAm27o3BLDe?=
 =?us-ascii?Q?J1f1H4dQ7KP/PhJFe4/03qWyocHedwz6HOdEpfTPP9EOwTeJGZkNcbyu47dL?=
 =?us-ascii?Q?C5KbKbPILixlwkgJXKglit0GJyKkm2QVx2FD5CoZKm/0jOkaQieeJlztyKtN?=
 =?us-ascii?Q?aYIqrj2AOZK35yypdzCIn8pla9zC9PPlXFDYI9Yx3FYg5KXIAxUVaraad3ec?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1FuhoXYw6IUI1/KLXCv4Yy/6WjeokMRHlhtbm1LJKmD8dZVXa8RRqSrzgTjW9SgFuVH/QpE/oqFXvBfq0D7vWrD4vdqPac5Msrf2h9mN9Gs63z9oXsmtqVdbZAJfaBqlSt6NoVPyQzRnbBbp43F3ibCne9LJ00os8YhirPoQgiHedtyGa6r1Afaj8ML5FcScc7zKAIHDTBjg13aW/HXf0lHgTyEITd5yEKsen8zx9mRyKyqAZSGcGngq5+MnqFdmsroUiEwMNSnuK88eqtFpOBY9+lvurZErKGGbR7u/iLG1L1kTJ8PxnHaUF/UAok95KWdVGftaU5noAlDkQsz6Erv+0xOO6u072tMVJMd7Y/CPBwEwI/D9I0dHptuQ04LbQedrppj5bHQJdSvU0fv7gcBIcrTZ+oV3u0jKjxnus9ffMjkI/rdJsk5QghuQLsqRV332RtPRRWMLMr4nkmjyhFOtKydK/++nqqhze2gXrCbuRMYj7mJfckHcdCR3gXQovZP6a2SpIdEm6OttuSKdG6f0yKjSZsiuJ96H4DFMd2rc2hg+ELGL6v5eTTon0A179ab2NMugmJ7FeVH+v57jQDK2+4c9UPg0aobcHC3FJKQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a177ec4-310e-493c-5219-08dd915666f4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 13:10:43.7762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9g18EIjco0Cw90nFPVrSMhAf9qxRMupYYnLNo73kbOurEeOujWakgBN5ni5AOpZeWOD2pLNWIa7F9k+q5gGiHUTORmTSbqSLqFo/eE9Lh2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5868
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=927 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505120137
X-Proofpoint-GUID: X4mh8KwoyxNd58UT_U3YXTuPJGsi8q2j
X-Authority-Analysis: v=2.4 cv=PeH/hjhd c=1 sm=1 tr=0 ts=6821f357 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=FGHRVB39UJLOZTzGIXQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzNyBTYWx0ZWRfX8PFz3wbNRfYY 6ycxs7bvjQGaGrwPU0t+i4FFq8ybWRbhNof+X9PFPRirYLWjwP9K/QOSUAqnbbWdBE2j+/iRSIV UvuSdvoRaqZPq/e+Q7+a6IAtPE600lVVIGZ/Is3gzvqSIT4VUBT5scJOKQl5bN7W0/NV/5bW6AN
 tjS8VG5MjW9ZkmPVSNM3X0JtAGZFp4c7jZLskaboDEolrh5nMe/l1mdFYCKkIa3ECJ3vcAUAQUn Vyo163Aguvd5xi/sWIhEOF1cvHEYNQMac+bGLTnXBPbOzJyNVSTRi/5iyKm31jwgjsYzdA3QohL edT/bxdPAEkOhQNCNyucoHAJc3xKNmGg9AcFQwuSklO0rW1dN7o+BqVg1YJwWJvRcSp6EE5yd6t
 0wuRqIu2WXamILCy2sN1V0JfSd0MXL+htS7ztARxL0kQApsKMIIUM464vJgRsLOfC0Sl/JXY
X-Proofpoint-ORIG-GUID: X4mh8KwoyxNd58UT_U3YXTuPJGsi8q2j

On Mon, May 12, 2025 at 03:01:30PM +0200, David Hildenbrand wrote:
> On 12.05.25 14:54, Zi Yan wrote:
> > On 12 May 2025, at 3:38, Vlastimil Babka wrote:
> >
> > > On 5/8/25 14:23, Lorenzo Stoakes wrote:
> > > > >
> > > > > M for "PAGE ALLOCATOR", hmmm ..., I was hoping that Vlastimil might have
> > > > > capacity for that? :)
> > > >
> > > > Vlastimil? ;)
> > > >
> > > > I'd certainly support this.
> > >
> > > OK, can do, thanks.
> > >
> > > > >
> > > > >
> > > > >
> > > > > Not 100% sure what to do with
> > > > >
> > > > > * include/linux/page_isolation.h
> > > > > * mm/page_isolation.c
> > > > >
> > > > > (I hate the word "page isolation")
> > > > >
> > > > > They are mostly about page migration (either for alloc_contig... or memory
> > > > > hotunplug). Likely they should either go to the MIGRATION section or to the
> > > > > PAGE ALLOCATOR? Maybe MIGRATION makes more sense. Thoughts?
> > > >
> > > > I mean it explicitly relates to migrate type and migration so seems to me
> > > > it ought to be in migration.
> > > >
> > > > Though migrate type + the machinary around it is a product of the physical
> > > > page allocator (I even cover it in the 'physical memory' section of the
> > > > book).
> > > >
> > > > I wonder if our soon-to-be page allocator maintainer Vlastimil has
> > > > thoughts? ;)
> > > >
> > > > I'd vote for migration though to be honest.
> > >
> > > I checked the code briefly and although migratetypes are related to
> > > migration, it seems rather page allocator code to me.
> > >
> > > In fact if I didn't miss these files, I would have included them when
> > > proposing the PAGE ALLOCATOR section.
> > > Zi Yan has a series on that topic now and is one of the R: in PAGE
> > > ALLOCATOR. What do you think?
> >
> > I agree with Vlastimil that these two files belong to PAGE ALLOCATOR
> > section. Page isolation (actually should be pageblock isolation) is
> > doing work on pageblock migratetype, which IMHO is an important part
> > of anti-fragmentation mechanism for page allocation.
>
> IIRC, it's a bit confusing, because pageblock isolation as in
> mm/page_isolation.c does not have a lot to do with anti-fragmentation in
> reality.
>
> All of these functions should primarily be used for memory offlining +
> alloc_contig. (where we try page migration afterwards)
>
> Anyhow, I am fine as long as these files live somewhere related :)

Yeah, I think key thing is to get them in _somewhere_ vaguely sensible, and
we can figure out fixing up this kind of thing after :) which I think
aligns with what you're saying here!

>
> --
> Cheers,
>
> David / dhildenb
>
