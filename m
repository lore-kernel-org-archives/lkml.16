Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF162063F3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968316; cv=fail; b=qXl5ZgsvX8I3Jt4qJCQQ8Tm1Orr/x7UsHUDkx0/cQ6eM4ifs40qkbLZfxbeaoUB52GdYzhxxxhQO2ahJmYSBc1ikB9oITWylcFQWR0msff8bmmoVVaGd8hfBtls9z7gYTGwSnLKhELzSKyQFeH31Eq09KNcihWCMYV3TUAq2Bjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968316; c=relaxed/simple;
	bh=AbQ0ujC+pZN3ZIhYQ78H3kvv58KWWn76OsDtiQDroLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hdXCs2sURXrQg4t0SIdqxIdtsOSKa/wZGg8etunrdrR8AkpwrK1oj9RQyPFziuSiPIfTxy3PWclfZI0Df6DaCaGpkgbJ4rHOgoh9xTMZhV8WnAR+p8SY1sxF14AYMvuec9yl9Pjb/JKBEZSLkifyddgOoQQCU8OhRbNtNa4pQmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JXacLeci; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gHluXCE2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JXacLeci";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gHluXCE2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QFuCxT012840;
	Thu, 26 Jun 2025 20:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gvc0ZcP1+4cBsGZsqQ
	e2l3opPBGTy/zLeiqUBct8BiM=; b=JXacLecimdxE0PT8dCPw9U7Vto+ckJ3pEN
	Cof8zVX/qaF9phgV91b/cNTXbnY4RzIKMGH4A9PXeNKygI/hAq1pYnKYmIteFS4p
	pwuYv3IhpKRyHn3jZzFHPM1O1olJHbrZPORDR9IYz2iII+ZphONM0LpdO+XxopOm
	e1qZQBjBFtxUWIlf+X5pCFvVP1ciETaygP7DdKUCjn38cjiAOfV92dY8AXq9Kvjt
	7d3SX6VBjNC/HBTgRmnBO1+3fD+CtbHDEq1Z/SpY+M3JMpQXYNCdEtq2FFod8YMl
	il2KW4+Ue3KSwocJp2FPsjgMCcH6BkTuOBKvC+TLgWWtfNsqXMQQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5skpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 20:05:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIVaHw002549;
	Thu, 26 Jun 2025 20:05:00 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47h0gvdwuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 20:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbpuMk3KWexLg2xCfPjYP0vOfrpsSDz1gZB2cRgPfoS3QWcKroBLP48+R24CAQAzXGo9vThdscriKR19bbCZTdkkJv7B/mVmGt14eRD7eAYna1uO5QDA0RnYNamFX3aMT2z5InPZSGzu61Dd+rfrn/0w4OphXTDNjW4staFfnYA/gzE2JljKLaLHMzXTG6wQoxDrXJ+dj7xd+sucVNVMLHlQjgyAja8lgDNqcJ1CcrNQPJ/IjoqVowGpjSfjK+qtRmXoD6ha3Q+Dh/1uUM0CNfBwSH8QkuHgeJ799s+5tebcpeDHKW4ZzFl6WUNllwr0x4/rRnBniM/1PNUQ2drefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvc0ZcP1+4cBsGZsqQe2l3opPBGTy/zLeiqUBct8BiM=;
 b=m0jiryi9wwDcpEje7Mp1C2IIOh+2YlSYtme0LnUMoIb0WkMQg1aDSkCIeKh4w3oITdJBMbZIjbCLA2srJqPNVEM1TrzoSG1PvZyuuVEn4HPS68bRHzELGkwKEuZD08ooAhUlW0p4kr9wcnvxoHBkWbAdHeaL5ZmBxpnrw/LEXITj6WtpzbVl1lqyo36sg2mW8ltzfUWjvKHS4frBbZVpMLawL+MdBkZpBL8mtMA0kidHN3huvxzeFKUDM4Np6jefQcLoNBMz0wC5dnjvaI6edrKqAmy1A3zqfZvt/Wn5qQkCwrMzkoX8VL+XOuzXAYjunZIiQm9k6P8Aj0KKS2CuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvc0ZcP1+4cBsGZsqQe2l3opPBGTy/zLeiqUBct8BiM=;
 b=gHluXCE2DfevbBj0DDMHA7LrL87S06jivx0Sz5IA9D98ZDUKtDHRyOJAkhIdZPavjl+ydX0fspiShZvsY+Y75w0LUrBEVtIRBgHgZlZNV0oVPGbL2+IJcbCRvpl6Juwi1ugXZBGQxkDUm9DwL9dsSafoi6GAcUeYnUbbjF5mQpw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA3PR10MB8465.namprd10.prod.outlook.com (2603:10b6:208:581::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 20:04:58 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 20:04:58 +0000
Date: Thu, 26 Jun 2025 16:04:55 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, richard.weiyang@gmail.com,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] maple tree: Add and fix some comments
Message-ID: <bxhfvhmk4iyyz7l3nitsgf4xgsydraskligg56n4ww3fe5zlvr@xqzh44dk3q5b>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, richard.weiyang@gmail.com, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250626171918.17261-1-dev.jain@arm.com>
 <20250626171918.17261-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626171918.17261-2-dev.jain@arm.com>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YT4PR01CA0381.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::14) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA3PR10MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecc1c92-e53f-49b7-b77f-08ddb4ecb9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?80Fj1lCdYejHpOMPHexx1pkvJ4ktxWMOWV3NEG2NlmfOoehwvFPTAYjN1D7+?=
 =?us-ascii?Q?5R9C3UIAkHEM+fE9d+z7bEYH+vcvUjSMVNmdLm/aeldjY4SjqzI9YaTSxWcv?=
 =?us-ascii?Q?EfMqcXA4X49u2uoyThg4S0LiZCQWqkBcoISh5LbdT+MVDbBIGQg9Kf1SBQDq?=
 =?us-ascii?Q?dM+g6816XlAtOIqdWVdl402FJhosToqF7zDx2fXqK8HXSkSUH4q1tayRnxAB?=
 =?us-ascii?Q?hvNsmE5h1tlARbl+7q/R9PoKQiLrSn4VezSzBLnNtb5YejOVKTyHwlVBWIOu?=
 =?us-ascii?Q?sqhDgxH8icf7CiU7VyKx9RD7f+M88HI1/GJAzZXX7G5eljbO6qynIQHk4v73?=
 =?us-ascii?Q?UysQWjuMO4A+cIpp5llRUZqZC1dCCbXwoGi1J+CK24aDGLEiIGaU+wqqlHqw?=
 =?us-ascii?Q?UFtF1DnKrvGFLZbu2dXWDK8+kxXE6h33ds0lasSzoMhA24rz/D4n5y1hZ1gC?=
 =?us-ascii?Q?gfnpwJNRWaLJW86Bez2n19plGsUGBZWEg4oiseyNTE4bp3a6wFF13Ri+P31S?=
 =?us-ascii?Q?jj6LqaPLlCQQ33lfqAynQqBsxmP3M3gOxRCqNqDSs3kBs5r4zeZvy2ZXmIBW?=
 =?us-ascii?Q?cC/37XNQ/oFj/NwGjEbrcLfD1lGc6F/wdxyCq4TLrzsQCS+qs7e6fVhG+PYT?=
 =?us-ascii?Q?3j52apYCRJNjpguCcCbgbvuIohaBVHv9vMcR/hP2poCImjiPJJBgeALU8sll?=
 =?us-ascii?Q?3H7JDWnnRM69HWaZOKOUvj4w4MQzFGAKFH7sSX9FiWaJLgQJDxa+NNkn5HpH?=
 =?us-ascii?Q?vSeRDvd71AAKW0iXUreyg3bbjbYMhF6j3FTXYU4zYZPHXoIlfd23N/3RwAvr?=
 =?us-ascii?Q?FZpU8eCb2mDv58zNmcRgRDmySudSDRSqzzaMZXhQ78fqXoHu2ZpQd1RO6orO?=
 =?us-ascii?Q?8Lm6tUT6hmpSLtYZZ2Nje530mKPlxeSJuNM6SQzo0GKIpZiI+SMXgtcqiMO7?=
 =?us-ascii?Q?Rk8s+dWnBNpKLygaPMyKM33nyjj71rtuHhSkf1c7Fdp8ZaMmdSFHdEJ3gLCw?=
 =?us-ascii?Q?hbz0wfwXZgIhqLLYy6rq1b0CVYhv7yg/oeb8ElapJ6p2dARzLsZB2XAQcVDe?=
 =?us-ascii?Q?xarciMsVRQhfauv3Jt3IdBYRmy5kj7kCvTdJ/4I3kHPcabghk25cIqRXjUOh?=
 =?us-ascii?Q?N9AfKXwn0tYG/qEaYed+kldmFBIE6uEuEpbhSrBrD1yrpYmF3SDD9BJiKE/c?=
 =?us-ascii?Q?+3CIjCW2Ib8YrdpQNUQoDUHyh7eaao8KAauV+EpiN395NZ/2j8ljnTUcoecz?=
 =?us-ascii?Q?8Eu8kDpNvMSNc0+kb8dfIrZX7XAv97AIJO0nKqk8nH/q/0xW10LAeh4EU47f?=
 =?us-ascii?Q?ot0rxvu2cb4h7Czvc4WCTYNhniJ+3SB8/COcaaNZqKRJPO92nV88fmReLRWt?=
 =?us-ascii?Q?THKzpqqouOqrN5ViomvUsXYUbdUmq1BQst11hrDq4VNLQLvZDOQ5nGKXEiF9?=
 =?us-ascii?Q?4IG0qjrtO6I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CK5MlXnsSe4jiJjT1QsTSQaz+HzRaqraPR/0y1QFoESaRBuFGauQeSEXLV4T?=
 =?us-ascii?Q?iC0Pb6xbxOScOd2SG73poOfu01AdWqHNlnky1Lqf26fA6T585rqKJ3HPfJR1?=
 =?us-ascii?Q?mWX8kRnHxMcnMseyO8iUNmR7+CAXL0K9k2SS5/1ZSf7dvbF25+Zv/GVetIua?=
 =?us-ascii?Q?6Bu2UwVQ+98Kn4cb0ZvPj4cwxWA4dVRY52X43rkU9XVhu4thhTfA8nFq6TUp?=
 =?us-ascii?Q?PITbLMLwKDIeEkDiNojFW9dhPD59t4nmMpIWUz1oIyUQZdb0Lip4yCgaEdfl?=
 =?us-ascii?Q?7/V0IHzlbr5DJhnqvJaRwt9rb0oLwUDiTNNDzHfCgHKI56OKZ1jpvPlQsiWZ?=
 =?us-ascii?Q?exSJB8x86p5cmqlp6izj+FjxQJrv9SS99eoVwDcNaAFrOcnmFcNbLcMDJcaq?=
 =?us-ascii?Q?CxnUAZFCaotEKXoOZVLIvg0OvUGep4rUXVtBlsVgRiPQ7iIjYjhEnDpRkR6V?=
 =?us-ascii?Q?yPF/VT+BD9euxdEKv3JQ6OgHz7xFIf6+IziH0S1Zo8jNmBVyjK8mQgJVWvrR?=
 =?us-ascii?Q?EyK0lY44hLoi7m8rLwhxgH29f4h68trFA/fjI57n203xZX2CIckxp5lzV+wd?=
 =?us-ascii?Q?f3/Jby2gOkRM6kPc3KSsuhPW8te52q+xJnLmRHwSy5XKRvZKgcFEdNoNHqQw?=
 =?us-ascii?Q?uFUbjU/es6aHRWrvJW39odpgb+SPXQ4k52h3XXbHetT2iJy0wtTRHaRSiwgP?=
 =?us-ascii?Q?JE2PE7Ochf59yJVAjSaBQTAzEq5KiJXe/cTtyzG2e0UnTmRx4dDdaP9sjlLM?=
 =?us-ascii?Q?mCg5hL41+arvkgWkzzynfatLbf6l6gCrh/DC13iAApiTHn73KNJQQmf1sZNk?=
 =?us-ascii?Q?yIbunsx1BKHt262yhuE2N14RH2JAR+mY2Z0AxZYGpKlK/0+6UocpdwvI29NY?=
 =?us-ascii?Q?3yYgQJqYn0UMLUnKVUyl242yNl8Hh9G7DDwj6qIb72cSNzkQbGfI/ByJn42z?=
 =?us-ascii?Q?6zFu9h/AGwE+hAHeWBUM8h+IqW+E7YP74W6TLhbCNagh5A3vnwJK3Hx8awN9?=
 =?us-ascii?Q?h0uaF6jric7CqHxS0INzioKYNuYxTStBL63oYp9O1O7J03KGbNhpAJXSgRje?=
 =?us-ascii?Q?b9WusJmrkecmtdrs2HPzrQHpVM41dQomgt5sOooH6RNxCmzpQeQPY0c0oY4z?=
 =?us-ascii?Q?Crdw4PLVBmIhW0bDFd9g/6We84tSvMhwTTJ+YPqa4wgY7igJp2hgz7OVL8P0?=
 =?us-ascii?Q?lgJ0Q96hv7t6HpFjODDV2KlYC3y1yNs/1xEYUWyUwR2rciyM/fsjq6dn0Huo?=
 =?us-ascii?Q?N6suiM5NPBazGDuHrYlVojBTyF7KsYWXPbW7BB0NHvkHVFLmXUeTQg60iCHn?=
 =?us-ascii?Q?/mvEaDCeF9Tkp0/+UOXcpMoNLdkqnOnZi5XsyDh6PkLriwWZJ+uZFP++zo66?=
 =?us-ascii?Q?FfOKc3Un7cN7Ij6vXyO/LKlCLD2HzyvDcNAeCBnvi0tRa+D/3Eo5mPTWTgK4?=
 =?us-ascii?Q?9qBeUBzrxSl+SPXLDMEnPG49Aibu1Vv2u/BGDk+/plg7XPJlha5da0LlTGyd?=
 =?us-ascii?Q?IQLgB77j62PtKJfux+1N4+g3dvUSc5PZF4YSTEu+2ubE18NOZ7FTxBOxXnoC?=
 =?us-ascii?Q?AUh1/oBIE0V/9r7l+i0DOCVDoH9lsHtxD7xA0H4X?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	igvu0qCFHNbw1bxokP+IbDMsCZa9wlC37TlZJfC26Wa0CpfyryR0IhbZdqlf4pfBVeW1TUKrW7FqL1I8Gbn7HW1G5LgMil4QpUtDuVBD3c8Xf3sBodHv1KdLJIIQyg0Nw04TQGIkocHs/btPRwYm62KUM+tbMpAjkvftQLNPqWGIlfRUwnmAP250Oc4x4J4U/lT8nJThf/AepSeGYR9wtSX+fMsalwHo7JZlHLBIfUG8oSMK9YAzcxtxP4z61T0Waq9nGv+W3GkEd74v1YG3+iCcYQHThbd/kxvF+ef1+EWHG+WHSCd305942Xj8m3PfPffb5ItUREOf8hDRahiSS43N2prEufaiEy3JKEePm+/OXiAwJiXdq+0SBkpSZgqSZ3Y6Fay7pxu3GP8gdVc+h4mIbvJDiklX7kLlnG7a8CRpR3rAvUinreeyBR35WP5TYRGFqqYZnuOxWhgNoQqmM2JTLeNQEK1os0tA21MgU1NKXyBbrmtCvN7Eo9M3fZe3EWc5y9udpwYHN+qN4NnTTMgwV6em9QfaPFBgb8EiGw0ljOQoRuHsxTUFrur5GEbq75bcLv8CtAwYlyXj4Sk0UEchOVzaKOY53BznRotrbY8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecc1c92-e53f-49b7-b77f-08ddb4ecb9cf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 20:04:58.0804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RolDwu63QJzzuyNnqrpMI0qMS+VRMrM0hQjLWlwcjZJj7qmCyqY4lDmcjZWZu+L1zbGVHCbkdkLt7GkZHXXntw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8465
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506260170
X-Proofpoint-GUID: sZRfhKp3x11t6AhWl0WmaICtwKCaSMxH
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=685da7ef b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=bUWV8NHWyW66PG7qbqAA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE3MSBTYWx0ZWRfX642NG12S7ia+ HtFdoGbG7BxD5Su1tpm3SSoAfvCGMrT9tCsStZXbrEXDkoyO8C3dHRW4TG3ZZGYu5k5VVd+4DMT QP1rcJGKcNyzrRxoxyiJgRqeA53IUQE6K7uHSm8q2c7qJFZ9nOmt7qpOWDiFIYUHp06PKv/CJ7+
 gVB3X29vX0MQyYoUKesmQ/hb1jD2AMDIZ++Fhgx624QJJ2MuzBdZmeMctE/CBJJBRVGSdH74CSV 8J5+Axk3p05A281rst/6C2hhAlroXT+kwEl8nnBNATV+389X7dPAjPPUMr2BINS5VUec1yOfGTh FYkgr+h+8Ys7u08nDr0Oy2k7X6ONazvmuLvgkVyFDvmg1J2SHdwh1BEUOsk45fLLdgTRQLio1/m
 iHe14lp9N3eo65cAA/gfOLCXyAKBp38Ojyot80CGiWDd0jnJm3yKtDPlxrwqc5ee4qn9ce+R
X-Proofpoint-ORIG-GUID: sZRfhKp3x11t6AhWl0WmaICtwKCaSMxH

* Dev Jain <dev.jain@arm.com> [250626 13:19]:
> Add comments explaining the fields for maple_metadata, since "end" is
> ambiguous and "gap" can be confused as the largest gap, whereas it
> is actually the offset of the largest gap.
> 
> MAPLE_ROOT_NODE is used for mt_mk_root() and mt_safe_root(), indicating
> that it is used to mark the node as root. So fix the comment.

That's not quite the entire story here.

The first pointer in the tree may not be a node at all, and may be an
entry.  So having that bit set tells us the root of the tree is a node,
so the comment is correct but maybe you have a better way of expressing
this information?


> 
> Add comment for mas_ascend() to explain, whose min and max we are
> trying to find. Explain that, for example, if we are already on offset
> zero, then the parent min is mas->min, otherwise we need to walk up
> to find the implied pivot min.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/maple_tree.h | 4 ++--
>  lib/maple_tree.c           | 9 +++++++--
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index 9ef129038224..bafe143b1f78 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -75,8 +75,8 @@
>   * searching for gaps or any other code that needs to find the end of the data.
>   */
>  struct maple_metadata {
> -	unsigned char end;
> -	unsigned char gap;
> +	unsigned char end;	/* end of data */
> +	unsigned char gap;	/* offset of largest gap */

Thanks.

>  };
>  
>  /*
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 6c89e6790fb5..e4735ccd06f2 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -338,7 +338,7 @@ static inline void mte_set_node_dead(struct maple_enode *mn)
>  	smp_wmb(); /* Needed for RCU */
>  }
>  
> -/* Bit 1 indicates the root is a node */
> +/* Bit 1 indicates the node is the root */
>  #define MAPLE_ROOT_NODE			0x02
>  /* maple_type stored bit 3-6 */
>  #define MAPLE_ENODE_TYPE_SHIFT		0x03
> @@ -1053,7 +1053,7 @@ static inline void mte_set_gap(const struct maple_enode *mn,
>   * mas_ascend() - Walk up a level of the tree.
>   * @mas: The maple state
>   *
> - * Sets the @mas->max and @mas->min to the correct values when walking up.  This
> + * Sets the @mas->max and @mas->min for the parent node of mas->node.  This
>   * may cause several levels of walking up to find the correct min and max.
>   * May find a dead node which will cause a premature return.
>   * Return: 1 on dead node, 0 otherwise
> @@ -1098,6 +1098,11 @@ static int mas_ascend(struct ma_state *mas)
>  
>  	min = 0;
>  	max = ULONG_MAX;
> +
> +	/*
> +	 * !mas->offset => parent node min == mas->min. mas->offset => need
> +	 * to walk up to find the implied pivot min.

The => arrows here are a bit hard to parse, especially mixed with ==.
Maybe use more words?

> +	 */
>  	if (!mas->offset) {
>  		min = mas->min;
>  		set_min = true;
> -- 
> 2.30.2
> 
