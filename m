Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE00F4FA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559351; cv=fail; b=kGtbL+BVOw2wvvZJtsEoh3LkGSce9BktXP366qdCUL0Cj5BITzfSE13QuHANrArpp1Qlxoi2hm263COvPL94UMynchx1K1o75LKZS90DeUBFAz501HKZuPQGRm+Ipm8wx+AtGVCZBxvBUlUGDLuiYkxi59iOIGgPdsWQK0rpZTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559351; c=relaxed/simple;
	bh=3Dy4by8p3/QfpgwoqNrm0iDYrhDZpyKWUW+4kiggIIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E0YI2zZGfRSjJgRmtmFO7KmpR5oKMAI27sK6UzyYhSNtmiOCeVi0oRq/0V5DCtQBYd0SUrNNAzjdCyjZFpkohiri78MaEymY0nq74uCTKoJU4ej/+1MTBS/TAfKUnMFBASc1/RUt90K2V5VKx1wm+nbF5CgRFmrezH1Fc8nlZ/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a9l4NC29; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dgGspZ9s; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a9l4NC29";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dgGspZ9s"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ7ju029177;
	Thu, 3 Jul 2025 16:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+Qwbf96LUeLBAN+FZh
	+oteLrDuwcR1CIkTX8uArRQHg=; b=a9l4NC29YSuwF9gGIb6aldCW48hqQi//TH
	VSqQa+vLgLyTKgRDLY7iL4GCtHTzrbv33n8x9tpgt4xaUNRxGihGqkq0bGC7+Tfi
	PTnd1E5mkmC7XOJ7+RCOnb4qt0r8VwxTHSBD6G0sbH0+KDyWuT6cNEPbOBupcjp0
	fCRD4hokGHH5GnOw4zQ8cKcXhuAVDtyCS9OISbpciUE4GTA1Gi3+Ve46vHR69Jhq
	ZDZdScGhu6eQPYnosARlY8UtXagZy+9jcPQjiqyR/zeM6L9XvlPQ+ywkYKbmaFE/
	RmWMKRfIMG2weuZ8dSGaFRI1dRpuu50juMfrqRBPEc/cahMhfaCQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704hdua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 16:15:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FEQml025010;
	Thu, 3 Jul 2025 16:15:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucw59k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 16:15:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbSwcdJcDOc0fokskz0fIfXd+0nLx0jfJCa2rlyr0oKyPRXnhJ/tfYwm4SNaqI7imjEmC5MmpyHJxM1f2uKx5Zk+Fc9lJmxIcl+RZmLhF+ZahYxd70kmFozQCkV7HFNzg84/6mm0L3oElIWetZv9/cd9+fincMQhttE8UM5FAhoJQlPTT97Brm0b5fLHJDHb37aJvj4AbirQZBxUrzjXG2e/xoVwf28Cvr2KkWmTr2hB5D2CKsfREd1cgdFpvV0Xg/zxzXMyOzRp5mexAUvFjUBppPH2V0sIO+3M3ENimMNmjX8n2KkxfwylXTutUfD91wJdUvVLoi3m9qTIVkzvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Qwbf96LUeLBAN+FZh+oteLrDuwcR1CIkTX8uArRQHg=;
 b=XAnNiHE3T8hNrEM2jwPqMIPmP5IVTn4VOudQ1gR/p4XCjZvwIEPI/HOxsOQbu0Ib88BOsH4+kNE14nTVFLwqcznRo/OGPZ+dUqUD3pzS9N2xCKNSI8NK631cP2mRFFyBZ5lSGA8cBrsk0g1ecsDbrMjNl64O6U+/2cZttLZ4ifbw/qR8hVFSUS+MFKNvE97XpLwOoKEWKrmd/gbRbmrMxrqMqSfxD1QiU0C2ctNc7bZ646n91jaB5ey+8JhGNDSIbQHVy97tkKKW9hcudm2DRwE2KQQgcSjbG+AwpX2ebsDziHAOG7FTet6fR9V/jsKMvl5tDGvgAISMWipvu7z+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qwbf96LUeLBAN+FZh+oteLrDuwcR1CIkTX8uArRQHg=;
 b=dgGspZ9sJfitzVO4ev8xrzxjm5MH70Pc1jLhRMdzLgI8vB7CKhWf0stvapUNt+SAFsApmBIt8m+Yrr0eXFIINfHPIoBuf6vjM7gOBm51f/+XL6P+2pmwiY1W6xFNkYwa0599vuZxM+tw7H4cEjI8+wCfj57DQ6dlndvD2Rq9EbQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5115.namprd10.prod.outlook.com (2603:10b6:610:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 16:15:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 16:15:16 +0000
Date: Thu, 3 Jul 2025 17:15:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Nikita Kalyazin <kalyazin@amazon.com>,
        Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <5231b96b-db1c-48b0-987b-736bc90843f9@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <rsumpavnbe63jvfz7w63batked4obgnzmz4boeee6q3wiv7smi@rkok2a4vug72>
 <aGWmZKwcpLMfAN2O@x1.local>
 <htdtwazk66dcrfkpwh5fgtk5ruzzo2zy54i5w6kbg45lqtyect@tt22z7hcdfnx>
 <aGagpUkNogTxS7dk@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGagpUkNogTxS7dk@x1.local>
X-ClientProxiedBy: LO4P302CA0045.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: b94ae281-ac63-4e0f-0050-08ddba4ccc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tSKWV8vu4E3buXe68cLxqhOzrfMPGgEmx5zuEipmTaPCbvORZKMnpn8e0vdb?=
 =?us-ascii?Q?fhhXquDBGlswJ28F8xYtUez9p+9RKo2jYl50nEANLBoBXtnsZYzs2BpgU6m3?=
 =?us-ascii?Q?HHfBYvRfeQG4l5o3YCvNycGZT1SM7HWGTF/zSdXuR63W9O6YRshtFVC6buuR?=
 =?us-ascii?Q?iiMBdQlf85/cSTszej4RjiQTSah+UPSRHaCPlo9uoyPOfCcbeH7AyvbrNfnF?=
 =?us-ascii?Q?qgONRHHTUj2pD5hqY1cZqMFHnN1LQ2PntJPYDRwlmN+6reDd4Fpb2VwSvS1j?=
 =?us-ascii?Q?CyY3DA9/mKECS3s0Kgl6Drkxub+6n1WDZk5fhsb85PpKEDQui6fZHDBjmMxh?=
 =?us-ascii?Q?82c6nMlKh8D0pkjuZagEGbtkP/LxOrqO5bN0QWedR5qlo5dPpwWr3XNx27hd?=
 =?us-ascii?Q?Q7o1WjNB9DmSHEb2LyxEB1tLorsT5/3kcAXvntKbKRHDLtfIsPsHjiyJcY2Q?=
 =?us-ascii?Q?90VEQu3SlN/S562ZZoWgoQH2l8dYVmj5HwZdvkff2E7vKu6j6Tt0uGhBzjEw?=
 =?us-ascii?Q?xgwLHL/xEOf9sJIB+8TNEUImOmkdw7hQuT1QHYJEEEM1tmx7bZao2d2fDr0Y?=
 =?us-ascii?Q?y6QEzsrTZ636vmJtSxygryuEoQm0RaX5ORMDZyhWczqLBDLrj91JCXvc1qUZ?=
 =?us-ascii?Q?By3dsBsQy/7MarztljoBwlrfqgdrqHYJqwhBq3omf1zWchqIWp4Rqm2BiSYP?=
 =?us-ascii?Q?F22TygYlEXEkE6ke96LeAJQ2xkCQxG0XDwB0+3aCiBcqLWvJiknCLUobEvzP?=
 =?us-ascii?Q?98nQngim3SdIkD0HrZz59zp5skf/9Bg1WyyVuijR1FJqHZPEQFG515jysNqI?=
 =?us-ascii?Q?so++Egq6OHrIT3yiDDIsGSUjhbck7yUTd56tnKvOS4/y3zjNB3ae0yJibiCD?=
 =?us-ascii?Q?ZYU5omJhgJtiaFznkhW/a7BFYPBiluLP1FLKZ+YvHePSBt31xJnZq16CPqiD?=
 =?us-ascii?Q?T/huQq/dsPwpbEKmxVgu5o6tS9jPoPeFECdMB1e9IU2oHix2uWVCWxY0j0Vm?=
 =?us-ascii?Q?z3+KYjZzIFeJP0cSvwF+/cg0kfA8cz871VgFGyk5ZspI1BFm3oviiVzRgM8z?=
 =?us-ascii?Q?Uz+3LXJ03LLJLdbbNPuJaKS5d0vvCOT3xNYuGUAkBNvdqzFzEaWDSAe9shLp?=
 =?us-ascii?Q?hQj/llYiLxuf56VvZ4qvToohMPIHmy23qe2jbOjaNmQuTpteJmWzgSerrSLD?=
 =?us-ascii?Q?RzF4m0ZpN2C9+dns9JOagvmqlacKqAFRjDgwGqXyffVfDxkQ7oZ+B0KEV8P8?=
 =?us-ascii?Q?n5kU0n4Mz7o5gw7B9xP9eZHiY6BTjgEgmDokE1A/uRAUCAxsJFsJhrIBWUiv?=
 =?us-ascii?Q?xqCRcX6u2zvenaQq+bOkc7H0tMnYbwGtAV/SFlHmbdAhaRwJP1tTw3YRa6Ba?=
 =?us-ascii?Q?nBWNqgewEJ8cQDd6uSs/8283Aw/iSbjzBzKPaNOo4jghdkj/QZpOIdknXFFX?=
 =?us-ascii?Q?vgaKSw5Ujzo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ynedsd9TROpveeVd9h082jr6BV9d5zImm9dwm3WlFpqJO/V1lPx/tClin0BX?=
 =?us-ascii?Q?O1YbC832rPWb24MSvuOq3MUJ75iv0KBnl1tpz20lo1Zim3YcwG9+ul6AoPCb?=
 =?us-ascii?Q?mdZuVueMaCZppGy5sIjtQvdB437yfQTiV5OqZiaSsHgpl/Qcg8swwWarwVqu?=
 =?us-ascii?Q?6YNGZTja68xWJ3AU/JpnXWYyfWb2Py8QOTTJGdouOX/yAr0mB5JxUmBoU5jW?=
 =?us-ascii?Q?M4wNOhZ4tO1iaxTG8WoUusQhjjoUQNixc3+y6v1o3oeehAcr007XMB+XQYta?=
 =?us-ascii?Q?0P5njAnCrt6zNu7eQ/Eizf4fhKOxrONkhBhfAErZLYZQXJMtI/S93KcVEEst?=
 =?us-ascii?Q?qDCwtfHMlyUGbwFh0fRbOrNv9czzd20t8o838+hUAlLyY4uzuoJv+dipNRZM?=
 =?us-ascii?Q?ER48MMq5If8TOFom69ptsz5kqNNjkCaYxDaJmqIbE63mY2Dd5ToHRwE2tDXr?=
 =?us-ascii?Q?yBO5i5dZu3HZYF15ZRRVA4DBnXiYHqIEVnqk9eenOdb49hIIRLksDatX1is9?=
 =?us-ascii?Q?PVuph9bzB9WPs15YAyIOeNFwVkrj6ElE2g0sttltw2QjuZitkdp0qXXhEfc/?=
 =?us-ascii?Q?QQBlQsbowXE72nY8f1JzLXpDP/G7HDL46puDv6XHcbzQTQ+EkSd+syMjGZCX?=
 =?us-ascii?Q?+JgEXaSiXvcijBdATjba0Rav/5WBhEuvhEpR/BQB7ZqVvglw6zAzIOuJI+h/?=
 =?us-ascii?Q?GjSAXQr1Y+ixpSI7Ibkr1z3ogdhNsa3fMHCrHk6dq5N+3hPFkL9yycfA0KS3?=
 =?us-ascii?Q?zvk3GlVnoGSDXOigbSMoCt1sg6tim2t7LaRvMox3cFxHiI7OWAMctI141WWZ?=
 =?us-ascii?Q?XQP7tu4Q5EPR5p1dIXfdr1bOXEO9ZM9b5yUGC+oNCEisNZGs5BS/exq2u/ih?=
 =?us-ascii?Q?YLWqPvYYK//uKXlO1d063kj6k3fKnzYikECOJ9lftjPjjQF0tX0LyzsZz06J?=
 =?us-ascii?Q?RZ/r5l0vYOc7huExuKfNrlTidcCM2FdGcrLHhv75lbHsD7cPoE7yiukpfjjJ?=
 =?us-ascii?Q?9JhXayCAlhYgcCwefWJR3jD03UNcS3rPrEpv2Wj98iYz7OXZ3IujLDQ2qHz8?=
 =?us-ascii?Q?o/OJAWYGEa5KQAhEB0z9JhRhGglRV1RBIKy5PfHPUflFgcgfuZNeEXw6YC0z?=
 =?us-ascii?Q?pDUvigP0f8mYKkpMJFbc2Xk1dYf25WA6LCUacS7rXoy7VsiqfObcNgpndXWj?=
 =?us-ascii?Q?eQHV4I8OCd7JGMlI6ZfTkmUOzJ0y0VWil+4d6R6mvXikklmS9OZxBVgnjxW7?=
 =?us-ascii?Q?BQXQlJG4S0fhppk1naS3xi1ouBJ/9WEdkK5K/41x+H5rb8rqzl+2DO4vu8eR?=
 =?us-ascii?Q?BGsdmRltDEiUMChqLu7w0oCe2H6o9A2KoLH7E4uyfFzDpZpeXdmD+/9v0Mnc?=
 =?us-ascii?Q?EkbKER3/h9lApRx/5AFROwZvp0dI+1NpbmlD0CsO5Lwaqd/EzI3FglB2QfnN?=
 =?us-ascii?Q?ls0T0t0RCCCR5cnE3UVKDAKdUVc7HkgAOBnbvppdrWO4QGx8bLzZcbhta2x0?=
 =?us-ascii?Q?xKdcpOG7J1Mzh7gzcwpdFMIIUmZfX0X/TAorH43gsoG4xPHRIG9469WICofE?=
 =?us-ascii?Q?UdwBoiVJkxu5Z9In/N4+kW0XnzOVpzR5CucYz2lS30vyrrklnr+1z5GDQ9vl?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZX5FCUp9YQC5XRBIMWh82NaxtChUf7BH8PuWl0eNmtBDOVN8P7UmPJ6BuhpstJHACC5/GF6JyWQxfH6fLFi5jx+qdj+GUGqucqV+loDoZPwE7T2/7YYvO03y/YvFAgUYZtSd8FjoPW2KSXeHSO8HspNH4H7kIkI/kK8iXouJdahwQ95F9DsKnlJaewPwfTXzPi3U80aQEA97l1sA8DVTi6ALGWNhaVUxr/Sd1YLh6US1h5V8n2FnWFadcqb+i28sE71RcNpJIytmHlB9JNei6505TdXl2J42n81LP1BvI+GGtG3lKE7+htKgDkAOBpLeh9CNC/onnnSVCAmMSXQybCSl1BXGRtS76fUPoiR8fmG42wQx+94FYRKYkBJ6e2vSebXYx9iSqxxQQraYL+FKWe6gsVjwpz+alC0/MrrEb6XqXoq79yHBp1tRmFR9cwRI5UK0Q3WOXsp7ErTvlwuKf+MfnztCT0kg2POQcwDMYms0oilVfXz8UTqLGLUZq+atUxHAk6jwII+i29fpfHs0z1Njk7eCwDXNaO01QuzMxIufcULbXagOgIW3ZGpJJrCZIngUi04523QOHPdB2tfGBpoqiz9PAT72JpM+kj8FFXM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94ae281-ac63-4e0f-0050-08ddba4ccc69
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 16:15:16.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hczRMTiK2n7jeZkkeFFcw80H/jany06xa7YY8DKO66po7uGQ3pG2tFtkl9Ub6M5Ukgfn5IgTuliuILaoGMCSGmeBgsnmQ84g4C908XDe21Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5115
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEzNCBTYWx0ZWRfX4ImrXahqQmew rYgQjZyoXf7JcsiWD+WYMarfDQhc4ynlNd5ehUGrLA2Q8P61x8M9PDAnvBmuH6nOl3KxrQE+QEq 1R4PHrkPvmuzX3G0doA5QQMN4vXsvpIh2u1s4k1qHLVXEeJ8OPrJSjANXc5KyXHeb6vtXMSII/u
 +mYx2sGF4qI8vrw+U8YGsqxUXUoCwwlIlcZmklY930uNx+NP9TivCtUFjDNhDCRFJ+N4wnTwxzt y8lrmppWmY01A93XP/8S8WJVmb780vFPn5RAN2Pif4YRExTNy5goDDcYqI/Oh1m8ZA+G9iH5M6p EHcNwTmHxNrpXJhgmn/5kZGAuBcCsm7tAYlpt6DLng3nFM3KLM5OHH9fFdhFm49FQDsOTsd7k9v
 RDHmp0RPDXYGSvoMmitIqPe4hDBQDozjfDRfs0fcc67zBeZdtEZaYiwMWduE/vuQRoBPGpin
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=6866ac98 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=LY4zg8RYbgwotNJ0-7kA:9 a=CjuIK1q_8ugA:10 a=gmshbCpD-_wA:10 cc=ntf awl=host:13565
X-Proofpoint-GUID: i44_gqwWA6ilIUujlNK30unRR3CClrYN
X-Proofpoint-ORIG-GUID: i44_gqwWA6ilIUujlNK30unRR3CClrYN

On Thu, Jul 03, 2025 at 11:24:21AM -0400, Peter Xu wrote:
> On Wed, Jul 02, 2025 at 10:00:51PM -0400, Liam R. Howlett wrote:
> > * Peter Xu <peterx@redhat.com> [250702 17:36]:
> > > On Wed, Jul 02, 2025 at 05:24:02PM -0400, Liam R. Howlett wrote:
> > > > That's because the entry point is from a function pointer, so [3] won't
> > > > help at all.
> > > >
> > > > It is recreating the situation that existed for the vma through the
> > > > vm_ops in mmap, but for uffd.  And at a lower level (page tables).  I do not
> > > > want to relive that experience.
> > > >
> > > > We are not doing this.  It is for the benefit of everyone that we are
> > > > not doing this.
> > >
> > > Is the vma issue about "allowing vma->vm_flags to be modified anywhere"
> > > issue?  Or is there a pointer to the issue being discussed if not?
> >
> > The issue is passing pointers of structs that are protected by locks or
> > ref counters into modules to do what they please.
> >
> > vma->vm_flags was an example of where we learned how wrong this can go.
> >
> > There is also the concern of the state of the folio on return from the
> > callback.  The error handling gets messy quick.
> >
> > Now, imagine we have something that gets a folio, but then we find a
> > solution for contention of a lock or ref count (whatever is next), but
> > it doesn't work because the mm code has been bleeding into random
> > modules and we have no clue what that module is supposed to be doing, or
> > we can't make the necessary change because this module will break
> > userspace, or cause a performance decrease, or any other random thing
> > that we cannot work around without rewriting (probably suboptimally)
> > something we don't maintain.
> >
> > Again, these are examples of how this can go bad but not an exhaustive
> > list by any means.
> >
> > So the issue is with allowing modules to play with the folio and page
> > tables on their own.
>
> I understand the concern, however IMHO that's really why mm can be hard and
> important at the same time..

I feel like you're dismissing the concerns altogether honestly.

>
> We definitely have driver code manipulating pgtables.  We also have folios
> or pages that can be directly accessible from drivers.

'There's already bad stuff going on' is not an argument for doing more.

>
> After all mm is the core function provider for those and there needs to be
> some API accessing them from outside.

The point being made here is what are internals and what are not.

We don't expose internals, we do expose a carefully controlled interface that
minimises risk of things being broken.

>
> I agree some protection would be nice, like what Suren did with the
> vm_flags using __private, even though it's unfortunate it only works with
> sparse not a warn/error when compiling, as vm_flags is not a pointer.
> OTOH, forbid exposing anything might be an overkill, IMHO.  It stops mm
> from growing in healthy ways.

I'm not sure what is healthy about no longer being able to make assumptions
about what code does because hooks are being invoked with drivers doing
_whatever they like_.

Part of the purpose of review is avoiding making decisions that cause
problems down the line.

>
> >
> > If this is outside the mm, we probably won't even be Cc'ed on modules
> > that use it.
> >
> > And do we want to be Cc'ed on modules that want to use it?
>
> For this specific case, I'm happy to be copied if guest-memfd will start to
> support userfaultfd, because obviously I also work with the kvm community.
> It'll be the same if not, as I'm list as an userfaultfd reviewer.
>
> But when it's in the modules, it should really be the modules job.  It's ok
> too when it's an API then mm people do not get copied.  It looks fine to me.

This is ridiculous, we expose mm internals to modules, and then no longer
have to care when they break things, or a subtle thing changes in mm?

On the one hand you argue that in-tree drivers can be 'monitored' +
therefore it's fine, but on the other hand you say it doesn't matter what
they do and it's nothing to do with us so we shouldn't care about being
infomred of changes?

These two positions are contradcitory and neither are good.

>
> >
> > We will most likely be Cc'ed or emailed directly on the resulting memory
> > leak/security issue that results in what should be mm code.  It'll be a
> > Saturday because it always is.. :)
>
> True, it's just unavoidable IMHO, and after triaged then the module owner
> needs to figure out how to fix it, not a mm developer, if the bug only
> happens with the module.

Except it impacts mm as a whole.

And it is avoidable, we can just _not do this_.

>
> It's the same when a module allocated a folio/page and randomly update its
> flags.  It may also crash core mm later.  We can have more protections all
> over the places but I don't see an easy way to completely separate core mm
> from modules.

Yes if modules absolutely abuse things then it's problematic, but the issue
is that mm has a whole host of extremely subtle considerations.

I documented a lot of these at
https://kernel.org/doc/html/latest/mm/process_addrs.html

These details change quite often, including some extremely sensitive and
delicate details around locking.

Do yo really think module authors are going to correctly implement all of
this?

It's very obvious these are internal implementation details.

>
> >
> > Even the example use code had a potential ref leak that you found [1].
>
> That's totally ok.  I appreciate Nikita's help completely and never thought
> it as an issue.  IMHO the leak is not a big deal in verifying the API.

I think it's quite telling as to your under-worrying :) about this stuff to
think that that's not a problem.

You guys have already made subtle errors in implementing the simplest
possible use of the API.

This just makes the point for us I think?

>
> >
> > > >
> > > > We need to find another way.
> > >
> > > Could you suggest something?  The minimum goal is to allow guest-memfd
> > > support minor faults.
> >
> > Mike brought up another idea, that seems worth looking into.
>
> I replied to Mike already before we extended this thread.  Feel free to
> chime in with any suggestions on top.  So far this series is still almost
> the best I can think of.

I mean if you don't want to consider alternatives, maybe this series simply
isn't viable?

I made suggestions in the other thread re: a very _soft_ interface where we
implement things in core mm but _configure_ them in modules as an
altenrative.

That would avoid exposure of mm internals.

I really don't think a series that exposes anything even vaguely sensitive
is viable imo.

>
> Thanks,
>
> --
> Peter Xu
>
