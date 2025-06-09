Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6821F21CC57
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495574; cv=fail; b=f3o5314TZfwERGqqXaZs4W+RSaWC8CehKEb8rT4AulOmy6N+n/cQC7VN68nS+DzkXawMyXBLM8+K145IdBRYLeBOALKf4NsadbE5R/vUKcNn1QsO8trPf/lCYQECg/L68zmLcQZ7mUQ8d0wv4uU7TR9K54R8A4afITfAWvnVLfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495574; c=relaxed/simple;
	bh=MOic858l9VzjmNsOgvGCg4ZTIK8hKFe7CMp9TcX19zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XlA+Bi+EUqRv7jMPcvKUgwrsydV3BrQENLcXnKFOYj/WReB7xamJaOWebnUKHJfwHW0JRdodUsfD4WHG/ze6p8TNT4u3CFEMXb9AKng5FZyYn0P6uw/CmfF1dqKOiHsdHBW2pt8pWZZ7QAFbD9Rh6C1qq1le1KE9ytQdV7UR2ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XjsKdUum; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=owC3vHcU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XjsKdUum";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="owC3vHcU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559FfAsC011370;
	Mon, 9 Jun 2025 18:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Q4Gl6h1zU5VchQT/W3
	a+cGm1Ka5trCF6/HdZeV6HjEQ=; b=XjsKdUumMiZWRxwJgT/OdN86tlqKfpqveN
	deC9/nU5hQh+26bgFkvN7XH53DUmmQeCf7tEIxNridgcLgf8BLvp5aRX0VWbH9Ez
	jHlztfx3PbvSyfx7+kI5J4jzxaO32Dok9c7OhUSBPvoBQ593JX/vvBrBt3h9vSry
	4gLSOmG22Y85lBF8GdwWaxW6/UBsQ0Oxbj5T9EhjYgwywzG8r+9mwO6tHjy6vliD
	D1iUPh8ZjjQZLlZOs2ixOkl8bTHo+9fG8FtNamP3S6qp4eKFE8KpXfd98SpcjqFK
	+E3tqEcHTeVnBX7oN+YELnKr5ZJu4gOUoQlVlFrn/i9MejyyUhBg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf2t2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 18:59:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559HYGgr007380;
	Mon, 9 Jun 2025 18:59:13 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2051.outbound.protection.outlook.com [40.107.96.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7j7rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 18:59:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3WZWWljwcy0m73JqiUmjouTZ9zdszqROWqnSe/Vs+FKMnlLTTMvrwlfX+oW2v0RqJkgwBW8q/1UNkuYwKjU30VGTXD7IQPbbk9adirZKwTZ46idxuBUtmUXhC/t1YooPBRc/ZnF+cr1cGCsSSj4EYjVN3BYpX/1gDRejTGWpk9Mgdo+X++vooCZ2s0FgNMujF/wQQUJ6/CqeGImEZuebRBbgzMDJAdZYYpLc3eIxYVBkkhTAIxtaeiqul4OwBB11SjAtMrd62LZJ+pSDxJDuc4X0KQ8/1iUX8NRVBNGjBv+heXaIKXGyBBmt5uv2trOLt0sT6k3w/8aWYF3P5ECNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4Gl6h1zU5VchQT/W3a+cGm1Ka5trCF6/HdZeV6HjEQ=;
 b=W2XGw76gBipX+ezZs89jrixlbtvcc86pKiCodemZ37DQYHOy8GMSZtxvYJzZSrk5pNYoXaXwbY7j9oJ70Zqi6MfBnEHlSFqJ0mDqjdiDZ/7tC1HH6YBsep6+O09/DCc+gD1jaCs1qErj9OLiwsbAEFhLSKMLgxKzJ6CQrXn26o9Uup9hyTE7CDzI1RgaRkaxJLxwgiVWMBVa89oXX5hE9D3JF8aM3ZJqBJuV1lIPwWdsBrLpLmT9u02g2RzIioUS22WTXhh8vnjzYNAO73Np0tH2Xbd89ps2bgLCheH5SFpzGU1604MboUL612MfKMw1Vcxty5SEX2IKRPwYaehnDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4Gl6h1zU5VchQT/W3a+cGm1Ka5trCF6/HdZeV6HjEQ=;
 b=owC3vHcUGldF9Qt7ZZx6qp4Eu6YthDlKqXRbfpWmjU3JgFmpGdK68rxNHJeaNB6gKMaQEsnUmrIkespP4eAJc/aRKqjrGHJBLvTR9o/R9es7iz32hephXG1udMdSv6bU6SKUBuzdo5EjYo5O63rUDGMcOWcX3XaFsNeYnCKp+7I=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by MW4PR10MB6420.namprd10.prod.outlook.com (2603:10b6:303:20e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Mon, 9 Jun
 2025 18:59:10 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 18:59:10 +0000
Date: Mon, 9 Jun 2025 19:59:08 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+a91fcdbd2698f99db8f4@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
        almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, ntfs3@lists.linux.dev, shakeel.butt@linux.dev,
        surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] [ntfs3?] possible deadlock in
 upgrade_mmap_lock_carefully (2)
Message-ID: <2076fb41-4017-4ae4-99df-acfb6148a408@lucifer.local>
References: <6845ad87.a70a0220.27c366.004e.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6845ad87.a70a0220.27c366.004e.GAE@google.com>
X-ClientProxiedBy: LO4P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::20) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|MW4PR10MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 14257169-0903-4931-8e67-08dda787b79d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X+muW+Rgjpvt+NqdB4+HgwbhyRzq+Bu8dau18fJv+jEnhD3Cvfy5hhcn3bk5?=
 =?us-ascii?Q?Jipu4E1iU/DjfLa/B16IcS9mFy96qKKo4+RwpJG/xt3G26Un1ly9S3Ft0RB6?=
 =?us-ascii?Q?vwRvZNkP5BMwFbS4N2RNU1HSPoVa4lafOYJf/WY3bKRW3jFTgnd7coV8e9+S?=
 =?us-ascii?Q?BP9YvFUOjEcDxOTiRDVs1WijdarugJcnwECc7Dh2W3kjNOYROQF6YCFP2nrC?=
 =?us-ascii?Q?dYw2iiBLa2Ybp9LBGjFnPA6GUn4Oc1dvoEoxmeOcRkZtB2Dz1kbRuKey0pFn?=
 =?us-ascii?Q?yivZhoYFgM2P3+cnIok7Pilr7lkmLESZ8TrqvbKDIVRFz8qY5HIMUn1xG1/N?=
 =?us-ascii?Q?B7596C/EGdf9cAX2ogrr8uZhP9qJ9Ux/aBP93zDfAwGsZ1vutjt4uAIm6nMC?=
 =?us-ascii?Q?OpOlGWy3USpnVsKtaS3JOL3aVkXDKv7+TbwzRilNq7re9OaEveZkrOsEBLgw?=
 =?us-ascii?Q?F2gigyrPGN0IFKpZppgm9vZ7slRCJa3gRytyXorqnnM5J2XORukFKOLNt0DZ?=
 =?us-ascii?Q?00WInMryKSHTHdTWposzJ+ESSbqQwOoLYfHvQM+b3dV3G+de9nWhV7syBns9?=
 =?us-ascii?Q?IL5k+YHQHilnjMJW8UdxmafiopafF/cei3uGhTjYxLS6z6JFWzqCeE1IHrsB?=
 =?us-ascii?Q?mF7NU5E1X+8GDC9U4xkjZ2/+Lx/yeUbkDUVDKg5UupS/aOZXENmGauxjsDB5?=
 =?us-ascii?Q?JIThVKshh9ivVJHDfYr+xvKRsJJc/oYIplr8EbstWtk8ZZagC/o0NGc4Jeqw?=
 =?us-ascii?Q?/5DAllVM9ZXEqbkDs81/SWiPcDApOYPvcd3e7swqpKISLC92Lx/LkmyGjV/A?=
 =?us-ascii?Q?w4YV8frAN31lZjmSgU9YSF6c4qq82gagXg7rLS4hEP/uotrasSQVpuaXDNJG?=
 =?us-ascii?Q?+z/8mzj1EFqMu56N3gfJinbp1L7XX3FRyO5SZeEFEqCzha5Y3NcMLRPebH+3?=
 =?us-ascii?Q?gCl5O7I8Ts/srC5n1Mk4iu9jHK7akECQtLV0AZ0T+huMyziU4FGTkZ9J4aEq?=
 =?us-ascii?Q?BCWQ6Z8RGQCD2r7qX929yWfHBiL7HzGXG/LCWdMHp8QNdb4CrqHDlQOs4vBs?=
 =?us-ascii?Q?2p1ExG38iIxr/s11RMlx4o9glpPHUIo/vPaPPCW0UwO304TaSKG1uSlSx3iY?=
 =?us-ascii?Q?f7gPJECGMIxOppdoj2NwXuTGrIFGHalQP536oYYmKKPwQDQMlzCmn33nsxct?=
 =?us-ascii?Q?5Wp+8tpB9knadbTaslW3C4NKKy7/SlecjOhv7yfjvNgws/NlZKZ2uV40i/Yo?=
 =?us-ascii?Q?6omxBHyPo3t888KwaezZT4deq0BlnBtiCv2eLoS20h99XRIDc0zXLHe5GzMw?=
 =?us-ascii?Q?4a2PLSrADkRKqITV67AeAE4ODCgkIhGGWRH7Zj5t7tL9710hikZMSKBI7kEO?=
 =?us-ascii?Q?NVc3mFlQeivlIUpsSta2Ix3yBwo1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rl33YQzpN142iRFmGDfgd9w6sOZZriGSWUtccOfmG7BOiqoBoYl94uq6YZVr?=
 =?us-ascii?Q?rU1TdGkmPu66XlVEH7k7zsG1r3lBBPsw16CtpSQqZMCUPNpowtgsmnMEbPpx?=
 =?us-ascii?Q?FGIPD12ODrVoLfhyYRIDa44gcWWdP2BPvtOGqNk7okXH1tMtaaOMkezbLjrs?=
 =?us-ascii?Q?xHFWEoqgnReVXzzMzEJLbv6dwIG34sOm+GQKUYqNT9ljbjerj96mnBHeS28k?=
 =?us-ascii?Q?aLG2mmRiXztDKGcOJWOBdty0vQrtbqzno3F8W7jg0w8gg32xtNvSvAJdvcaP?=
 =?us-ascii?Q?BFevqqz6PKlXCLx0yYQP6TZUq7I0Gt7OuV5JMaWdpZTQItXAEVv0NHqHjnR1?=
 =?us-ascii?Q?AM7+w7BuXudVS+2N5IFDDkc1hhFh7w3B7ksmiYslYrFR6TItA4eTnp2LaXz4?=
 =?us-ascii?Q?Q4Vuhj3BrtUKPp+urVPG1A2ZLsC7XYOuD7PC854SXSBYMpKPllkh+6YEJYQ/?=
 =?us-ascii?Q?5SMBeaQYR4gF1Wi9VnSdGeoHqzT5iJ6BG+ihdqSfxxWUO2Xy9H1kWbdBYjtI?=
 =?us-ascii?Q?7yiWo6lRcrgTL5hKkzNGEoN64OBFumkhzQw/LXVI3Iwq2zvf4m4T7yim+TYX?=
 =?us-ascii?Q?MrsETv8QqyvdVGvafU2xDnPRJ14rUT7q3XHribrkd1s1y6YAEnRp2ada+faQ?=
 =?us-ascii?Q?HaK2Znbq3Ki/7npMzSOjtXnjGFq/ISHau6RO+75EAdejdxKbyEQGKBw62ClQ?=
 =?us-ascii?Q?3AOu6m9igrzyvPEwIqLwJ6E7wko1bgISMZVT3OlGssv92gd7PaBdBpSSnSRV?=
 =?us-ascii?Q?L4EA0vMYrvcaDOreJBg0ivQuMKmAwPWcTY3rvZQ067QDQAEIX7iuLLc92IT8?=
 =?us-ascii?Q?OOVUaLHLEOAmd+4HoZQYu39GP5SMmRte/6yRemPgA8Le9fGIvl5DxA5Oytt1?=
 =?us-ascii?Q?igIwJrxbmlQ8L1V26oZy+qXYb7k38P01cDXehz8mDubkUZfANMP/6vZ5etqX?=
 =?us-ascii?Q?9qx+1Jl2N08zIIhOn/AckTgfypQ0yPcxR3iN4gTDxXkpOR1H/XwywZEjKkEo?=
 =?us-ascii?Q?zczpOST8F6X3CEA2elkILnB3aCsoQLSFle2wQWpDLm1/tBY0GN4NPrdZcCug?=
 =?us-ascii?Q?3nqf9TvAoj4YI+ZygOglRuj5SZbv7dyCfYgDU/DRoM/iy5FEPu4aU+Wabmfs?=
 =?us-ascii?Q?JqRe54CcKrirMYmVMkzVOq1Sx4xmSrwz46RoVqgn7kGqtN5Omy7pz0oNPhZ9?=
 =?us-ascii?Q?iImT78ODWZ0u1QOSIqy8jyxCrt7tJ8TWlhFd20wjL1hcjAtzxslnn22qpvas?=
 =?us-ascii?Q?KFWpEjv+b+D+9s/xDKm4glhR22QPtQyHNmi8O4RUjYWdHWU3w8/qVKcq8UFe?=
 =?us-ascii?Q?XnPYjTFUOqoJnOwni6mDbPvzKjuvZUP46JDLDVm0UYblnpbiYRF0Iy2tphLB?=
 =?us-ascii?Q?gq+VgoFOq15WnHT/ojbhN0fqemjB76sY9K3tIpDHcG/+YTahvRzc1dyvuqKJ?=
 =?us-ascii?Q?1pmVYTuQOWv1dJ5HHN2kV75XWwb2Ui68hWtn98CvXHFvQv6mA4ASKSoA7IhI?=
 =?us-ascii?Q?6xbzF73M0e47/uNgnpMWB51JvkC8bTOJyMm90+35pXuLwt9qQ4L9jAC6+8TN?=
 =?us-ascii?Q?dbVw2iE8bxjK4l2I+jErbNZhPFkd6hKT6cJEulGecg76qGudoZvfv/jpjOd7?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q7gZHtvRrO8GS+V6vxndvpNKJcBKZKGdZvqNNK+x6fM01ZTiOJ5ELb7bwbt/yQZhtK2wRVyY50A2UKhNsXxLKOpuznFXAOv6bGd5pKSrL8TlJg9/sD5BBaWxsV0d9wePj3aAWXWRJkvRrQ0zsSEA/+I76gX9lr9ODEPDqOnGN5hjm+W/cns71DkZL1PWX9FZ8v16bPa0rafobWsLaBYia5pOUJE1w1KyPkJPZTzFx52Ek9g3Lu5PTYCSVW7uDZ5fzG+fjA9ZD/hYdJbuA7a/0Gzmc3efczy82JDVbpvyleTlMpO8dKK6BF2gEGeOJPJqOBqLBAgIfmo88xXF4gtdCF3Xe+fxh12eWZ6FltZFmRMKppqeZwl3cgyY23YDcBW6URhBzschQ6dZevDF5Tt94qNdEvYThim0PbZT8XTU4h+JUSujrD+aBghR9NV8XmUHHc/+NGN1s3eN05Sk2sut1vAn3cYHmJt7veRmKAH3sCtxL50uKcrGrQ/NRVTA1jPzpOVqwG3Daq2eRImCqBmrnr3LPnDvuA4ZNyzZKivFdd8YbrsUVvbaK3ZY4SNlUFuFFSPyBh3pW6ZeMmZTQzZru1N27SKDtQ02K2YNU+7zHUc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14257169-0903-4931-8e67-08dda787b79d
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 18:59:10.1355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgoA2Gcc3Tv2n9s3r07b3QXLWFWgmtCNSAUJ7rHoXpg80qMIuMjGNcfab5RUnRs1nCmfr2YeIjzVkJ8Tezti4E4QdUtH1DPZzuvYpP3FiQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6420
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506090144
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=68472f02 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=edf1wS77AAAA:8 a=3g80flMcAAAA:8 a=oHvirCaBAAAA:8 a=hSkVLCK3AAAA:8 a=4RBUngkUAAAA:8 a=za6PmfaLedaOdAskXqQA:9
 a=BhMdqm2Wqc4Q2JL7t0yJfBCtM/Y=:19 a=CjuIK1q_8ugA:10 a=vVHabExCe68A:10 a=DcSpbTIhAlouE1Uv7lRv:22 a=3urWGuTZa-U-TZ_dHwj2:22 a=cQPPKAXgyycSBL8etih5:22 a=_sbA2Q-Kp09kWB8D3iXc:22
X-Proofpoint-GUID: 7gDmIiU0q3GTrEJddTs0JODG9sOoYinf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX0JIW4pGOPU/8 sUGpQJ0mU/1icnEKBBuneTmqbogl/Yq3mjRxFPUrcCZCgYUiTtOGQQ+/x/clVTiio6p/Egl2pxs VikP3UZ4YS8YfkMoMnwOg5DrHax/P4U3WIS4YHxzhZghzwiBhjD2J1R4EHYIzrS+MsBwWa1Twl9
 V+d4HrGlg0j/Rq9gnBm+9jGvQl8awi+b2t0s8IXDijqHWbecoj3qRQWhcR/7tX+HAcluRiiemLx YL8h4kJvCX41H33l59jchJE2Xa1PuyUvMgOM7CZrbOzrEr81hLDwkcHNtSNdx50FTjdf7Jkb8Yq aZPCIf8CxGPzfYuJZoBt4fBQb2omUuheAjHYTwMgqc/qDWTR1PqUXshV+U8XvxQRW/D8L5H1/ih
 FQC2Z6ZUw6OwBGik0xxrG/5FV7+F8uldMiphqCsRIwLu4BMWHC3AUG6UZxJJlf8NBseSZql8
X-Proofpoint-ORIG-GUID: 7gDmIiU0q3GTrEJddTs0JODG9sOoYinf

Thanks for the report. I can't reproduce this locally. But given context, it's
not surprising:

This looks to be a REALLY tight race around mmap lock drop/reacquire conflicting
with an already held inode lock.

It requires:

1. That VMA locking failed.

2. That the user tries to read from an ntfs file into a currently unmapped bit
   of memory immediately adjacent to a stack that can grow to fit it.

3. That the atomic mmap_upgrade_trylock() operation failed.

4. That, between release of the mmap read lock and acquisition of the mmap write
   lock, a racing fault occurs that acquires the mmap write lock while the inode
   lock is also held.

This is not likely, and explains why we haven't picked it up until now.

So, I notice in commit 69505fe98f19 ("fs/ntfs3: Replace inode_trylock with
inode_lock"), inode_trylock() was replaced with inode_lock().

Reverting this patch would fix the issue, but apparently that commit was fixing an
xfstest failure...

Konstantin - can you take a look here? I think trying to acquire an inode lock
unconditionally here is problematic.

(Note that this is a similar(-ish) report to
https://lore.kernel.org/all/66fc4385.050a0220.f28ec.04c4.GAE@google.com/ which
was marked as a dup of
https://lore.kernel.org/all/66f7b10e.050a0220.46d20.0036.GAE@google.com/ which
was fixed in commit 58a039e679fe ("split critical region in remap_file_pages()
and invoke LSMs in between")).

See analysis below for details.

Cheers, Lorenzo

On Sun, Jun 08, 2025 at 08:34:31AM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    1af80d00e1e0 Merge tag 'slab-for-6.16' of git://git.kernel..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1653cc0c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=82e79780b034d72f
> dashboard link: https://syzkaller.appspot.com/bug?extid=a91fcdbd2698f99db8f4
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1667f40c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1222e570580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/2108968c2c62/disk-1af80d00.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/fd3b30e8c62a/vmlinux-1af80d00.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/a8aa2c824e68/bzImage-1af80d00.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/ecf486535ea3/mount_0.gz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a91fcdbd2698f99db8f4@syzkaller.appspotmail.com
>
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.15.0-syzkaller-11802-g1af80d00e1e0 #0 Not tainted
> ------------------------------------------------------
> syz-executor165/5834 is trying to acquire lock:
> ffff88803293c0e0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
> ffff88803293c0e0 (&mm->mmap_lock){++++}-{4:4}, at: upgrade_mmap_lock_carefully+0xba/0x1c0 mm/mmap_lock.c:221
>

This looks like we're just not being careful enough here with the upgrade... because:

> but task is already holding lock:
> ffff88807816e310 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_trylock include/linux/fs.h:897 [inline]
> ffff88807816e310 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: ntfs_file_write_iter+0x78/0x820 fs/ntfs3/file.c:1160
>
> which lock already depends on the new lock.
>
>
> the existing dependency chain (in reverse order) is:
>
> -> #1 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
>        inode_lock include/linux/fs.h:867 [inline]

4. ...But there's a competing mmap() that holds the mmap write lock but holds
   the inode lock, which won't get released... DEADLOCK.

>        ntfs_file_mmap+0x525/0x730 fs/ntfs3/file.c:313
>        call_mmap include/linux/fs.h:2282 [inline]
>        mmap_file mm/internal.h:167 [inline]
>        __mmap_new_file_vma mm/vma.c:2398 [inline]
>        __mmap_new_vma mm/vma.c:2460 [inline]
>        __mmap_region mm/vma.c:2615 [inline]
>        mmap_region+0x1221/0x1f30 mm/vma.c:2685
>        do_mmap+0xc45/0x10d0 mm/mmap.c:561
>        vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
>        ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> -> #0 (&mm->mmap_lock){++++}-{4:4}:
>        check_prev_add kernel/locking/lockdep.c:3168 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3287 [inline]
>        validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
>        __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        down_write_killable+0xa7/0x230 kernel/locking/rwsem.c:1588
>        mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]

3. ...Before trying to acquire the write lock...

>        upgrade_mmap_lock_carefully+0xba/0x1c0 mm/mmap_lock.c:221

2. And this drops the mmap read lock...

>        lock_mm_and_find_vma+0x10a/0x300 mm/mmap_lock.c:274
>        do_user_addr_fault+0x331/0x1390 arch/x86/mm/fault.c:1359
>        handle_page_fault arch/x86/mm/fault.c:1476 [inline]

During page fault we acquire the mmap read lock...

>        exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
>        asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
>        fault_in_readable+0x8e/0x130 mm/gup.c:-1
>        fault_in_iov_iter_readable+0x1b4/0x2f0 lib/iov_iter.c:94
>        generic_perform_write+0x7cc/0x910 mm/filemap.c:4161
>        ntfs_file_write_iter+0x71c/0x820 fs/ntfs3/file.c:1197

1. So this locks the inode... (line 1160 above)

>        new_sync_write fs/read_write.c:593 [inline]
>        vfs_write+0x548/0xa90 fs/read_write.c:686
>        ksys_pwrite64 fs/read_write.c:793 [inline]
>        __do_sys_pwrite64 fs/read_write.c:801 [inline]
>        __se_sys_pwrite64 fs/read_write.c:798 [inline]
>        __x64_sys_pwrite64+0x193/0x220 fs/read_write.c:798
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> other info that might help us debug this:
>
>  Possible unsafe locking scenario:
>
>        CPU0                    CPU1
>        ----                    ----
>   lock(&sb->s_type->i_mutex_key#14);
>                                lock(&mm->mmap_lock);
>                                lock(&sb->s_type->i_mutex_key#14);
>   lock(&mm->mmap_lock);
>
>  *** DEADLOCK ***
>
> 2 locks held by syz-executor165/5834:
>  #0: ffff888034c60428 (sb_writers#8){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3092 [inline]
>  #0: ffff888034c60428 (sb_writers#8){.+.+}-{0:0}, at: vfs_write+0x211/0xa90 fs/read_write.c:682
>  #1: ffff88807816e310 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_trylock include/linux/fs.h:897 [inline]
>  #1: ffff88807816e310 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: ntfs_file_write_iter+0x78/0x820 fs/ntfs3/file.c:1160
>
> stack backtrace:
> CPU: 0 UID: 0 PID: 5834 Comm: syz-executor165 Not tainted 6.15.0-syzkaller-11802-g1af80d00e1e0 #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2046
>  check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2178
>  check_prev_add kernel/locking/lockdep.c:3168 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3287 [inline]
>  validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
>  __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
>  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>  down_write_killable+0xa7/0x230 kernel/locking/rwsem.c:1588
>  mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
>  upgrade_mmap_lock_carefully+0xba/0x1c0 mm/mmap_lock.c:221
>  lock_mm_and_find_vma+0x10a/0x300 mm/mmap_lock.c:274
>  do_user_addr_fault+0x331/0x1390 arch/x86/mm/fault.c:1359
>  handle_page_fault arch/x86/mm/fault.c:1476 [inline]
>  exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
>  asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
> RIP: 0010:fault_in_readable+0x8e/0x130 mm/gup.c:2227
> Code: a9 00 00 00 0f 01 cb 0f ae e8 4d 85 f6 40 0f 95 c5 4c 89 ff 4c 89 f6 e8 40 e5 b9 ff 4d 39 f7 0f 97 c0 40 84 c5 74 43 4d 89 f5 <41> 8a 45 00 88 44 24 07 49 81 e5 00 f0 ff ff 4d 8d a5 00 10 00 00
> RSP: 0018:ffffc900044efa88 EFLAGS: 00050202
> RAX: ffffffff82066801 RBX: 0000000000000140 RCX: ffff88802bed5a00
> RDX: 0000000000000000 RSI: 0000200000002000 RDI: 0000200000002140
> RBP: dffffc0000000001 R08: ffff88802bed5a00 R09: 0000000000000002
> R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffffffff000
> R13: 0000200000002000 R14: 0000200000002000 R15: 0000200000002140
>  fault_in_iov_iter_readable+0x1b4/0x2f0 lib/iov_iter.c:94
>  generic_perform_write+0x7cc/0x910 mm/filemap.c:4161
>  ntfs_file_write_iter+0x71c/0x820 fs/ntfs3/file.c:1197
>  new_sync_write fs/read_write.c:593 [inline]
>  vfs_write+0x548/0xa90 fs/read_write.c:686
>  ksys_pwrite64 fs/read_write.c:793 [inline]
>  __do_sys_pwrite64 fs/read_write.c:801 [inline]
>  __se_sys_pwrite64 fs/read_write.c:798 [inline]
>  __x64_sys_pwrite64+0x193/0x220 fs/read_write.c:798
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7effea34b459
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fffba5c42c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000012
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007effea34b459
> RDX: 000000000000fdef RSI: 0000200000000140 RDI: 0000000000000006
> RBP: 0000000000000000 R08: 0000000000000000 R09: 00007fffba5c4300
> R10: 000000000000fecc R11: 0000000000000246 R12: 00007fffba5c4300
> R13: 00007fffba5c4588 R14: 431bde82d7b634db R15: 00007effea39403b
>  </TASK>
> ----------------
> Code disassembly (best guess):
>    0:	a9 00 00 00 0f       	test   $0xf000000,%eax
>    5:	01 cb                	add    %ecx,%ebx
>    7:	0f ae e8             	lfence
>    a:	4d 85 f6             	test   %r14,%r14
>    d:	40 0f 95 c5          	setne  %bpl
>   11:	4c 89 ff             	mov    %r15,%rdi
>   14:	4c 89 f6             	mov    %r14,%rsi
>   17:	e8 40 e5 b9 ff       	call   0xffb9e55c
>   1c:	4d 39 f7             	cmp    %r14,%r15
>   1f:	0f 97 c0             	seta   %al
>   22:	40 84 c5             	test   %al,%bpl
>   25:	74 43                	je     0x6a
>   27:	4d 89 f5             	mov    %r14,%r13
> * 2a:	41 8a 45 00          	mov    0x0(%r13),%al <-- trapping instruction
>   2e:	88 44 24 07          	mov    %al,0x7(%rsp)
>   32:	49 81 e5 00 f0 ff ff 	and    $0xfffffffffffff000,%r13
>   39:	4d 8d a5 00 10 00 00 	lea    0x1000(%r13),%r12
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
