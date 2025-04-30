Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5272235051
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020223; cv=fail; b=jeEH1K82Ak07Isst06DTlz2fmKm7nZD1s6jNrjnbMjJCMAXn4GDtffhBJT+ZuBSGGoTbuhDfKekiIbsIzIqtb9o+ulug6WQGDxlfbntxyolteeysK9n9iO3PtcYTRVzDfrCG3BoojAgTIXqSaOIillr7Hk9tAsELwZIeTu4E7w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020223; c=relaxed/simple;
	bh=nvybNxceKOJmU7CwTHY9exM49vl8rDxE48LZYHBeurI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Eq66QAtpGVN0KHWnKQ8WMU9iEpni8rfi8H9BtipoTYmKDCqQBUvrOkX/P8U2VVxoKGGXfn8ICDRZJxbtRf3I5AKrvS/9PaA43cbhvwJWJo6ob5rr8Rl0hjvXG2cnigCNSC3X4OZND96Jqw6dbcilkN9RC3RpPu4XgYD25qk4H0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ekTxxby5; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BrFDZUar; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HfUWmxgz reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ekTxxby5";
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BrFDZUar";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HfUWmxgz"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UDWpRL013713;
	Wed, 30 Apr 2025 13:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=nvybNxceKOJmU7CwTHY9exM49vl8rDxE48LZYHBeurI=; b=
	ekTxxby5Efv0HYL97GKTmLX0kmyKOxexQkL3Zn8SVNjUu37qS0k3Hl04Ngrckyez
	kUPPYPtYX2oRteOk/68H+9rVGmIQU/+E1RcS25TV1Y8WXG2vkU4ecbXcIavipqBn
	fHPAfCGYOaIYf3OsNzvvVSCMjYMdIsVnTf2jqufkMvcu2j+2Bhvbya1bJUF2Bo6y
	x8JNfJLYG1zdFCWNmiInMtkeKkQ8Bz0j1hPmZzuGW173Z8De33lgQCVvX2+m4vzL
	HL5yDNO+o1/toejR2oxz+2mWa1KI0BUjjWxC03HibK0e1Kk9wt19cCpCot7N5Y7E
	iPAJ/epfD0hTi6IVb/zPVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=nvybNxceKOJmU7CwTHY9exM49vl8rDxE48LZYHBeurI=; b=
	BrFDZUar1PzwQWXmovxL3onbu7VOwacYWWHB3J+2eG+RwR27/IfHl7nQEjrunBK4
	hyOH5ltppYzMa3VOLUG9AXIkKYx5+iddwcJnSC1Yhw7GLvzT4YC/lqLAFz+gulTv
	nGIRjMzbTrap29smcUr+j4JyhsuLMYiyVl/qT6uziWDfS5tOnZGBmum7ych/N5q/
	aAcjnbKpaHLG5SKN16FD9VNTYmLKdt1DwPN//6TghnnGZL1Rb7X2/pPxhP5HA8cW
	04XA85mwU5tbQKqNuhVIR6dGnCEyoIwYpUiYkNVDMEpjk5zpxyvYZ694NzZHNS7K
	pha4f0W6IH6o2KkyxTLPSg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ukh615-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 13:36:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53UDEST4033502;
	Wed, 30 Apr 2025 13:36:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxbat2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 13:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiBVtJdpdwyipGpNzYW+pOQIW7+nHV5HxjKbU5/AqbqsaihbJnWul6e8g3AHRZM2YGlsezWmyRR+7ltt9njmJ1h1hDtS1CzihZQwUj6L4gJ+6xFm0hOzGbZqfWs/e7zJ6CL2TXw8ShHi3dhQDshZD7FMGQseTL/i1pRRBS3uQziJpJaN6XlXt/X0K5JhXLPpf1ear4qzRKzQFFhorTiEznpshKmwMlDJAwXS4n4QU4O6XX0yoTO24jnDZL6gV0y2JMJkUnld8KvyDeY4RXWHEaKGpU7biyZnSL7HjbDM8pSMi1OGqa5P7wn1xCXtW45zndrDoB4giIB8Fftj1NA2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKKaP5u8xja2bFEHW4S1EnaeAx8ZRvSvRs3eAdvFdl8=;
 b=kNKiPwBDqF4l1+r68SNiRBM9+nd80aniTJeVLfnPV71gd3gzhyy3p5vOaeSU90DyzBB+lp8CSscSbl45O5KdaC841M6zYFWRF7rBTXNg5/cUzmctdhf9JLUFUKmtHeY902so0I2Qb8ngC8bbEcEA091nWPUCZWQANHqoL7vrYmhI+gh28UN3ARi6wtX7Rj0L8Z8roR7vKkc3OWvJ3snQw1BQ4POHyDkb2dj0etltVJRtqy3HrVx6l/RUwGxBpFzsTfDchsJsOYsRz1pT5YroqSDhywWjz3oUOZsTlxiIsrZdassvCkUvWxZZJC+JBF6Ba2lHF7akLklvrARVRHW8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKKaP5u8xja2bFEHW4S1EnaeAx8ZRvSvRs3eAdvFdl8=;
 b=HfUWmxgzA015I7GjcKH7pOayY8WFIXB6iqvw/FyVGJ5w3Du+UC6wVvzluYN8+kWfTOLn3kFAXaSqDDOUUUCZch2LA9Q8ubBwNk1HR2loJqZ1AhOmJVQ24aQ3r8jocz9VbqLBcGynl/BHFH/qUCp6KBv7FZiQnyLDrFOHLivv3cA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB7131.namprd10.prod.outlook.com (2603:10b6:8:e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 13:36:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 13:36:22 +0000
Date: Wed, 30 Apr 2025 14:36:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, namit@vmware.com,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 2/7] mm: Optimize mprotect() by batch-skipping PTEs
Message-ID: <99697544-54fd-46e6-a519-f5bdcc2e01a5@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-3-dev.jain@arm.com>
 <f4a90024-3cc7-4536-84b0-665021d96125@lucifer.local>
 <9687592f-ec04-410f-9fb2-9777edfe1178@arm.com>
 <40826f42-07d2-4c00-8173-a5eb19d2335c@arm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40826f42-07d2-4c00-8173-a5eb19d2335c@arm.com>
X-ClientProxiedBy: LO2P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::29) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: f31005da-e2db-4e68-44a3-08dd87ebff07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?CiEDhuvET8/lXo0BuV1jwZaSf2bds3sUkhjEN9aMgYbG3LDD+I3IthFT6A?=
 =?iso-8859-1?Q?GPIAQI1FlYGOpAXqD3AdsrQKr0jXHXCdzN8NcPjdhj3TaN7FvOGkrWRta7?=
 =?iso-8859-1?Q?XAPyoqaeyjvHQ0aozldheimC4AyFkXqIQSiolT1lArD90086+sPE6KkSRc?=
 =?iso-8859-1?Q?YI1tR4ON0LN2o7+b6Nf7aWNuYyl1jiygNw3Wn8Qti8I0gDHrrlfg0wvwTZ?=
 =?iso-8859-1?Q?djlMod1K1mk2bvOPLh1GknestoKZv2GNzlBxcQHjU0ZahIv+afEtOTYHtP?=
 =?iso-8859-1?Q?HJpanIvEG1QVafTj5UeoVy+IaD9GhHtec7Y4metxknRdz6VPgeF/LXgd0B?=
 =?iso-8859-1?Q?jHQZELefCg+OTgEyYPYueMHpU9FpsLVL+Jq+Qu3gIYhZ6BxCPwyOPCc/iJ?=
 =?iso-8859-1?Q?/mc8trlObC/T+U6oPSn30HgVnzpf/zwkDV/w18ogkNhVSKImbAipc5VZHW?=
 =?iso-8859-1?Q?VOe5TCShMtBTfzc4CjySUuJBvovq6Vptd0l+U6YMrAR8ZteeP55Ai6++Bb?=
 =?iso-8859-1?Q?7eCPke7zJywriBfvi0sG0/kt9l5Mm53Oc/U/Kl/MYUa802dtFSZOPMsirh?=
 =?iso-8859-1?Q?UKiWP5PnojxWdBNjW+kh7hy5Anhzkdhtv/w+8Kug26X3J6dSnwgXe11rSP?=
 =?iso-8859-1?Q?YKYiAg+5A+mv4uEHBQgSkVE618Ls1ObTqsQpH3d3S9ldEOF6dInqQDBIzs?=
 =?iso-8859-1?Q?D/NOcxJ1wMWchVUG/KiOyF2OU5ua8HL0+0J+oapY/A7+N8RO8PKl9J0ZDa?=
 =?iso-8859-1?Q?lHjr24xaSYQj1fSNRriExFJefEhRUv1Pjmesmte87bxwX+RqaE/6Cfi7+/?=
 =?iso-8859-1?Q?B9TXM60zp/RNmCEVOi4ZBN+qKPZJJ+yFgQgwWnEGrGUcN+SlXHOPkWN28T?=
 =?iso-8859-1?Q?JyKieo19ph4gf7B/t+fNC1Qr6PdR37RTdyJrZTVAZwo6AskBbvJFwsa0Xc?=
 =?iso-8859-1?Q?M4tVJEMopf0pX8QdWwvvW9ZvEtJwWY5aj5jAnS4KESRHWOy8Nkem5ow1uv?=
 =?iso-8859-1?Q?MTmFzbQnWcEixAFeiQDRx96ZyQzhRmFa+ZD0NAZzfYe2aBA23qaaFB6Avp?=
 =?iso-8859-1?Q?CNmUqjn31/I5aFBPuy26P20IRkje9FtQludElflkVy40LwvWGeorRWOVln?=
 =?iso-8859-1?Q?vkQh6SkYqbFs0i1h08f/luDuF15yef6PPUnVK/wCvxoz+Een9tCCzRYp2C?=
 =?iso-8859-1?Q?RHGg5/ppAURWsK15LJwK1nJE1LciF+zsX3xOclHIxd8srqmDeQKyShOZb2?=
 =?iso-8859-1?Q?zNLV06g/78qE0chYyTxpGioVNYCVO0d7ocjNM44VYeb46Q7ET720MShbeB?=
 =?iso-8859-1?Q?8XTxPrFQI/oCqleLPJUuyE0XpRr23xoHLibYVzL3aMsFrrwh9X+rbUdYLV?=
 =?iso-8859-1?Q?B7nss8QqzDWq/cYaEW2d3WQemw+UidIX2Ddf2qBnL4cztOmAPRwAKSSF9o?=
 =?iso-8859-1?Q?+JBqSZJRupL71nvxo6aIkzRcpuhcfNX5WR6QEw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?x+sZcedIX7rXPslzj0SRah6c4iSh68HcdM0dQa3H6mT3Nw36+hBce5Sr1K?=
 =?iso-8859-1?Q?nctcBpphWaqtB8B7KqY2urXjeBxNU/ZQFavnU3SiVkv9oZLz+SX6gYPB6A?=
 =?iso-8859-1?Q?LMiR4a/zA+6Lxou3rOUE3697cylZqRa5gVxVGCFfYWuenXhOZoCtySSGh8?=
 =?iso-8859-1?Q?SWJgl5OZLKXuSB42LURpl2J85pFgBxJIyWuIvlZggLNjfnmTcfdqZGS0Av?=
 =?iso-8859-1?Q?3h6rM7z6t26HIklKkbIQaTVDsU3W4pDWBIkhgtrPQBBByF0bzwY1xIBWMa?=
 =?iso-8859-1?Q?t8rrCpblwJ5WVwB8sV+080XnQ43FFkwkjkVwp3s84+HioUliBKJ+V0ItvB?=
 =?iso-8859-1?Q?+eHVAid3tnzea/58yRzalBEIrgUidm1l33z/F0+Zh9VE5L7DjYwN1vA6iJ?=
 =?iso-8859-1?Q?vF2mMCMq8cGkjeGFmyNXPZ7tnJn670/Rb6wTX18SGeqsGEcevMtKTSGBGr?=
 =?iso-8859-1?Q?5p/4uE/zXUchl5PpVtMlGSFvJxGpp/wbwB7gUQBmerwwl/69lSv82qyN5S?=
 =?iso-8859-1?Q?zEU3CLJSN3Dg7BOL/fELyVFtstnTnGoTERnBfmGog+5bH0HF4nTCFeCMU1?=
 =?iso-8859-1?Q?McV3CEHmLj7WBTDrB1bDXmMWlmszp9tgqPai8ZpRgRIenLKajLDsJd6Bin?=
 =?iso-8859-1?Q?RBrLO4L/T9JrbZuo90SBk5hJoy1T+lddBDSSOtXLmyr81EDZg1OIMp+Ycp?=
 =?iso-8859-1?Q?bH6XOJVx8y7ZlT7Mku9xFChY5x9XDThupSeQxHfszpe43B0hai7JoKK5Gc?=
 =?iso-8859-1?Q?pgQcdzpULuuzGZHQbEYbeEffFSlezHL8cIktJeJr6FFjEWXZCJqXDEsxvw?=
 =?iso-8859-1?Q?scnL5dMY/5kk6RP8ZtIWyyBs204L6l5xMt0lwAwnkcs651FghfLxDdxWbw?=
 =?iso-8859-1?Q?ZedIjKo3zSb8czeXNUkVbxcoiW+d+b1N++nazaZgls/M3SyS7+IJAJEt0Z?=
 =?iso-8859-1?Q?3RmixzzDgZW8zTShnEYw9Jk+fN2C1qDLLgZGdQM/P693g0YD595q2juUCv?=
 =?iso-8859-1?Q?RPeGI6nnNOXWmwptYVq2eVUKEYxXkaYIjAdakLNENMp63byVmnQA4Ixkv9?=
 =?iso-8859-1?Q?SwWZ/7OQ59KEQ9y4WiLPvCTbK2u/xf2qz/VhNNtFh97qQf3ZB1IYxrG5Dw?=
 =?iso-8859-1?Q?8oH5BKhUEZgyzgdNOYCAG7S2kgK8uIN0h1u2ZBIc/Zx5oDRSSBsX7umc5Z?=
 =?iso-8859-1?Q?+70d8ifDXs/EHpzZ+vczxhaOKlX/hPbcTbpZtzzB4S897TYi9PNAIMQdNK?=
 =?iso-8859-1?Q?zgsxDPVxKA+j18E54Yy/fKqZ3K/P1gxYfwYtKKF1xtu7q8YByityaVUa/c?=
 =?iso-8859-1?Q?7rhIgtViIyALvbgYkmdLJ/bkSknw0Qlo23g91n568ra/rwpJvILoXotyel?=
 =?iso-8859-1?Q?2ukti+lzBE8Um5f8HcIShRtSYNgJWk/o+25whZcO6zMi/LqxRmi62RzkKq?=
 =?iso-8859-1?Q?tVv7dFJhhGuSfHaH2MmlJi4dAPudnyCJFGyfGlUjSGAznvoU+pcnkDRpui?=
 =?iso-8859-1?Q?c1CYzQadmT+E1ef+EL+/cOKiDEqoTmGTGBFkpACqox6O6JxbwA8j6C89BY?=
 =?iso-8859-1?Q?stv2U6Aajpkz5cKv/WVnK+Qn7Exf+7lzXjRL9N6PIwrveNcB59fO0il0Ed?=
 =?iso-8859-1?Q?4oJKl8PlmS5ocx36GC7dctLHm//6/GJxKakr9NenxVUEuiAO6e42Be+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jYc6EBEp+t3KlEMYYEV1KSAsoqHWuT/k9iqvWtF8yBkYNLa11Re4W9F3QFAChS6mhUxxd8+zdT/TIluJkqsTkO3chezE0yhh6eMp39D1wYhzZqt344y3S+HmRVzBKMqMwJ9QjPgGq5sOGD+ZVd4cVKP18jcnHSWvCp9y0XliX7jHNmEw4fDv6TmjFvpbDHdqge5ySMx+4tR55BOwrOonulwcapJFK8KQ20JROpQqEcAXh68mrmwLUw/dZYKMijzWHs38ACH1VDf14lyxwFGVl2YJ4XG2iGsAbeCm9zUmpDOVf7myEs4oHWqFvj7/Aj16aKWOAzsC454A8bBQOZ+hDO8uv1+UTZdDy702YRSyp/T5OoQf5RrCsts/TwhZdM+RR3rQ/yS7BoZnJOqQ6aD1UJiQdPFV67h44wCcphQ4yXXsCh57BQc6CuuVboElPFMNLjGr4JUyk+cge6yKKts7/7RiPCob6joDbNkU9Bt64vlQ0Vf/hKAJxFhTiGy/dBENOzPqRxEAoh/ZCw11ZOLwKR25T0tJ1dguILe7MRnqHfhLIy4yArFIYPEEeksjiI4RNZz6ttWn+eW/p8Z03E3LtfMUx5/DY71Z/1LHUb5RfyY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31005da-e2db-4e68-44a3-08dd87ebff07
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 13:36:22.3969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXAqDN5ZF7egfxaLFbr+R4WgaGwmEwQLrTWbePikKoCYoPlCFSz+9mRjaH2ZLCtcLK/uAyZ17OCBQn1nsN0L2lC+FW3EO6My1LEfbb2T3MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504300096
X-Authority-Analysis: v=2.4 cv=MIZgmNZl c=1 sm=1 tr=0 ts=6812275a cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=xO1GI6CabQeYKh9xovgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: UkRJA028wV2EUzPh15RmskwQ7ZM0huW0
X-Proofpoint-ORIG-GUID: UkRJA028wV2EUzPh15RmskwQ7ZM0huW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NiBTYWx0ZWRfX0wcaaRW069Bh CEldq2jmJ3Syoptuv6GWem1i16TSmKbNhVvFTgkGbaTl8vt67UrVxqUzLfWY3c9E6Xat8nAdO5B EOIkckmwW6yaeilvp7C/XnHOKBZqg5gWNynv7EnU8atXAN/mTbgQuDm+L8RM/PA+p9oQtdgxFpA
 43EojO1mwBvyfuTZ3veeZ/IAHNM1SilVK10VefrRQZTv6/veMLdSqWeWKDHFQGJP8iVFU4tnt/n zqNajrGf4bvrvuDwD2FUvj3CTbmNqAjiFwM0WIIKlzam651AxQu/RaAs5evf005oB8sr1x/xQt1 OYeHXLGZkdjdRh8M4YVpGWLQiKifZ9+OEmHziESLRVGWbg78y16zcn9+r6GpiSVKy40VvcpHlKr
 INfKQCnkNOw7VbDF+lgeoY4BmmEoeBbYuuWC5pwwLxDEc1iWN/uwUevFyUyGV8TqQ3YzaUym

On Wed, Apr 30, 2025 at 02:18:20PM +0100, Ryan Roberts wrote:
> On 30/04/2025 07:37, Dev Jain wrote:
> >
> >
> > On 29/04/25 6:49 pm, Lorenzo Stoakes wrote:
> >> Very very very nitty on subject (sorry I realise this is annoying :P) -
> >> generally don't need to capitalise 'Optimize' here :>)
> >>
> >> Generally I like the idea here. But some issues on impl.
> >>
> >> On Tue, Apr 29, 2025 at 10:53:31AM +0530, Dev Jain wrote:
> >>> In case of prot_numa, there are various cases in which we can skip to the
> >>> next iteration. Since the skip condition is based on the folio and not
> >>> the PTEs, we can skip a PTE batch.
> >>>
> >>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>> ---
> >>>   mm/mprotect.c | 27 ++++++++++++++++++++-------
> >>>   1 file changed, 20 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/mm/mprotect.c b/mm/mprotect.c
> >>> index 70f59aa8c2a8..ec5d17af7650 100644
> >>> --- a/mm/mprotect.c
> >>> +++ b/mm/mprotect.c
> >>> @@ -91,6 +91,9 @@ static bool prot_numa_skip(struct vm_area_struct *vma,
> >>> struct folio *folio,
> >>>       bool toptier;
> >>>       int nid;
> >>>
> >>> +    if (folio_is_zone_device(folio) || folio_test_ksm(folio))
> >>> +        return true;
> >>> +
> >>
> >> Hm why not just put this here from the start? I think you should put this back
> >> in the prior commit.
> >>
> >>>       /* Also skip shared copy-on-write pages */
> >>>       if (is_cow_mapping(vma->vm_flags) &&
> >>>           (folio_maybe_dma_pinned(folio) ||
> >>> @@ -126,8 +129,10 @@ static bool prot_numa_skip(struct vm_area_struct *vma,
> >>> struct folio *folio,
> >>>   }
> >>>
> >>>   static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
> >>> -        unsigned long addr, pte_t oldpte, int target_node)
> >>> +        unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
> >>> +        int max_nr, int *nr)
> >>
> >> Hate this ptr to nr.
> >>
> >> Why not just return nr, if it's 0 then skip? Simple!
> >>
> >>>   {
> >>> +    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> >>>       struct folio *folio;
> >>>       int ret;
> >>>
> >>> @@ -136,12 +141,16 @@ static bool prot_numa_avoid_fault(struct vm_area_struct
> >>> *vma,
> >>>           return true;
> >>>
> >>>       folio = vm_normal_folio(vma, addr, oldpte);
> >>> -    if (!folio || folio_is_zone_device(folio) ||
> >>> -        folio_test_ksm(folio))
> >>> +    if (!folio)
> >>>           return true;
> >>> +
> >>
> >> Very nitty, but stray extra line unless intended...
> >>
> >> Not sure why we can't just put this !folio check in prot_numa_skip()?
> >
> > Because we won't be able to batch if the folio is NULL.
> >
> > I think I really messed up by having separate patch 1 and 2. The real intent of
> > patch 1 was to do batching in patch 2 *and* not have insane indentation. Perhaps
> > I should merge them, or completely separate them logically, I'll figure this out.
>
> I'd be inclined to just merge into single patch...

Agreed!

>
> >
> >>
> >>>       ret = prot_numa_skip(vma, folio, target_node);
> >>> -    if (ret)
> >>> +    if (ret) {
> >>> +        if (folio_test_large(folio) && max_nr != 1)
> >>> +            *nr = folio_pte_batch(folio, addr, pte, oldpte,
> >>> +                          max_nr, flags, NULL, NULL, NULL);
> >>
> >> So max_nr can <= 0 too? Shouldn't this be max_nr > 1?
> >>
> >>>           return ret;
> >>
> >> Again x = fn_return_bool(); if (x) { return x; } is a bit silly, just do if
> >> (fn_return_bool()) { return true; }.
> >>
> >> If we return the number of pages, then this can become really simple, like:
> >>
> >> I feel like maybe we should abstract the folio large handling here, though it'd
> >> be a tiny function so hm.
> >>
> >> Anyway assuming we leave it in place, and return number of pages processed, this
> >> can become:
> >>
> >> if (prot_numa_skip(vma, folio, target_node)) {
> >>     if (folio_test_large(folio) && max_nr > 1)
> >>         return folio_pte_batch(folio, addr, pte, oldpte, max_nr, flags,
> >>                 NULL, NULL, NULL);
> >>     return 1;
> >> }
> >>
> >> Which is neater I think!
> >>
> >>
> >>> +    }
> >>>       if (folio_use_access_time(folio))
> >>>           folio_xchg_access_time(folio,
> >>>               jiffies_to_msecs(jiffies));
> >>> @@ -159,6 +168,7 @@ static long change_pte_range(struct mmu_gather *tlb,
> >>>       bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
> >>>       bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
> >>>       bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
> >>> +    int nr;
> >>>
> >>>       tlb_change_page_size(tlb, PAGE_SIZE);
> >>>       pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> >>> @@ -173,8 +183,10 @@ static long change_pte_range(struct mmu_gather *tlb,
> >>>       flush_tlb_batched_pending(vma->vm_mm);
> >>>       arch_enter_lazy_mmu_mode();
> >>>       do {
> >>> +        nr = 1;
> >>>           oldpte = ptep_get(pte);
> >>>           if (pte_present(oldpte)) {
> >>> +            int max_nr = (end - addr) >> PAGE_SHIFT;
> >>
> >> Not a fan of open-coding this. Since we already provide addr, why not just
> >> provide end as well and have prot_numa_avoid_fault() calculate it?
> >>
> >>>               pte_t ptent;
> >>>
> >>>               /*
> >>> @@ -182,8 +194,9 @@ static long change_pte_range(struct mmu_gather *tlb,
> >>>                * pages. See similar comment in change_huge_pmd.
> >>>                */
> >>>               if (prot_numa &&
> >>> -                prot_numa_avoid_fault(vma, addr,
> >>> -                          oldpte, target_node))
> >>> +                prot_numa_avoid_fault(vma, addr, pte,
> >>> +                          oldpte, target_node,
> >>> +                              max_nr, &nr))
> >>>                       continue;
> >>>
> >>>               oldpte = ptep_modify_prot_start(vma, addr, pte);
> >>> @@ -300,7 +313,7 @@ static long change_pte_range(struct mmu_gather *tlb,
> >>>                   pages++;
> >>>               }
> >>>           }
> >>> -    } while (pte++, addr += PAGE_SIZE, addr != end);
> >>> +    } while (pte += nr, addr += nr * PAGE_SIZE, addr != end);
> >>
> >> This is icky, having 'nr' here like this.
>
> For better or worse, this is the pattern we have already established in other
> loops that are batching-aware. See zap_pte_range(), copy_pte_range(), etc. So
> I'd prefer to follow that pattern here, as Dev has done.

Yeah I'm fine with keeping this 'nr' stuff, I don't think there's a great
alternative.

>
> Thanks.
> Ryan

Cheers, Lorenzo

>
> >>
> >> But alternatives might be _even more_ icky (that is advancing both on
> >> prot_numa_avoid_fault() so probably we need to keep it like this.
> >>
> >> Maybe more a moan at the C programming language tbh haha!
> >>
> >>
> >>>       arch_leave_lazy_mmu_mode();
> >>>       pte_unmap_unlock(pte - 1, ptl);
> >>>
> >>> --
> >>> 2.30.2
> >>>
> >
>
