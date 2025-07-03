Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC99417A319
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560361; cv=fail; b=XQ/3ml8v+CxHkAr+cEbK2qAbWC/FKX6Grhiq2I6LBkFToGq8kNrfXt/o+INeGzEMTExnStx9pmzjsxW4yFgTtlpHJvlMc9aToO43LJuBWWVx/uTaxW894TAlfZVhLOxjH4BCrK3V7BVT027ZCDo+YeLCgudWacdh9cs1NPC1cNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560361; c=relaxed/simple;
	bh=4mYFq3WPueVWKd3E3JzMJ+qZszzj76Yco6xJCPamPgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qt6qWiaS41UYzCpgUJr/nuzokDre7LuHOpxO6F4J7hKKPTCov0IrLggNfk2i9UQfR5r/Mi4QBpOxrhYnLJ6sRz/a2cXoMEbBsOD8HR0TQuAPbarbLbOqw34NbzUtAhW1BxSG2jE8D5slepT6sWS6a+lqGKZ4kYJbp5vCVG6GRZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TPU2tY05; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=akOssMvL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TPU2tY05";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="akOssMvL"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ5LN009637;
	Thu, 3 Jul 2025 16:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Hjed1PYkij2pykgmwT
	/jCI8bjHqAY+vLJ+mPPnL1bis=; b=TPU2tY05o2D6O/Fpw8b8EVpphfTSXdcWK9
	HH2er/+O6aM8OVSSsex2tukADTP95CwvO5I5DWKJBGkHiIjaORrJF+ma7h6DBZvR
	eZNwlb99KbOfFcdis9NTuL7zSISOpA7qzbuz34ksBLV0XYYkPo6tmCgvQAi/nQby
	Ago5UEG16urSVcHTlKvBGilxAdr2aVHuwOCu9Onu6hHdq22NLUh0ZWOv7SuWcph8
	eiLcHW6f6w2xJPVwWIq2CGUgR14UvQn5zWJOvqNybqT22AJSLTBvSRgQeUZCJnhF
	r91zCbsXOV9pHbX0mPyQizWKLoIe4WyCbyFvJq4ALAe9VyOLTguw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766heja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 16:32:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FNNkL018784;
	Thu, 3 Jul 2025 16:32:12 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucua87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 16:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glvKED7pM8GLROdTocyfpNWxNOXXL7NTGJUhm83mCDUrHtWEL6U8vosE/O82EPJNgApan3sYpyS9x2Jwd4DrqF7EmftQ3S+YVyMwr+2ZzBnhyhqt3gijx6lgtpOnl9moo62aTt1a82L7dFGGpmq7qatMZG/YRay0bBHoTBAGxLz2ViiUTxFm9KM4TPqCUybgz2rH6cnoOZb/4zJhLARNcKI2zl+5QVLwYywyYsAjQzooJQlLSrZp+IzGA0DEROsIPnJbCqwBAjxXd/eXd9eA5u2eYoJdDQ7i+5qOpZzDEQWx6aGyRwtkZOUe15Tm7RgNMS7v9rv/SHS5yLMIgoy/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hjed1PYkij2pykgmwT/jCI8bjHqAY+vLJ+mPPnL1bis=;
 b=vArUyUL8xz5ivkAflM9RhLIn4iB+lMEEUN4QboLfzGSfI+n8Q+sDr6Wv59/ddE14q4vPIkxhCIQgx+mfQgNtPjGF4RC3yidyBESbbYXjCt4SmSxroreiOmxSJE6NubvFj1CEfviZ39I8z+EQNR4mDW+jRLPvsZF8UP/TQxEWpSUw7g9RrQT7C9O8CI2UWcLNyGmfriSLr/AfQ7Oiw9VRkuqd3BB2WqoAJawieEVrHnRGuTGRoi6xkbflELAOGWaLxCyEX2F+NkTXRLPliQ0Wuujbz43W4UrlgIoTmynDEzoxMKVYrXWCdN3E9UyBojQmNeuSXjrfH9OfY+7L7LE44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hjed1PYkij2pykgmwT/jCI8bjHqAY+vLJ+mPPnL1bis=;
 b=akOssMvLui2k7a/HTwcvTazt6yYPKXvARwRuxu3OT7dhHPdaU6na41rWrPpuxM0KlTPM2IFMkzApaSaKgPwxZPYfTpDisPfd3NnbBqzObUkdtCUiAgNARmod6q5CWo1TaiLfOQZEbNlj9GPJGDLLEAWiBr/mHio52g9uDHUUnzw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF545856187.namprd10.prod.outlook.com (2603:10b6:f:fc00::c27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 3 Jul
 2025 16:32:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 16:32:04 +0000
Date: Thu, 3 Jul 2025 17:32:03 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <03360e3e-a91f-48df-be38-deba327db783@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <aGWVeaz4onkGDl7x@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGWVeaz4onkGDl7x@x1.local>
X-ClientProxiedBy: LO4P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF545856187:EE_
X-MS-Office365-Filtering-Correlation-Id: 8531783b-7919-4b99-373c-08ddba4f2562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c5MTAfb6ZVqws1UNrAtpTIxLeEMc/O7fET7s7uriwvwyl4MBR8gukV6tqX5B?=
 =?us-ascii?Q?2cBiZzIX4Hs2o1ibROmPSbB5yZMOAoEtoV52N00j7KuCuYi1llxASYCVoTm6?=
 =?us-ascii?Q?aR6cMqTYiXTCy+fvl0T+Sdcdli8qIbFyTGrUPFHNdto9Fc6z4Ohwh1e6hBBi?=
 =?us-ascii?Q?j7rwOV7vkKDVZBV1mcargE7bFxIu9VLxOusve7hl5lipcnh4mScqiHFJOiHt?=
 =?us-ascii?Q?Zw3ZUoHI/LEL6Hi6qciEpY8ocQjyi27Y9aUhe43h9zMJKgjDi8O840DlQlMU?=
 =?us-ascii?Q?RCEbjQv7Jqr7HmEcbtxacp98VKNov0fHspx8iZB+cGXOOG2sAKnYPyrEdUHw?=
 =?us-ascii?Q?DjfWzoC78IoP6Qpy5AptMWuGZpPLBwIY1I/pHdlvgcxNB9WgCpUQ6OFtrUqC?=
 =?us-ascii?Q?umosUvOpb+OiSOwcW43ffP3yFuVk5teg2J4ai1De11oH07WrL+NrL/yaQwsd?=
 =?us-ascii?Q?9Vz7H2TXwbndskv3mRThVx3k2sOwaqFZLmkfbPjxsw95nR0yEziL3d3wZ8Gm?=
 =?us-ascii?Q?q3cCA/7jrhTok2o7ZWlpoLeK//5xGcJsLfUu34DTH/SEUYendxw9zgDo2DG4?=
 =?us-ascii?Q?Vo+sfdN6Bb4DpG8Apkv5SenblorcxArXmxarZDUELqiVsh1kDqaQmBP+ysnc?=
 =?us-ascii?Q?pddJKguNN50uINy8O86ckpPtKIYKEwpPy/ssz56xZIExGJrMCI3/WHXMYtga?=
 =?us-ascii?Q?SXT2DwXRFOvVZto9hYx8wb66GE3xOTk3mSHmJEMDfzYuZP+27L1eqBGoZghY?=
 =?us-ascii?Q?knmdYWdu7M+F44mKlzfj/UhtORinkiSynmXZtCulq5d+xhRUmFPL+u6HQmJ+?=
 =?us-ascii?Q?GOCQQdvzCXp9KHn0hBs4pBKPvvANyszEBGn4OTRzxfG3II1Np9fOPgG5Su1J?=
 =?us-ascii?Q?6D8M0M1p1RV/8AedCZuFsSp8G82AaHq269Iky7ERfdPQEkoorYRsjeYP+Q7S?=
 =?us-ascii?Q?I4d9tf2EjUFcla3ZyhBJgOwoGzMNQtrFy8Ge7qlyHXTBqsC6tkAUXPWuJ+S6?=
 =?us-ascii?Q?ucUSm3P+RfTx3qf9AmOpgIVu3WyjBEh0Folsi2KnzWMIYaMtxGqXVO4z6pyP?=
 =?us-ascii?Q?36CF3EuIbei2JO6OzXtUeKZwgVFszd3WMgKy9doBbFWqSWjAk+ClYcaIiLJN?=
 =?us-ascii?Q?9DSqQlCG5aloau8pu6qVIB2yhKvwPgSnWmDSe2fyCNwiYvZxhCHJYu8gpqds?=
 =?us-ascii?Q?qMEU2CNrnNohZLhyDhqNlzcgIqtqEPN8vAgO90iyF5HbTPMB4vFNkGvhjLOr?=
 =?us-ascii?Q?onjsQYNopgh5ZPMiv9/bTvuv2Ha7/YANVgkVj0WFKhl1pmen5PrYKu5lYrNI?=
 =?us-ascii?Q?5qqu76b3rIb56t+eOyH9BDerxoLA7PdPGzjjqs+YoPSYil8lFwuaAlP3s5hf?=
 =?us-ascii?Q?AIeTV5JDpUw2SoILmud6XPQmaxf41zr65RWSH6pHMOdkA4z0H9xVhLieSjlC?=
 =?us-ascii?Q?3EFrlHWMFnY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jOcSwCIGgpRQEKAP2uIJqSKbhTSRcoJxXyMoZPWZna9zX1V//bn5jRI0UK+v?=
 =?us-ascii?Q?6QBiiEvjHv8CV9j4hpCqpVS+Rh0sPlMcZAwmN1GK1xCYH0Dch05L4QlXvDRK?=
 =?us-ascii?Q?MSP4wyo9ROrkhkG0dd3GkpwJpew75eGfq6irP0/5VMYh9Eo+yOKLASkzICE9?=
 =?us-ascii?Q?E9MviPnJZs2af4/I/woIep9SRQPrOOnnrNtIFfrqN8oFCTVDJixjkW0rKxlq?=
 =?us-ascii?Q?KktX/c5lVB2OcRSkP0gEFqAAvz/1P++df4YJLjuNIPMwXr1Xpw4yDu50bj8N?=
 =?us-ascii?Q?4MEGNPT0pMPFk5xHIe2R+Cio0xLY/mj21AakkCvfNXM2fPp0kXRkEYhWd7bZ?=
 =?us-ascii?Q?0Z96WKxldTfmOFvBuIhIvzwA1iKGSZrCMnnDv7UsaH/ZVpX5vmJSuivexrhl?=
 =?us-ascii?Q?pywZtPYcbcIJc737FZCuWb/p/zdhm+7o0c/kJxordmF8O+AZEEbgccp+pknQ?=
 =?us-ascii?Q?rboeuUCu0aRCTfFcNx7k/xrhEfd+s6lCBAzLvGUQOQdxcAQrk0uEDXyU9esa?=
 =?us-ascii?Q?XeksYYbl4zLAkWiDSjLTc5Xfew/pCPUL0n2hmgk/CZ47JgCeqHrStN3NeMiU?=
 =?us-ascii?Q?Ta7xedCVagOL+pvLX2TJQZ/hsShiNaYuAYGF6bjYwmfQzsDZ4vpiOh5jz0tE?=
 =?us-ascii?Q?INl5YheaJbvQ236qMq6c1NpsF900yQsdss71qbGg4jhaiqWB4VoQa8LkDgNt?=
 =?us-ascii?Q?wmujuu91gcsB3VG3Q2OYorg3yY3wy71sB6/00Ki7OWtjj9i4+X3Yb20Xw0xc?=
 =?us-ascii?Q?/2KEuZDcng40FE+jTKWaSORYkaz+VBXn5B/5QrSGYRjkF4hH6bIiUVv2Ni5F?=
 =?us-ascii?Q?p/ThuU7OxpmH8xGhXRKPH/XslrLKVzd/JJPChvAqDHe/SgzfBRbhF2nTG0UE?=
 =?us-ascii?Q?iNDsB7G01M+YJ8xHgQ34hVVmVuiiBi8R2MOHV/GP3iFNQYGB4LKqVhnjWyzi?=
 =?us-ascii?Q?3pNa9X8ZfQKv6vM11wgO+atRWP+TcibViohcd8785D+uCrVwcg5GBEqYp5vx?=
 =?us-ascii?Q?a9f6iaZGGkpaDngPnFPZWQ3BJMnkWrn0jxJiyNyyiP7EzjqtSPQT+/6rnx/B?=
 =?us-ascii?Q?Cj1NzC3cak80JPPsW6OWS97aogZb/c3H9Wt/6SsFDsDv78neJUygnh16dBd+?=
 =?us-ascii?Q?K7Aq+LjnliW/oG/DsolkUWRzbELTs1yIdM5pNIuyX5ariJvWWK/0H3dhEZnx?=
 =?us-ascii?Q?OYeKUb+PZ8sYMqi8OAZ5+lVPpG7DFpwnIDONbuFFWqWGgmq+Edg+g6LAOctI?=
 =?us-ascii?Q?a/5seWg8EExkwSma+iL16iwkObF/LvdngICDlNwO0g95h48ecmBgwsfi5acs?=
 =?us-ascii?Q?8pbyTWmGK2Q2T5uYPyGqNTwVdxOQKoraxHzWOhp0LJV4JTQEAkiWU6B1JR4x?=
 =?us-ascii?Q?+IwQx062spUK7/Gq3wG6a6/OJFIOQlZJ5k+y9CyUV948xpUzT4tytVrZur+e?=
 =?us-ascii?Q?tTO7OH+/wWKplcv8XTBi0QprHJTweC5XNPo3BtOra/CBOs58tC4GySGmMEmv?=
 =?us-ascii?Q?tbnyMoXMZJYSC3EwzyGE9kYJd8BCSIsdF1eATJygkj/AibxqSl5wIzaJl+tv?=
 =?us-ascii?Q?2vSU6O1c7fZMzVFH9eDwgKp1ziYPasyJfIkaTIX8ARdd8I6bAWFPFuR3qIBk?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GOcT88lHu4NskvQNe1IYm3wXgMRf8R4NrQlfCITwppwytcorzUNsKEISU4kfbikIY8W8KT+JBJ17uFZ/+cpDM+d4jA6Q7GAF3J/HPi9xB8K3443H/Yru/vB3qVq5wMPwcaC5xGS0C4VxoW4gtj9xxmNB+L+PrqOTQn1LHXpgs6pLrV2sVpbpb12OSZn6x5hFDtdICFF/yuBMcVeX+yPLUplFvaM6gJIqJAxAOtr7v9gJtBjmJrSqgHeylx4uke7iC9SwavScxmhp96fk0nN6zf/k89y0+MA8wjRsbskZsPF2ARqLSOmCw8j64LFfG0SgdIcI95Y4wYOK5IP4gQ2npgbrwbfZJn0e6xlpGSHHl7OJVttZ+Ayhok9/zAhW7gA3TpAL5gBJRlJ72Rult4xiQ39KuMpLUKDPc6WMZHO4GVRHEkGyG4Ms0lkDwB+nlRofm6SBCiItKr7ZdO/Gx+Su3QgiDpBbCtIEp0a8oac4B9RhWa97NcPCdvJkdlAYJHWXm4OAy601EPw3wHi4UFEviFWps5zELDgvO/UKxaWo4A1bjtWxYhm3FGFNRPMsr4ij7EW/LJF4anWZpxYHNxTOj22UWmpZj6YOSXgeCDJ0YV4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8531783b-7919-4b99-373c-08ddba4f2562
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 16:32:04.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rt0hvjcHG/2yL+3ltMZ2n7vzSSfdB05hWxFSC7MObHR7eA3P2bCP4S5afib7I1T4sO+CV+itvRovPHlRJUMfUI2hMaGqbxMcbn0XkvMiLpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF545856187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=813 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030136
X-Proofpoint-GUID: mf8e75UDnwhrM6M1rdsjADUaJ_4lSdwr
X-Proofpoint-ORIG-GUID: mf8e75UDnwhrM6M1rdsjADUaJ_4lSdwr
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=6866b08d cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VbBbsnLoxCi7u_XFidUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEzNyBTYWx0ZWRfX6Tojly1MaPua SAdviJb3jY6HEZG+IvWVOIf063EpqOBeRNy9XhOE/e1zglhNH2qLWqrDFuWsWz118ODxQb901nQ I9fTKW4oSbWWp7/52kPANVvXeF5oW/8nV04pFBNoeeW8UabMpEw92ohE6YYIKfphggsa2/QpVo6
 uECbA1iKzn91M479ZHoBPb0NPzObxLyf5XA1szeYRyW7GSSoPtzeut/MrfcKuMpVpvKoV21OctK sEyHWUFix9An2TAPJkTMDF4zG9n+4JBYfkiSiBGsHHSyiix2RfFw2Ysqqt5NMx8WRnnGgUG3qcV PMiQe2mKUHanAs03589/JBfw9cMI+20UPOK5PX1VuYmoRIzMKtll02IacNGBf2W11DQvybWVW/k
 z0dmodG+iNulPZcVSJj3tvjRZr7ccCQs3XmN/WUPWVupeu549VRg45bMnLV1ZcMR4hncFUsN

On Wed, Jul 02, 2025 at 04:24:25PM -0400, Peter Xu wrote:
> On Wed, Jul 02, 2025 at 04:56:04PM +0100, Lorenzo Stoakes wrote:
> > I am also absolutely, to be frank, not going to accept us EXPORT()'ing
> > anything core.
>
> Could you be explicit on what you're absolutely against?  Is that the
> vm_uffd_ops (or any form of it) being exported, or anything else?

page table manipulation
core mm internals

In fact I think we need to minimise as much exposure as posible.

>
> Thanks,
>
> --
> Peter Xu
>
