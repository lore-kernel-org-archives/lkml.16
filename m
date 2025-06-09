Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E22163BD;
	Mon,  9 Jun 2025 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481135; cv=fail; b=UUZHE/Uf+SfFYcK5liDX6seu31EEivVhsmGrzAAwq0GT/X+OOyujKtOAXx48USw5sk7pqr8txF/v/zkyd8Dfy6YjZX6CdX8E9R1hxXzPSHfHuhTJ9NdXerbffMuxFFU/9X69BS4fZaTRm9x4s1QCVYy8kfaw12Klx5cvvhnpbvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481135; c=relaxed/simple;
	bh=3DrXIAGCerEKYT281cjvxqeG9onlUe/qboSOVoHkjc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D+5547CJXAMDsCNaESpRjUNlmoub3qpjOKqKKAcrqYyxh8o+vSsh9BYVuJun5s6+W5B9iCduUFra9Cb+WAgbgBvtT4FWk8fnLzupx3rpVTy9lEc7wnFRpGmf8fTk8K8ee3UfxvxZQnS/Flm5xpLXSNCG/H0VMS8hcuSFhkNXdkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fY1lje3U; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vq5MwcA/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fY1lje3U";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vq5MwcA/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593fk3M008071;
	Mon, 9 Jun 2025 14:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Y0dhAKS78SkOzpZXZU
	9ussrOMHkfYkM3578tUMuLCSY=; b=fY1lje3Uf/oejK597mbELQ1mcpC3SbdHEF
	5cuRmVAHE+nCwyBwOfL5peAV5+EdwbUZcTRxplzYn2r6pR3WALsF8bjsjFvw9JsF
	OQAAdi/ou50ntWNO9+vnmBQHWOTnAPkJxDDuWh2wEUal8iw0OjtvpPrvhRIJRSPe
	Nylpkoh3m0muCRUCz25UGU2q4NxDXzlqyba0iZAJPmtIRlTojCqzUpg/bWs0yyOb
	QDU5qDZYlran6+K5bTY1wPnIq6c2SvK6AEKJCwKwp/4xWU6ByHTZ8ijqb6Vq1y0W
	WllU7Wr4weAwdsoZEVatN4nrt4lWU6B8SAZ8TtROdaReSYgeaCPA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14aasy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 14:58:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559DZ7Cs020672;
	Mon, 9 Jun 2025 14:58:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv88ykx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 14:58:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRc7mBPrxlK5ebDBgQyRCGMtAIbCqMTbHM0xndqllWgFvV4OjELSRaToMb8+MKPi3RZwpnfYdOcPt6VZLH2iLphetACefji4ACh//clKp2taVNRbZUCYFvoKQ8u3DQShPruU0beG86JhRyRtSyaW1ZtX1oFNCluKMWxz/TH9tt2bTTqh+m2KaZNQRYKonhClXgqVN31KPxnyupaTkrODwctqAWZWSmqoriD2Tc66ueUgDGjCmyMFOMwmVU70+ZTxjAeUR5JFlN+Nvuw0TE2Yn9dUQHwtl057gTnDZfOZsbmawKzHqPVfgZnyW7SvOGnyW7ykv02v8RFbb4ospJmu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0dhAKS78SkOzpZXZU9ussrOMHkfYkM3578tUMuLCSY=;
 b=F/I0otY6PGidXI79+fJ13V7hpez68Scg5eSXO/OzKhzsn+E0/0taUQtHLHhaBvs6QZ/e5xAPD9/zClcZUzoneCxFm/U0g/xlX9EitU+rqC3HVR1KlfenISCvrrJWXoyLghRngdFTlERmkFSW5NoEEqZVUcep6ijyZ+BljQRSnOOBm3N7a677eQJ9/i4KxzUhPU869uMkGQAUWQvRvJHNLlswsFOKrqVxACqaivVeKcaj66/mqy4n4BpoquIVY7p+ql4f0VS/qZLNJJAJ2H+MsUgOph3D8Pn6oVLamIWV+jpCOXI1vMqyksK1OSIXBzOF3CuTRPETcSl3RnrzaNC/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0dhAKS78SkOzpZXZU9ussrOMHkfYkM3578tUMuLCSY=;
 b=vq5MwcA/R0L+3cOOV/44DZjJSqwGzbQE2w+B0ZcA4tS1t5Ld9urgkcXzFKui3nrY5tdFGPOa57Ml67RufmKNbnA6IJH6WJNQOfkCJh0I2QW7GWTMq7YT62LU0FuxrMsXMVaVX4dPjNCI0y/j5HKIbkPD+RupWql3/yF6C/LJYWM=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB6506.namprd10.prod.outlook.com (2603:10b6:510:201::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 14:58:01 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:58:01 +0000
Date: Mon, 9 Jun 2025 15:57:59 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: ziy@nvidia.com, Andrew Morton <akpm@linux-foundation.org>,
        david@redhat.com, linux-mm@kvack.org, hannes@cmpxchg.org,
        shakeel.butt@linux.dev, riel@surriel.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <5da7d1a7-1d89-4efc-a50e-bdb66c3e3659@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <063273aa-a852-492a-93da-ba5229f544ca@lucifer.local>
 <8200fd8b-edae-44ab-be47-7dfccab25a24@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8200fd8b-edae-44ab-be47-7dfccab25a24@gmail.com>
X-ClientProxiedBy: LO0P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::14) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd49a6c-1e16-4783-324a-08dda7660796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CKHzn7aRJHpcGQf0KJ/2R/WZKL+nYT72+rp4z7IHa9YPM5Ln6Gtqxvd2G8Zt?=
 =?us-ascii?Q?rFOKMAmBAkHXkIICOAcPnWT1Sv/uCQ5hojTvJ4rrrTa0ImOJqpphZIefiVHZ?=
 =?us-ascii?Q?BTTMNDPXg6007huFLbOelcaHhyuv6ZaDySnlIQr2DNC0218IHinUjYUN35zg?=
 =?us-ascii?Q?JIScgXDaGT8ZCxz3mVoehv03phJSbQfFxTzVFxZpSp0GbAtnGPFk0uW7Xafj?=
 =?us-ascii?Q?YKebquEHhW3zo/KsDztEUJsyrn3k9GPYNpO/faT4KrvKMKx1K6Skh+Wyrd1i?=
 =?us-ascii?Q?qrJyv0FrX5fVZT0mLOjUPHgmxgLfload6eLyeEmq9ALE7o9Idyr60OXQNGSo?=
 =?us-ascii?Q?n4UQU3gbMu0Df95yhP2OQ285VYYTb6xcIiABGB8LDl5wo9dTXCZ18ktl19VC?=
 =?us-ascii?Q?0SU57y88Z2hw3pbiPyJdI0YrXwmAsi71DpFiswov1WXYfJaM4vt3cO0XfXRK?=
 =?us-ascii?Q?wfcTRUUI4ktaX+eVDsBMYRls7MklWMhMxL8nQEKrhWNaPKBKTI0A4ArdsOPd?=
 =?us-ascii?Q?Ja1YFlXeFA/33oPoQLjFvkQpJ+B876p5jjYliavoWyEXg6iVI0WVWutukmn0?=
 =?us-ascii?Q?FXvFFPwjyuxYPeBPMZx5ahejHrfOUeTy65DglSt8DZ3k/k8pk/YrqecBA0PF?=
 =?us-ascii?Q?J9Ibx1ewVp8DrBc71EB31/oeYOuC5pze9IUnmxv6AfFqRtGgFvjHDnK/Zuk2?=
 =?us-ascii?Q?M7XaDS83bbQY99yPFWGQmaqMFqXGoJLLPWztMDKilhnpVNzzBOiuDKd8JHCO?=
 =?us-ascii?Q?bMPwKf/2Aw5hBPqSxrLWj9F+O/REcluSZY4x2UgT5mTrJ+qq/OkuJ/09j69I?=
 =?us-ascii?Q?hXYXrlths8xfDp8cdNavT2GJ6IDbGlgsWSB/ZxTFVQxEYUG4eNQrctrES5wt?=
 =?us-ascii?Q?xQxFaoiOkfPFHiCgXFGBlcfYzKWIsm/bd92MOlPQaObYl11fQH+x6GapoEsw?=
 =?us-ascii?Q?gl+QQLsBYeWITI5UXHvhZ2Vob7Cj7nfGIH8ijqVRmtvBQPX2GmngXu2DvB3e?=
 =?us-ascii?Q?5hcuRf7xa9B/1MDZN7Q8QiesNPZv1fEg5h+snTWF4ICuO+Z0iZOogFptSCaB?=
 =?us-ascii?Q?srjO36OlCH/QbOz7ZWNh425crqeqchBvWwk8sxp7h/PAadGBEh8X5ackOBNu?=
 =?us-ascii?Q?Lz5MMdYtlpGIADlrXt/NRK6Gk8a52vegKVMvB6xRbFqyHS1OivoGyuUeFwfl?=
 =?us-ascii?Q?6Z6nHp0uYicGs1zCjt4LSHpT5OnFUbowjSzIzdCZDW8X7VI5MeThkLwbxHu5?=
 =?us-ascii?Q?DF+IKZ4xVljGME50X7247ZuPphN38qH0j3zMuT1o+YKmqDbNqN6k8HMFyuxA?=
 =?us-ascii?Q?McqTxx/yZ7fJnpDOS7qeCz5vnX8wtxStFuH4H6Q4wV4HFtnUQuaZ9jZAIxBK?=
 =?us-ascii?Q?+TKvc4ciZtEvgOZsdI37TNO07S+l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?txz8DQndbhIhknlt+GPC0OKCJLGgcNvD/RvGpB0E469H3zJ1R8UparDjX/9n?=
 =?us-ascii?Q?2xDjTqAzd4RP+bnsrfO+YiT0BxuqQdqffmFyDLeGzZRtPiThaqi/lOwccG3i?=
 =?us-ascii?Q?5rEHoCoQcjyDoTV9E68RRID6UZkmW9cBi5Mc5uPoCOJTmzkHSoIlcmCZ09mv?=
 =?us-ascii?Q?7l+lUqZbPaqAu01nwkhblZwEE5LgmDbhwuKQWOrm5Hm2JVQ4B/MY782NId4N?=
 =?us-ascii?Q?oDsPCdxVu8hFXgz9VAjichI9pZ8QDyYA7+H4u07fb5oGYRIaX+N/91d/H+Ym?=
 =?us-ascii?Q?R6n2EBTKfFAbfR9krBJrdLO16j2KBgMi9j6tHV8XvpXuzi4D0dEqZuwHX9pd?=
 =?us-ascii?Q?VE031Tun15m8Y71PDc70oKlvr83eAFMZZPAXOoFUHIigKz0YbgbuPW/7+MBr?=
 =?us-ascii?Q?R5QxSufzqDIXvgqReC5OHvl8aPeo5K12v2z+t7wCGBi6WzI836h+rubyYPVD?=
 =?us-ascii?Q?ca7bbAjF7yZN8EV75qRJmpo1ZQxuAwxFyRMDRDGHKftzuZFMPOYnXSXGxFjD?=
 =?us-ascii?Q?LABfIJ7menKjpTPN963tO283jA+sNjwi4waCRN8doBPJpwNS+RDndx2XE6W/?=
 =?us-ascii?Q?b8jv+jHMKUOuKToToLvBEG0BEAdvFH8kDxZLi7YJKncsyHptfjVrPSyBef8x?=
 =?us-ascii?Q?KlEQTya1xD08yNoo2e0pxgJgsXxr4UzPEgq7CRQ47zvQ/p01875l3QvYPeIh?=
 =?us-ascii?Q?XxK91aua3oehyCsBOOvJKJA3iyv/Z4y9idnHPVgXRsuglDiQyTbiWG40jguo?=
 =?us-ascii?Q?wxU4xoN2qNJZYE5kFb9jm+8P4lSG5Gby3c+OTbvcRd3FlMA6QrVeSE3k15j4?=
 =?us-ascii?Q?tX3r0PEksDZvIqE/eSEg/aVPZ2R2tSe2NCgQrh13liApRL/wFIaPMgX+B4oD?=
 =?us-ascii?Q?JyF0EY4Cch+SU3o4V5kz6eh8QMNxZjaI9tiWE3WGyI0Kv2krNlFMi5ID5FD0?=
 =?us-ascii?Q?4QKqMBjNzDyLRWDfUk4SETiDwt/GYo1NUX/SsgiMSTmzjJWTqdlFvt3BMPQ1?=
 =?us-ascii?Q?NPjNgFeloUSjvQ27OlDd9xlcFW6jU1QeT4ROj/9jmjVtZv+BQh+wwreXs6Zy?=
 =?us-ascii?Q?BKMKDPJv0zw63pAtKhdxgCX+YUEjb0TGdk2NphRr+jVBoZ9jp9DiGAYgdk/S?=
 =?us-ascii?Q?67BqpwLkgk7FEQ0FJNF8rLHBiXC9Y75n1nqBn11Myv/r//SWXtbDBK5x/Dvc?=
 =?us-ascii?Q?aZErpQ2Q7g87gc/Yz8J8/UB5KzNddK8iAkPnvzxcjYvQIjm6pyX/4qXD+P1P?=
 =?us-ascii?Q?Xm7BDMLbu6yb4eWZ+X6fh1NI7zuenxBwSKpDxdH+RBn+Fmti6GKltaBXOkdd?=
 =?us-ascii?Q?jUzBDRLT67n+YlZUwP88shtD31jLiI+CiLJ7X4hPBpNl6nFFpZOrOiVDg2b3?=
 =?us-ascii?Q?N0OQU73TjLnOhQkIIJn4vWNp1xx1lBDKCURB+X0u8hBbqK/BdMYtifO9TKa1?=
 =?us-ascii?Q?v95bkCuYozFHzEEQLWBa/DtVr/W5xCwG0K4QkUkcZbfOYPsO8qqpc2C1XDT5?=
 =?us-ascii?Q?U1I2H7M7NNc++c9QuT5oVkpHYpdzwvAMWb/IET7R7p6KDkluVDbfq3iUtw9A?=
 =?us-ascii?Q?GNBcNaY/7A/0PIw6I8F7gSHcFQj2md4wB/FyFC6OeZEP5felETE0sNCBh2Gd?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pb0LVJFaG7BMPYZugg+EvS/sJPbhfo2orfWJDR2jDoG3Niuu2SLWKAlDEAjxEyj54xgqbbxEJ5goDdCzQ99JN24Swv1qJ2j6Q6DZtbbeHmTWbEAgvF3VC1gKgK5vpdxN1RyONANaAjAXiTtayOAynN4CLX9wzU/nTVumrCnyPvTkPI8qhG/n9zXguzIWWybl54p4AUFY+HHQDMdUTzIZYPKAYWaanwQIiKN2XH8nJDQXd9afuDg9zQIonZLepUhecjNIeO8xvB2zVp5j2cR/ecGpJjXlbOdYNUpHBoldbOf2ERWvDW9PUYquCchBUM+atWpqqxCR2r6dBnRdSX74jlpG95DLijDJNBMGwIGHdHEamo7S/OrW5HkrapBiPSQsSQ3squ7oglc5s4CuC7fQxtMJaflFi/r7URABhryRWnbbsS6Zpj93jwl3Q7KPvaxOqLo6vnMy+220XzFLM9w7d6l0vbxpkvcTbakKVlUpC4ctznUpcTilY1F+uitWp9YkhWtThiwrdcQ5U4yxcr4iYU5Mt6npUlqsIeDLRkFamnHqMezFA+oE2d3Aopiwmh3hkPw4zvrw9kdOxa83DhX/AZnc6fN115J20MWeAogy+50=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd49a6c-1e16-4783-324a-08dda7660796
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:58:01.4479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdGFmOaVm42JeTSd4l9a9wsXu8DEOa/OKxql3N9ibIxDSp1/KRmfl799B8tBg5DsmLiV/bAiS9W0/otpqAVmSieUG7niT/PNOoDK1poF3kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090110
X-Proofpoint-GUID: 88UqS_qmcgcP0X0DJeXxqXgwrVQnJoQY
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6846f681 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=OCymf4bglOMzUWtInmUA:9 a=CjuIK1q_8ugA:10 a=d3PnA9EDa4IxuAV0gXij:22 cc=ntf
 awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMCBTYWx0ZWRfX23it76dHs/4p 99wxA69XAzyx+35d71s64fQorWs4/J6UXqCdozM8t3T6QSDVlzXF09ZlNTa63QZO0KwaigpGAgO ld9hVv0HfsiqTYF8yv/zHpAtyqNkH/VuyaRug93F2lwsZy8468eOSy0WiI5Hed4FljREbgJHWlO
 hxJQ+zzhMaTm4YQnh054Blyl8OPW0ic52WCyZ1PXZsTPhxAIifhsaQUkFohxkifVSUTOsKg5e9f 2iMjEX3telXlwUmxB7qwJhd4RH8msc/FggT8wprKnhU2dUaUHZWKeXiesPKJu69W4W99Omur3JT Xom07BkTMQN5+kHebgLms/Ll2VZRbG+c10DQiQczRXvlb/C30oKKof7DQ3qjux8c+NgZtx0MG0K
 88ab+DbhrLvc4yH5Tpuuz2s3bkF4NTASwTBkJ05hbp5ASTbZw936AdPb3taTm7/EZYE7/RFf
X-Proofpoint-ORIG-GUID: 88UqS_qmcgcP0X0DJeXxqXgwrVQnJoQY

On Mon, Jun 09, 2025 at 01:07:42PM +0100, Usama Arif wrote:
>
>
> On 07/06/2025 09:18, Lorenzo Stoakes wrote:
> > It's important to base against mm-new for new mm stuff, PAGE_BLOCK_ORDER got
> > renamed to PAGE_BLOCK_MAX_ORDER in Zi's series at [0] and this doesn't compile.
> >
> > Please always do a quick rebase + compile check before sending.
> >
> > [0]:  https://lkml.kernel.org/r/20250604211427.1590859-1-ziy@nvidia.com
> >
> > Overall this seems to me to be implemented at the wrong level of
> > abstraction - we implement set_recommended_min_free_kbytes() to interact
> > with the page block mechanism.
> >
> > While the problem you describe is absolutely a problem and we need to
> > figure out a way to avoid reserving ridiculous amounts of memory for higher
> > page tables, we surely need to figure this out at a page block granularity
> > don't we?
> >
>
> Yes agreed, Zi raised a good point in [1], and I think there is no reason to just
> do it to lower watermarks, it should be done at page block order so that defrag
> also happens at for 2M and not 512M with the example given in the commit message.
>
> [1] https://lore.kernel.org/all/c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com/
>

Yeah right exactly.

These things are heuristic anyway, and so I think it's fine to add an
additional heuristic of 'well people are unlikely to use 512 MB PMD sized
huge pages in practice on 64 KB page size systems'.

And obviously you have rightly raised that - in practice - this is really
just causing an issue rather than serving the needs of users.


> > On Fri, Jun 06, 2025 at 03:37:00PM +0100, Usama Arif wrote:
> >> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
> >> watermarks are evaluated to extremely high values, for e.g. a server with
> >> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
> >> of the sizes set to never, the min, low and high watermarks evaluate to
> >> 11.2G, 14G and 16.8G respectively.
> >> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
> >> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
> >> and 1G respectively.
> >> This is because set_recommended_min_free_kbytes is designed for PMD
> >> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
> >
> > Right it is, but not this line really, the _pageblock order_ is set to be
> > the minimum of the huge page PMD order and PAGE_BLOCK_MAX_ORDER as it makes
> > sense to use page block heuristics to reduce the odds of fragmentation and
> > so we can grab a PMD huge page at a time.
> >
> > Obviously if the user wants to set a _smaller_ page block order they can,
> > but if it's larger we want to heuristically avoid fragmentation of
> > physically contiguous huge page aligned ranges (the whole page block
> > mechanism).
> >
> > I absolutely hate how set_recommended_min_free_kbytes() has basically
> > hacked in some THP considerations but otherwise invokes
> > calculate_min_free_kbytes()... ugh. But an existing issue.
> >
> >> Such high watermark values can cause performance and latency issues in
> >> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
> >> most of them would never actually use a 512M PMD THP.
> >
> > 512MB, yeah crazy. We've not thought this through, and this is a very real
> > issue.
> >
> > Again, it strikes me that we should be changing the page block order for 64
> > KB arm64 rather than this calculation though.
> >
>
> yes agreed. I think changing pageblock_order is the right approach.

Thanks, yes!

>
> > Keep in mind pageblocks are a heuristic mechanism designed to reduce
> > fragmentation, the decision could be made to cap how far we're willing to
> > go with that...
> >
> >>
> >> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
> >> folio order enabled in set_recommended_min_free_kbytes.
> >> With this patch, when only 2M THP hugepage size is set to madvise for the
> >> same machine with 64K page size, with the rest of the sizes set to never,
> >> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
> >> respectively. When 512M THP hugepage size is set to madvise for the same
> >> machine with 64K page size, the min, low and high watermarks evaluate to
> >> 11.2G, 14G and 16.8G respectively, the same as without this patch.
> >
> > Hmm, but what happens if a user changes this live, does this get updated?
> >
> > OK I see it does via:
> >
> > sysfs stuff -> enabled_store() -> start_stop_khugepaged() -> set_recommended_min_free_kbytes()
> >
> > But don't we want to change this in general? Does somebody happening to
> > have 512MB THP at madvise or always suggest we want insane watermark
> > numbers?
>
> Unfortunately the answer to this is probably a lot of servers that use 64K
> page size do. You can see in [1] that if anyone hasn't actually configured
> the hugepage sizes via kernel commandline, and if the global policy is set
> to madvise or always, then 512M is inheriting madvise/always and they would
> have a very high watermark set. I dont think this behaviour is what most
> people are expecting.

Right they will be default have this (they are silly to do so, and we are
silly to let them but we've all said I think without fail that the THP
interface is flawed so I wont' belabour this :)

But again the 'T' in THP is transparent :) it's _trying_ to provide
PMD-sized folios, if it can.

But if it can't, then it can't, and that's ok.

>
> I actually think [1] should be wrapped in ifndef CONFIG_PAGE_SIZE_64KB,
> but its always been the case that PMD is set to inherit, so probably
> shouldnt be wrapped.
>
> [1] https://elixir.bootlin.com/linux/v6.15.1/source/mm/huge_memory.c#L782

IDEALLY I'd rather not, we should be figuring out how to do this scalably
not relying on 'well if this page size or if that page size' it's kinda a
slippery slope.

Plus I think users will naturally assume the 'PMD sized' behaviour is
consistent regardless of base page size.

I mean I don't LOVE (understatement) this 'water mark calculation is
different if PMD-sized' stuff in general. That rather smacks of unscalable
hard-coding on its own.


>
> >
> > I'm not really convinced by this 'dynamic' aspect, you're changing global
> > watermark numbers and reserves _massively_ based on a 'maybe' use of
> > something that's meant to be transparent + best-effort...
> >
>
> If someone sets 512M to madvise/always, it brings back the watermarks to
> the levels without this patch.

Yeah sorry see my follow up on this, I was just mistaken, things are
already dynamic like this.

Yuck this interface.

>
> >>
> >> An alternative solution would be to change PAGE_BLOCK_ORDER by changing
> >> ARCH_FORCE_MAX_ORDER to a lower value for ARM64_64K_PAGES. However, this
> >> is not dynamic with hugepage size, will need different kernel builds for
> >> different hugepage sizes and most users won't know that this needs to be
> >> done as it can be difficult to detmermine that the performance and latency
> >> issues are coming from the high watermark values.
> >
> > Or, we could adjust pageblock_order accordingly in this instance no?
> >
> >>
> >> All watermark numbers are for zones of nodes that had the highest number
> >> of pages, i.e. the value for min size for 4K is obtained using:
> >> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 4096 / 1024 / 1024}';
> >> and for 64K using:
> >> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 65536 / 1024 / 1024}';
> >>
> >> An arbirtary min of 128 pages is used for when no hugepage sizes are set
> >> enabled.
> >
> > I don't think it's really okay to out and out add an arbitrary value like this
> > without explanation. This is basis for rejection of the patch already.
> >
>
> I just took 128 from calculate_min_free_kbytes, although I realize now that over there
> its 128 kB, but over it will mean 128 pages = 128*64kB.
>
> I think maybe a better number is sqrt(lowmem_kbytes * 16) from calculate_min_free_kbytes.
>
> I cant see in git history how 128 and the sqrt number was chosen in calculate_min_free_kbytes.

Yeah, the key thing is to provide a justification, hard-coded numbers like
this are scary, not least because people don't know why it is but are
scared to change it :P

>
> > That seems a little low too no?
> >
> > IMPORTANT: I'd really like to see some before/after numbers for 4k, 16k,
> > 64k with THP enabled/disabled so you can prove your patch isn't
> > fundamentally changing these values unexpectedly for users that aren't
> > using crazy page sizes.
> >
> >>
> >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >> ---
> >>  include/linux/huge_mm.h | 25 +++++++++++++++++++++++++
> >>  mm/khugepaged.c         | 32 ++++++++++++++++++++++++++++----
> >>  mm/shmem.c              | 29 +++++------------------------
> >>  3 files changed, 58 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> >> index 2f190c90192d..fb4e51ef0acb 100644
> >> --- a/include/linux/huge_mm.h
> >> +++ b/include/linux/huge_mm.h
> >> @@ -170,6 +170,25 @@ static inline void count_mthp_stat(int order, enum mthp_stat_item item)
> >>  }
> >>  #endif
> >>
> >> +/*
> >> + * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
> >> + *
> >> + * SHMEM_HUGE_NEVER:
> >> + *	disables huge pages for the mount;
> >> + * SHMEM_HUGE_ALWAYS:
> >> + *	enables huge pages for the mount;
> >> + * SHMEM_HUGE_WITHIN_SIZE:
> >> + *	only allocate huge pages if the page will be fully within i_size,
> >> + *	also respect madvise() hints;
> >> + * SHMEM_HUGE_ADVISE:
> >> + *	only allocate huge pages if requested with madvise();
> >> + */
> >> +
> >> + #define SHMEM_HUGE_NEVER	0
> >> + #define SHMEM_HUGE_ALWAYS	1
> >> + #define SHMEM_HUGE_WITHIN_SIZE	2
> >> + #define SHMEM_HUGE_ADVISE	3
> >> +
> >>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >>
> >>  extern unsigned long transparent_hugepage_flags;
> >> @@ -177,6 +196,12 @@ extern unsigned long huge_anon_orders_always;
> >>  extern unsigned long huge_anon_orders_madvise;
> >>  extern unsigned long huge_anon_orders_inherit;
> >>
> >> +extern int shmem_huge __read_mostly;
> >> +extern unsigned long huge_shmem_orders_always;
> >> +extern unsigned long huge_shmem_orders_madvise;
> >> +extern unsigned long huge_shmem_orders_inherit;
> >> +extern unsigned long huge_shmem_orders_within_size;
> >> +
> >
> > Rather than exposing all of this shmem state as globals, can we not just have
> > shmem provide a function that grabs this informtaion?
> >
> >>  static inline bool hugepage_global_enabled(void)
> >>  {
> >>  	return transparent_hugepage_flags &
> >> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> >> index 15203ea7d007..e64cba74eb2a 100644
> >> --- a/mm/khugepaged.c
> >> +++ b/mm/khugepaged.c
> >> @@ -2607,6 +2607,26 @@ static int khugepaged(void *none)
> >>  	return 0;
> >>  }
> >>
> >
> >> +static int thp_highest_allowable_order(void)
> >
> > Thisa absolutely needs a comment.
> >
> >> +{
> >> +	unsigned long orders = READ_ONCE(huge_anon_orders_always)
> >> +			       | READ_ONCE(huge_anon_orders_madvise)
> >> +			       | READ_ONCE(huge_shmem_orders_always)
> >> +			       | READ_ONCE(huge_shmem_orders_madvise)
> >> +			       | READ_ONCE(huge_shmem_orders_within_size);
> >
> > Same comment as above, have shmem export this.
> >
> >> +	if (hugepage_global_enabled())
> >> +		orders |= READ_ONCE(huge_anon_orders_inherit);
> >> +	if (shmem_huge != SHMEM_HUGE_NEVER)
> >> +		orders |= READ_ONCE(huge_shmem_orders_inherit);
> >> +
> >> +	return orders == 0 ? 0 : fls(orders) - 1;
> >> +}
> >> +
> >> +static unsigned long min_thp_pageblock_nr_pages(void)
> >
> > I really really hate this name. This isn't number of pageblock pages any
> > more this is something else? You're not changing the page block size right?
> >
>
> I dont like it either :)
>
> As I mentioned in reply to David now in [1], pageblock_nr_pages is not really
> 1 << PAGE_BLOCK_ORDER but is 1 << min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER) when
> THP is enabled.

Yuuuuck.

>
> It needs a better name, but I think the right approach is just to change
> pageblock_order as recommended in [2]
>
> [1] https://lore.kernel.org/all/4adf1f8b-781d-4ab0-b82e-49795ad712cb@gmail.com/

Right yeah (I assume you typo'd 2 and you mean the 1 above? :P).

>
> >> +{
> >> +	return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
> >> +}
> >> +
> >>  static void set_recommended_min_free_kbytes(void)
> >>  {
> >>  	struct zone *zone;
> >> @@ -2638,12 +2658,16 @@ static void set_recommended_min_free_kbytes(void)
> >
> > You provide a 'patchlet' in
> > https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
> >
> > That also does:
> >
> >         /* Ensure 2 pageblocks are free to assist fragmentation avoidance */
> > -       recommended_min = pageblock_nr_pages * nr_zones * 2;
> > +       recommended_min = min_thp_pageblock_nr_pages() * nr_zones * 2;
> >
> > So comment here - this comment is now incorrect, this isn't 2 page blocks,
> > it's 2 of 'sub-pageblock size as if page blocks were dynamically altered by
> > always/madvise THP size'.
> >
> > Again, this whole thing strikes me as we're doing things at the wrong level
> > of abstraction.
> >
> > And you're definitely now not helping avoid pageblock-sized
> > fragmentation. You're accepting that you need less so... why not reduce
> > pageblock size? :)
> >
> > 	/*
> > 	 * Make sure that on average at least two pageblocks are almost free
> > 	 * of another type, one for a migratetype to fall back to and a
> >
> > ^ remainder of comment
> >
> >>  	 * second to avoid subsequent fallbacks of other types There are 3
> >>  	 * MIGRATE_TYPES we care about.
> >>  	 */
> >> -	recommended_min += pageblock_nr_pages * nr_zones *
> >> +	recommended_min += min_thp_pageblock_nr_pages() * nr_zones *
> >>  			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;
> >
> > This just seems wrong now and contradicts the comment - you're setting
> > minimum pages based on migrate PCP types that operate at pageblock order
> > but without reference to the actual number of page block pages?
> >
> > So the comment is just wrong now? 'make sure there are at least two
> > pageblocks', well this isn't what you're doing is it? So why there are we
> > making reference to PCP counts etc.?
> >
> > This seems like we're essentially just tuning these numbers someswhat
> > arbitrarily to reduce them?
> >
> >>
> >> -	/* don't ever allow to reserve more than 5% of the lowmem */
> >> -	recommended_min = min(recommended_min,
> >> -			      (unsigned long) nr_free_buffer_pages() / 20);
> >> +	/*
> >> +	 * Don't ever allow to reserve more than 5% of the lowmem.
> >> +	 * Use a min of 128 pages when all THP orders are set to never.
> >
> > Why? Did you just choose this number out of the blue?
> >
> > Previously, on x86-64 with thp -> never on everything a pageblock order-9
> > wouldn't this be a much higher value?
> >
> > I mean just putting '128' here is not acceptable. It needs to be justified
> > (even if empirically with data to back it) and defined as a named thing.
> >
> >
> >> +	 */
> >> +	recommended_min = clamp(recommended_min, 128,
> >> +				(unsigned long) nr_free_buffer_pages() / 20);
> >> +
> >>  	recommended_min <<= (PAGE_SHIFT-10);
> >>
> >>  	if (recommended_min > min_free_kbytes) {
> >> diff --git a/mm/shmem.c b/mm/shmem.c
> >> index 0c5fb4ffa03a..8e92678d1175 100644
> >> --- a/mm/shmem.c
> >> +++ b/mm/shmem.c
> >> @@ -136,10 +136,10 @@ struct shmem_options {
> >>  };
> >>
> >>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >> -static unsigned long huge_shmem_orders_always __read_mostly;
> >> -static unsigned long huge_shmem_orders_madvise __read_mostly;
> >> -static unsigned long huge_shmem_orders_inherit __read_mostly;
> >> -static unsigned long huge_shmem_orders_within_size __read_mostly;
> >> +unsigned long huge_shmem_orders_always __read_mostly;
> >> +unsigned long huge_shmem_orders_madvise __read_mostly;
> >> +unsigned long huge_shmem_orders_inherit __read_mostly;
> >> +unsigned long huge_shmem_orders_within_size __read_mostly;
> >
> > Again, we really shouldn't need to do this.
> >
> >>  static bool shmem_orders_configured __initdata;
> >>  #endif
> >>
> >> @@ -516,25 +516,6 @@ static bool shmem_confirm_swap(struct address_space *mapping,
> >>  	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
> >>  }
> >>
> >> -/*
> >> - * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
> >> - *
> >> - * SHMEM_HUGE_NEVER:
> >> - *	disables huge pages for the mount;
> >> - * SHMEM_HUGE_ALWAYS:
> >> - *	enables huge pages for the mount;
> >> - * SHMEM_HUGE_WITHIN_SIZE:
> >> - *	only allocate huge pages if the page will be fully within i_size,
> >> - *	also respect madvise() hints;
> >> - * SHMEM_HUGE_ADVISE:
> >> - *	only allocate huge pages if requested with madvise();
> >> - */
> >> -
> >> -#define SHMEM_HUGE_NEVER	0
> >> -#define SHMEM_HUGE_ALWAYS	1
> >> -#define SHMEM_HUGE_WITHIN_SIZE	2
> >> -#define SHMEM_HUGE_ADVISE	3
> >> -
> >
> > Again we really shouldn't need to do this, just provide some function from
> > shmem that gives you what you need.
> >
> >>  /*
> >>   * Special values.
> >>   * Only can be set via /sys/kernel/mm/transparent_hugepage/shmem_enabled:
> >> @@ -551,7 +532,7 @@ static bool shmem_confirm_swap(struct address_space *mapping,
> >>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >>  /* ifdef here to avoid bloating shmem.o when not necessary */
> >>
> >> -static int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
> >> +int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
> >
> > Same comment.
> >
> >>  static int tmpfs_huge __read_mostly = SHMEM_HUGE_NEVER;
> >>
> >>  /**
> >> --
> >> 2.47.1
> >>
>
