Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E9C254AF7
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191554; cv=fail; b=KomP6FbHtY9k9ogwmpGeKUEH6PvQ+nzWnGMTxJXSdx9aTnYjt2iOIh95j4jyq+AMzh3LyJ91G5wAyRpcrp9/qvK/xQvD7Bxk/pOW7TfGwl8WCFyZpaLglwFbj8xT6+l9Q7jXgoeO24afJSY//N7f9KpXfjdVG8zSpcPDfyCYGLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191554; c=relaxed/simple;
	bh=xswAtoXzvChyigtTllIn+N0vJfYte2k5NKtFsQ5jbOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ryr0onis6pZv97WscShhrBBS4flUG5G1+4n9/s+bHnUcWggbr78pIOb/m5XFDK8I/wwAgrYTtMlNfv8RoyEuPpKYY+FSLOfV0woI7mdABi5kLK89x4oDHuD9bVGhrdwuAairj1uBOs+xu41oyxa9x7o3DuPC1i5WTyFlAcXYtSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rTjn/zJ/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vQN1SrPR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rTjn/zJ/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vQN1SrPR"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5425WBB9002723;
	Fri, 2 May 2025 13:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NCJgFAOgRRX4foyyWL
	AUUbQRSRcF5U36AtH78wP9SnE=; b=rTjn/zJ/TcWyFvjjPHKdFbyqDZAKl51ij2
	3fXDzcxUsMZL1rGzHvQhkqidx+/sWY5bcEm3ntXT84hKgT8O+j3HIqreGCle7vA/
	/ZoYcSozvecx6UPLf2UQB+/mc9A5XHoR6htt8quG7WVVXDW9y+lauGEmqC2JrPRl
	EZZXgJGYAXexw+1x60db4fYeX2sZFxTM3Z4xMvLCAyDrTPcxZuaqXfrqZH9uy62H
	5AG2Nv52AdHSsy474Nqgua6bdyjmZddZf6jJ1gARntnbJpyzdo0V9Q6v9L/zeOEI
	ivCefV4MFi/lGCb9SFa2EokAgH42coqlj5X7gaB9kmxxe38+DIng==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uun9qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 13:12:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 542C3U7S023728;
	Fri, 2 May 2025 13:12:21 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012039.outbound.protection.outlook.com [40.93.1.39])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxm0u7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 13:12:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sw+24kfx46YwYkoEpHV9RqFmNaOiuaPtdR67Ra21orMMrKK8rSF4QFgXewTG2m9aJJo/+i6LxfMTCA1FfMS3CUuLjzn7wILGY10k5Kc8wceL+rEcOWcnM7XfxQgmSguyYA5g+DnnLTNheogyuIc1zikXtOVgbf2ow8oNWsJwejDEtiI3FmFIKa+4VqJ/c74xvmoxAaerBGvLXeaSIm8llBt8dqFhuc3atIbjh8v7Uqs8ic8PQrhKcTjL54Jxbdkkqaa44EW4CIYst+bBkcnW4yblyjmQeU0HBLjWArxqROWPm7L6SnRRMVpp4GLXb/E2vGcv3R1SOesY/De+Yy8zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCJgFAOgRRX4foyyWLAUUbQRSRcF5U36AtH78wP9SnE=;
 b=WGJbMRTw8VBfMZIANEFqecX84ZR8qm26wxeEj8lIfxwMdCvyHGT/YDVGCirTr4d/E2WOZgvsuJFLI7bEa+9WmDBXs4nbMlUTtxXCwoPmq1dNHEK8RQMSCmZ0AUNpwLGuCkmq2w9dZngB0C3Yjc9pfqzSY07lqp0IqhyIB+QHTygC0dayyIBntPMHVxiyetBrh1MiJbZ/lsxiyKKcA8iIK97xcp1zuV6zZKKd5agRSRgmEtSy5MpV0R/jLZ1sUs+ZLPGfDQ7iLFmy/sb2zJ4uPu/gDuvX5C+JBFBhLS2dNjYWn3vao6RGScuzIQb26cmZ3orFj0+PgGQX06BTy+rzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCJgFAOgRRX4foyyWLAUUbQRSRcF5U36AtH78wP9SnE=;
 b=vQN1SrPRGZS7D4jbH8IbBItDEtaWNUGUnyeDMWRzt4OkHNda0Oq/FllkxrVfaxRZGO0IgVUfOG69hlmILb92T0SQugMHp1oSA3SMxpbPZLcPGEADWo4J17kYv6blccJ0RCRmhmRhXo/vNQ4q7DnV84n73Z/NDeHibRR1dC5ckpA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB7265.namprd10.prod.outlook.com (2603:10b6:930:79::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 13:12:18 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 13:12:18 +0000
Date: Fri, 2 May 2025 14:12:16 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Ignacio.MorenoGonzalez@kuka.com, Liam.Howlett@oracle.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
Message-ID: <3de8814b-9964-489c-8d13-feb319623b82@lucifer.local>
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
 <aBTCtOXBhUK_FLU6@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBTCtOXBhUK_FLU6@casper.infradead.org>
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3b63ba-0429-4d6d-21a1-08dd897af731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OmzmFMIyjDIJrJsoWjbDThzWfvsK+tJS3Uwr+0+Eal2msjqbbM00U0kW0/Ll?=
 =?us-ascii?Q?WpOWP+5D6okNGsOqxW/IUrauoi7FdogmJsDcT/FlTRRL7LCuVvcVk3OOSpXo?=
 =?us-ascii?Q?70kNwOsvJg07GzTJdb2gqL0J4WG1EpC9M1UbIh53tGsrm8iYfZ17P7m4l9XC?=
 =?us-ascii?Q?eziM99WCU9sxFXMZkklmbYdXFlr1VXNhAnc99Wm1DQYXt2X+aQSg5Ufia4VP?=
 =?us-ascii?Q?5JgIQfIDy9DfYwPWTRx5EsiHp8vjizBuhPpIFILickAWe2//mGDapuALKG2J?=
 =?us-ascii?Q?vWnenod/IG8e4vwXggYMJm7DuHLZ3QI7RwqIrNHAsVdTaGyjIquUmRtdnGKg?=
 =?us-ascii?Q?IcjXnuO1uTcvCqGB/ykTFXdMBKZxIFupX9/8TfYO5GImywwIvV8DWLaYQLRT?=
 =?us-ascii?Q?/gd2VPO8nKMGHYVcN7RALJYOggXySSVT8NtMwBCQJU0J0uynp9XSZHDQZ2nT?=
 =?us-ascii?Q?ODYqo7upysLPuDjpmrJ0jYFnC+s/oPhoXa54mDZCcL6eMQ/SEhRgy/Zgyb/x?=
 =?us-ascii?Q?YNH+XqYv/R6dLqKMRw2FTx5MShl5swal3bwTD3yZH5V01O2mZ2pCVvD/nX8G?=
 =?us-ascii?Q?bmNmOwhRuQwJswRE6/iO/BWcXWs4L3jtDzXq7fFcDzLOFrC+DcgfMEI/HAMK?=
 =?us-ascii?Q?hO+CbTMXZg6QOlUC0r98TVPugTa0LYtKxYX+goSedd38pBfLpcGxFieEWlfR?=
 =?us-ascii?Q?RMTiTRXIGQMUcwqcy5iiNLfw2JHOcg1LbOKsveM0cYaGxGMFAEzSPfPy6fCh?=
 =?us-ascii?Q?9MvT3+M75smhArpwwQ68/kr3kDoyf3MqAaEvgSic42g/7HkTClKs7uzVnCD2?=
 =?us-ascii?Q?UNwS9U+e9Ct5/miYchSIpbyEsy3SxWGEhXhcnLx+OvY4m5WBvWAttgVvByMa?=
 =?us-ascii?Q?FH4fqbdVCAT1URS2n+boxJOGtIGKkGojfh7Aj0V7TNt8UrPWGiUkotXjZluH?=
 =?us-ascii?Q?r1EyKSBhNhH5dyuKfeIX5IJv9TS7mLm5LgYxjC/UYA6QcWLylGAmlqk1xpuO?=
 =?us-ascii?Q?yrrHfdR0SnwYDcyl7FCdN1NA+tT1CEcVtb3p/Ti1HhRwvA/fEo4GIDcnsNA+?=
 =?us-ascii?Q?GmmvYQ/2n3mPT0zVoU7Nji4OLLvC6uT/DehWsj5urYtx8MPNsymnF/5iFbrD?=
 =?us-ascii?Q?lWqeDelVeQKpHDmE3RLNlOFihQNeJ2Dhql8AroJgclUg9rj89FkHDO/8lIeE?=
 =?us-ascii?Q?unYa7VX3rHukoOLI1XEH1AcOztO/UyhnKwdf9LkPXYoq/57fx9fYbhisr5c7?=
 =?us-ascii?Q?KT15ye7eT6pzz9A0RPCQ85K2yTS16/Twn9h95EhDEH6ydLnmj6TDb+nPBI3q?=
 =?us-ascii?Q?hEruFkBnQ0QRgR33o/uwUXjMKh1Cn19jgltvFakg1qpNOjBL2qfhE0yvoG+9?=
 =?us-ascii?Q?qH8HJX1MTFV/1pxIlbwwej+VlcOmKpP/DYnDKZT3pYyiQ8SqrN0Pno9vJ1db?=
 =?us-ascii?Q?kODTEQB8gGc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mgV23dZ4O92suL6H5XwDyDPuS2SSaSChCJuEwLX8cHruQQpmWGbiYDtQgo7l?=
 =?us-ascii?Q?ZySw8blxoHpuJtHI8OsT4dkQVvT/pMHKPGsm9qnjyx6GjanCeoX4MbJVk8CT?=
 =?us-ascii?Q?2qqOaXrKMmcCy7IQtg+hDRoPs6cp2iKhQeeiv+YAdQJcDHxoHmiJRqsTrFoI?=
 =?us-ascii?Q?QKqWERcUdpCiKEHMa5IyAilYsUJeiSEd2zC+Pe4Amj/JDvj8Vtqs0l99e3Cz?=
 =?us-ascii?Q?Q/UVFkqZCpt1mEBB5l3LXIvn8ToBB0mS6bnBnieKzZqdJZJMwwwt9v6YrdZ3?=
 =?us-ascii?Q?LbudbIF1XHGspte3+F5ggbF4EztAILvZqsi4xjRpaZXB5ECXY/VsxW/EQiZK?=
 =?us-ascii?Q?EcXaK+2NW7PHMjtgWs3GX38tMjVUzs0LalH3O2yRdwLbmZYBGYKfqYVRUJDe?=
 =?us-ascii?Q?niJBc9nn8CN65cOeqolQFCvqf06pqZ+ucNUVuCm3z+tOPKtLQwOGvTvbZUnT?=
 =?us-ascii?Q?802chxoSy5wcSbo6gHww8vQtnVV1JU1rjdV+BrrKlKUm1UKZusmWFj86QS6b?=
 =?us-ascii?Q?VBC+Z1GPMKR3hLzIQ2N65Dqxuqc93lrE30dNIA+NiecsMnxGcDi7yk/3KcuN?=
 =?us-ascii?Q?A2vKfB3uOyO3Akkti74zOQPRxmU6IdZak2AZShEu9qgyBlbgGS4tQ2vwUEpb?=
 =?us-ascii?Q?qfnuSKQwPuIamRBl0A5HgKz3hXsHS/dfsOf95fr+1d0AyNsBsZuaLxGHKF9L?=
 =?us-ascii?Q?kMtEVDwLNWzJBTZHMMaJS9U7lCtYDsNKAaxrFZ2n7Kru2epz7D8QTPKY9Sx4?=
 =?us-ascii?Q?2KBd5m7YdHb9L5m4CR2GwE9/v9mT8LwTFT3K2IVltFK8nJczCv/XHab/oySv?=
 =?us-ascii?Q?x3I2J21o5P+2D0C4PWakoYXhiQV7Dfp0NiG/iTBVZZh7ORVHS72nYsrXnB6f?=
 =?us-ascii?Q?AbIP8tezHlDrFwdsi+innJCIIz6NQeZA87VMPupZ6ATgeeMLLtDBaYfMkP24?=
 =?us-ascii?Q?uksh8lebG4X/Sr5oxKNVTbbHjVF5BTJRAzNSVpfHDp3zmh5PwtKmU8b4y+HZ?=
 =?us-ascii?Q?DjnZcAv9VdjI1bisB+PausaMuCEEtQBplPOMFPnFBn4IbBgU6lMrn/psXd1K?=
 =?us-ascii?Q?BU+o/ueyoOaRfm/NQcOEwo5SWEAsnpkP5tnEHa04A6u67wlbTWSPe3awBeZD?=
 =?us-ascii?Q?UfEdI1GXa0CfW95wRbTBd16I6mLCXP9qqt8HOWJfr2x0W4blICwGvTEyi22H?=
 =?us-ascii?Q?bA0RmU7WZCyCrJtzOU8EO20aosbYzXoqrKj4rKeeCXAIVBzUr5B1D/n3ESEL?=
 =?us-ascii?Q?zpi5gzWaamsrQurDBKcP46IsGS597m5ruoZHCtMwkZSrU1PSKZ1weZhCQJHZ?=
 =?us-ascii?Q?tWnampEzVIT27WvzozMgB7sPZA8klc9wlA1o5X81osGkSiDu9+ZRL/Me0KPs?=
 =?us-ascii?Q?VGqdMkdz8IwNFl2sq+nVyOOSeeHwSgkjkkZw6hKNXbHwasmR+oi6Jqowl6OA?=
 =?us-ascii?Q?GrVghm8iR484/WfZfvvzH9O40FG7IMeFApDgtqxRZ2y9EPsoxtyLch45JGxQ?=
 =?us-ascii?Q?R9AKN22Ki8HICpyP4hCT/fvrsuT9vrabOimnSoUaVDX2tuKbz+1ND1zoZpX8?=
 =?us-ascii?Q?g9B4Or4lW04z8nMB0FU8dT4eO+W6jCJuVQXEgaFNfl+E/YU2o16fnNevvOjl?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/sOabX9IITOdAdn063oAH3F6K24bRaBZVP15fbmBIw7xu6NYAHRaPSoWUePI7MEq5T0qqgoXjB2HQjId3SKo5rMZdLlx9U3UAEzzocvBBwX2QArnJtrzCcybl5dTmtqvHckdTKi8Ns2bYOUbddF1D/MnVXfbVR8KkpYZ3ared+9lY+L5ZZP9Ob9052Ka49x9x+xUCcMDVKP46Nj9iYZSaar9B+bTQlA+vw16v7P9g3/7z7jJpL6YudT9QLDhybFb/KAAoLwc0AYbMXrzkmQSCM57hQf35gCQaHXUWk/dupb6XkC4s29OkB4yrfMUPEoN93LiQgyLiu2KfY1/QHv2cx361KfC7DurWUhPfLKJqXYQ7LcSYRR3Zlsc6nB2M1OwmSH65Xr+bUw3hcci1jt3dUKJFNdQvQPF0des+a8ZqWNvJRZD8l9j6q0VCh5ymFsavPjlTx/t1pYFYmaztrHyY6XYJNmwpIFWZlBctQ6wV0oQuJXlVi0pQnOoxi74kXAuqoekW33a3AbP4REb4Ichh7YqtUGp6DZ6iI5UCVhgHlHqbJkHj0y3yCOb3b2Jib7Q710fe3ODzlLpenpLUzal9a5QikGV5hC5dZApdF/4eqw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3b63ba-0429-4d6d-21a1-08dd897af731
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 13:12:18.3469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIGS5iV3ST5D19wjx8ALLIGWnchrx/tIlA0IXNab7LDrH0zsZjBfPC9J4LxBys4yogu+WD+o+rZX9VxkbcdCH3zBOC+i6p7FQ1U8sKkM/aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7265
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfXzZ0OdJMWWsIV 5yWcfakkImre1jsSZRCbHWPlry7nFOqoeRihtoPg+/YyDKD66OZf48B7nI0+sx9cc0ppsW1KszM sOwa+67fSpPMSvxGMALuqmK2GB4gURpeYgFj5VQ1hd5dadeeQZ+7xjW5Ykjko6OyBXUIdH4Qvnq
 PfIq4I+HiAuL81VVuPLTb1n0+j2ZOCAnM43lMeOcxk6ogp/L0PV67E7TPVLNXVTIeTGnd68WQCu E/OZc2Baa5316lYyvnn7jH8OmxOYUzllJisP9qJtx4D0KUQVOf+XSjcHlFyQMUM6ypWQgFLkkpS Ir9QezmJeqXkQOf0x9P+1pON0OQi6461jj12y2jAZaChZ7eMCcZ/7a5mg7QKQ9FZr5POjWKX1ts
 XWX27/8u2HM/s/AfpTeHCHzmFBhAXe6F+1hKT57YDCWc+bFyaAsPEJKYoRqFO/3Gjvfj2dmV
X-Authority-Analysis: v=2.4 cv=Ve/3PEp9 c=1 sm=1 tr=0 ts=6814c4b6 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=TAZUD9gdAAAA:8 a=nKKxTX1O6c7vVNDmn_4A:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22 cc=ntf awl=host:13130
X-Proofpoint-ORIG-GUID: XipkUWxi4CKGxGVmwpvDXiHComXoB7F1
X-Proofpoint-GUID: XipkUWxi4CKGxGVmwpvDXiHComXoB7F1

On Fri, May 02, 2025 at 02:03:48PM +0100, Matthew Wilcox wrote:
> On Fri, May 02, 2025 at 11:31:41AM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
> > From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> >
> > commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
> > the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
> > CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
> > VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
> > with MADV_NOHUGEPAGE, an error is always returned.
>
> Isn't that the real problem though?

Hmm, but wouldn't we want users who are trying to set MADV_[NO]HUGEPAGE to
be made aware that it isn't going to do anything?

And wouldn't changing this be a possibly 'breaking userspace' thing if
somebody somewhere relies on this?

Also this will make this inconsistent with e.g. MADV_COLLAPSE also?

I guess you could argue MADV_NOHUGEPAGE with !THP is just a no-op... But
definitely not MADV_HUGEPAGE.

Another angle to this as well is - we are causing these VMAs to have a
pointless VMA flag set that presumably can't be set any other way.

So I do think the proposed solution is right, and is the least impactful
one.

>
> +++ b/include/linux/huge_mm.h
> @@ -596,6 +596,8 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>                                    unsigned long *vm_flags, int advice)
>  {
> +       if (advice == MADV_NOHUGEPAGE)
> +               return 0;
>         return -EINVAL;
>  }
>
>
