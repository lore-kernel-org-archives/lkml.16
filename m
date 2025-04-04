Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69E51EBFE2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776419; cv=fail; b=ofMSC9HFloSFTfp3Bg3T0CJ+KuRwQSkXWpuuZ0MEBuvxmoSLDAUwU8MeCe9mdl9g47b4xgb0jIsN+6sUyDO4UMmU89urPP6RUG8dMnMM8P+VxqpXxMJBngIWsN7BcN1oGhMITUwt+mOBJHzPFVQ29CRkI/J7Zd4RxvmTRICzZRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776419; c=relaxed/simple;
	bh=sFC1VkJVsxLzHXvdEOVJTwGoD4hRKBMGtemcuJx+mPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QO5gPBHLc7sIldYhtftNneHQuZYPBeGeFZ4FtIv/nHe4j7aKScvOJt6ZMXFr0LbMl5QfpjYZv19dsCnmP8H9/AEpZdbv711bh3RamKplLAX/MMA/sk4QyYR/sK0N2XuhXRavKr14+G4mhWmcc7bvZ95JOezC1T+iKCrTpH/1bpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lW3a2LZI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w3gZ2uCG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lW3a2LZI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w3gZ2uCG"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534Du4WL027721;
	Fri, 4 Apr 2025 14:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Spw69sBqqlJQ3suk2R
	3cST7Od3UiV0VBKZcsjZkfwWU=; b=lW3a2LZIDnHM4iAnxscpfO9B6uylS/8gq0
	542MITIyJHLsiS0HvkJv6QuX4QYBAk0etrAXMyktw13Yj6NmvnzkMn/+z9WXHFiA
	8cxCt8EH9MrhvDe9VOASvcJOiqNwuVg+ru/L3dVQayT1oB2g2z80/NP9PDWQ1iV9
	QkTTo+gjnGSVxXmEWW+NRP0uy2ANGsrtK0V1QAzTr8pQauZsIsK8xWc5RNE00mh9
	Yw7b37JeiE4KHXxgo+DyyPSHiBBcSHg32jXNi7RVx2uXn/fnqHRX3MUBZrOFdnwN
	yxli3K9mZRPKa7AWJJP0LXeV6Kyd5tlJtA/mgonAv4SzeDOsjmzw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p79cf8wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 14:19:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 534DJR8u022437;
	Fri, 4 Apr 2025 14:19:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45t2ykuev0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 14:19:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTP1Yl86oBFAHISFvTSYIQ+BrFw8ttxM+rqaCV3jlf8KSxKQZiaEivffn1yZsJAxk40XiA+vYdmzwQWCaiJANQsTu0nql98E3fgRS6w3+ZQziczXNY/HT5vwMdBEjpHMbBa8JPXITutDJIDzwHYORegZczlN/vdU7C5b6ZpmPYlcZtIicCl5NshinZ0Ip5Gt3sLlly0kCLG8v8STEFkNYkNT9aPtFcVJr9rt/TmkzSE7Iz+eWDTFe0NVSpiUcl9uTXGHOPX6Ujc2kTD2huWpmeJr7hA7C2GVW/1I3UQTtChbLDBCJzcxDUHPxGjvwiFpEWGQrFIa7bb+Qf7lHsuv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Spw69sBqqlJQ3suk2R3cST7Od3UiV0VBKZcsjZkfwWU=;
 b=KP2qJtGQzd0qJNu9j4b5K1qDpWkhU0iRrHrqY3FJidKI9An28T9TYv6SjSOGXYD66uHitRIxAeBwlrpbBWwH0lQ5tQtzNsB6QskQVCP9LOs8eOyAOwiY9QuzPCL0drY6YEudbtGrvs/QVQUx/cHrQyXBRxBZ/5sH1kw7kVsAWKT+eXxBOXZGIooeCiE1V5Qr01Pvaq12kesey/tHYPr8gszln9ubQwuN78NEAuxwjkv94ltXLpAwUJ+wgDRPf8yZMssifQDoToarioWkXDK6lDLH9wEDScW1vr7oF+WHBRzmlMdp0ZhZduVnhHBCimQmxf+lnO3KhTp1EqPW6lX5sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Spw69sBqqlJQ3suk2R3cST7Od3UiV0VBKZcsjZkfwWU=;
 b=w3gZ2uCGsJGycPvXqnqx9nm6T/pDr/u20ER4wRy5UQShfbjR9UGgvDw5qsohvEFWEWYk75XTL+oT5qooCa4Eo0VhrmMhAyNnMj60atovMrBpbcTxvppAIeH3t5EPF29FEbcZcW+zyniHAM99tfLxaZ8dG3yNDcf+601oD78WGTA=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 14:19:10 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 14:19:09 +0000
Date: Fri, 4 Apr 2025 15:19:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
Message-ID: <5dd880b5-2166-4c7d-be65-d1b3bd3dad3e@lucifer.local>
References: <20250404124931.2255618-1-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404124931.2255618-1-david@redhat.com>
X-ClientProxiedBy: LO4P265CA0289.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::12) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: dc186224-6283-4255-3373-08dd7383a9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NoQSgikQO2ZBI3whEGrNygK7ImGgmIrAwwl7u7Fmynbs3lF4hG8DGhpk7vtK?=
 =?us-ascii?Q?1y3BSU5E4yYyzrF9E81WgYsUvZ8EmS9nGLddzRw9sBWWi2vlzsaMOPjHhJ6+?=
 =?us-ascii?Q?rQUKBeK35M612YfeDGJfTScw9p/EnbKh3RjrUYxpOxv4pH8aiZ5OO1NYU9Ee?=
 =?us-ascii?Q?Q7CspbdH9p6/rjrvhm5DDeqBtnjlSL987W/7icgKRJT3Didjrd9xUYnVUqUM?=
 =?us-ascii?Q?Z7UB6rKw166YyKsXfz9ZsoJK/vPfCpytq1yG1PhxTPZBqiVN7120tB9Wo1Vs?=
 =?us-ascii?Q?lLxM2/n5X/g9tJVskH4I5Z1GPEYhazF/tLkPPbhCZ1Cu8GkRIVu4g+lt5J9u?=
 =?us-ascii?Q?vgOqVXT8ezwT0Azs2yY0Wz9/iug4fHBUTB+YFa06h3jfp/bCYJYx7br6ZrPe?=
 =?us-ascii?Q?kUBdrhIzORXwqkfRZBNYLOHJ90dOLq4yXzt27K7xh8YBkvA25M6YNn1r451M?=
 =?us-ascii?Q?V/JFh+LafybC8FaFID3bcuO2P8hJqHPZPR3I8oHt4ovPntnAdq47oLPl3aJC?=
 =?us-ascii?Q?WbAoiSQCIjDAPAYspmLrHyPhlO6ucdkhFEEOwx0OzIENIUvqoM6MlwvIuAZu?=
 =?us-ascii?Q?kLhwVSudR+LMgFlzJDU7KSj3BjQ4Z0u3qnOdLavj/ij8lBS6qv5QVSW/1A73?=
 =?us-ascii?Q?RmN8uYWJTCLBU1jhHUHIsQ0yCGsI0OAOIUSDkup1qwBHta9odkqoUC+Zc9FN?=
 =?us-ascii?Q?GM6qRngf6cO0ho0RUSSvrBqXw82Q9/sQ3PzBz6GBXEL3PVBnM8c2ukEsesVn?=
 =?us-ascii?Q?wenBtoq9kTQbOiPAWo/EAAPw7pN6HP1YQ9XF3tJhiDRFq2FGMWaGdfd25lG/?=
 =?us-ascii?Q?xsn6XQa0yR7OJd38zWeyDP9plUJ/V5kGpHNSxnXdKEDavuz44xhYRJTpsKOE?=
 =?us-ascii?Q?7zzgHosiufRxZ8fBQY0fFdn4YQtsb8S7BrG3vCChguZdEwmAMEsy43FJqZuM?=
 =?us-ascii?Q?Y2+WhbTeoWulSx7fHOVDGUGFLsku++2pVATT7yCEmSLUbiJlP1ShQTdsJPsU?=
 =?us-ascii?Q?MVHYUR7uNPasowRYWAuiZ5PIe3tjx2/S2ysCFFdQDX+X0IMNvi4mHRER7q0U?=
 =?us-ascii?Q?V6xJzFk/Co6Vv4v00mMtm0GVg9fvPWIjhFfp3tY1FjbNwjL7TIVc4kp9yLQI?=
 =?us-ascii?Q?eWqXLqOEqOOKUbAdIOfTET7suy735ZDcjSZvkyHjAR5RG+nCiNsVpTPUYdd8?=
 =?us-ascii?Q?M+lmIfQO1EJXjiSkofBJOc0GaDcsqpxHfB+7qMTOzxBJSKcYvclmFh4pFuv8?=
 =?us-ascii?Q?1ee3dA8yXx+MkXjDNyGtWlMyo44gdfa8DGhpfht0LvF2lt0rr+MWfaeFL/iI?=
 =?us-ascii?Q?Vi15Vl+KPjNjeaRBW3Zpp/UL/GJDeHJrwQyfInUabwiPSuGPeXJHBq8gZLRC?=
 =?us-ascii?Q?3+un+Pn6HedaxadTY4jYjrh7jMvI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?spDCtTu1FFrNlj++S88hzwZQ4xsHOG1OAKr3p4FeZ6Fw5+maxvaTxrL+NEoY?=
 =?us-ascii?Q?O60JkUSRUBjV5pWWv3p11umFch43BqW64JBadtiOxgcOUiccbcUlX4RoCQ8r?=
 =?us-ascii?Q?t43fXmsTp6RLGn1Cc3Dk1a1RfFLAUjyXFRMBuoTwpnaDvLP0w8BAWnGIy2dS?=
 =?us-ascii?Q?BCmQnriu0Pg6jIHLVjKmfp1CC9g7L3r3PUPwKE8YnGGOkr5TSMivCR6NZOKy?=
 =?us-ascii?Q?wNRJmVTz1RZMXlQdlxUPcNjZ0vzNUtyPeYWm3dzt+TtxIAjMOswWngW2YoX8?=
 =?us-ascii?Q?Eh6nOuqp3AX9P0WGVgsySLYnvnyKvlL0DXPnrGCY/CjjtDh+c7mHjPyb7P+m?=
 =?us-ascii?Q?miWAN/hSWiN+ESagwu21cIbVFX/aodtCw7ionrXbOwSH3BDGc6go1FSggibU?=
 =?us-ascii?Q?TPtaFuxD4lM+lGiAFTrHFDdaonWsO11n3bXNxWfnSwSpxLSoAb1Bmg4M3eRy?=
 =?us-ascii?Q?yXkfrYgXlR696Pv5JgoOqMOHLzKlrR5E/UGcKFYa1O5mTHyzkaIj9GKsatnD?=
 =?us-ascii?Q?yff1GkbAUvu3Jc9L31tvENH4CDQ+SEncpRV/ozYQjsVWzhDQJjb/BKFj2h4c?=
 =?us-ascii?Q?3hgGeEBnQNei/5B/oHAUTQj5wWNogqPo5+9Qji/00x/RWCr1BEjoyHtlu/ls?=
 =?us-ascii?Q?gYkl4C0xXAu+m2AskI8Zpyv8AOqEtIV3bVJo6KPeiY5ETdyDz/QMI6QOXNf3?=
 =?us-ascii?Q?82C09NLY9A76hvowqc7gITfq7vI0zwXeDxwp2KIx76ZG0G+fOWkxAWUrdQhW?=
 =?us-ascii?Q?S7lWuuBqqfvZzJz16WsxPooPYknxuagAXXO76H/SaSdPrZojgml7WJjfLX93?=
 =?us-ascii?Q?53gK87ZAT5fCcECXBYrwVt3edrO80NibriVBNxwZCfV+fO7ruoAGFIH7uUWM?=
 =?us-ascii?Q?TskmYtBO+Pbq6CcqgsXrHNSFnSGyRTloKeM65Ce49U1zvgybZHNv8RhHUANj?=
 =?us-ascii?Q?rSHh4nJbUK0tf6MzLmHeCCkPwPG79oV981SYlEqADrCjJ5XsgxcpBHTN6RlS?=
 =?us-ascii?Q?Llw+3DRAeWuDxXxvjyoJSWUCPX4BUTvJAlN0nZnkQnQq2Zsx02hzkB5ABC4+?=
 =?us-ascii?Q?AFrZMDz8XvV11MMRmWlT1wtieACzV3V3xg36UvadqXoivJ9nub6CReNxDTDF?=
 =?us-ascii?Q?mnD5Rrvd40SJH5BQo3OzXacmPB2N2yWAHKEDPm51NR0VdFLNvSwbMVhg36o/?=
 =?us-ascii?Q?jI4FZuEcleVx6Ejg1TRiYUdxGi3DQkuCmCTjZFJfbz3RPPFVsaEpQvuh4FDM?=
 =?us-ascii?Q?jws/dpyoZQWGzcbesdpvs7MXDL1IaXmUZ1LAmZsznj3BtbUd63QPQ6/AKQyE?=
 =?us-ascii?Q?eykgMC9RfmVZzQwm0g3ILKSVtXxFEz1Mp6g/CHXRzt0XgJ4qBRwGmbj6J3gp?=
 =?us-ascii?Q?iHV3Cu4Kdg18CRjL85Nc0y1iH2hlvDYTO4Fs20+arL9ybBliABk5Fe7VHHRs?=
 =?us-ascii?Q?F/2djoUwVmFjwZ/Ks5UKLf6iFbgClMhqXi+epEDdmaJFOhyAp5McR2BASGyv?=
 =?us-ascii?Q?9Rny2o9DCV61vYVcJt7jIJflaRtvWzuUpU1reRnxZb4FYbCc8mkHeonfS2P/?=
 =?us-ascii?Q?YfsHasieWLIwGLZ0nVWX877n4Jc1oX1jIy1CwgmqxFtPFyJG81LXRtdC/Nhj?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5DhjH4h7Np2xaOD0TIcge6Kkc907nb2nG4NmqqDvs104JyYiuhGcJuwlDkLHlqXIem9YImKkBjmTyB3KIqabwu+XjReFKBiPRXRDkFPqKzgwPGHv7s2xe+zF57JMwCEk+vpdyJPk2KtF7skm+vfZkveWqiNwP0EH9CbTMtEpuIkhviFF0x+2FYnr94aso4dJEJ699p1sIZqTVSu1XRpMJnThjyeszzI95mdglQfm4ZSOT8dM+1f47DIUoussscZP/Gth+TJM+XasTHN4za4Vqxm5q4Q7bMNgny7ekfJBQgnZ0WncysibMd8sy6H6aI7qn0shqUDR94bL6q/hiHBsFw26DQmHbl/9/3yQo0qsmocFEntEc2nW5tRx9Lv/DcpJmC7KmvgePW7ph0++c3oZzOi2mAkHt23o2ApJd9JFuqrICaw30LbtSRO1tf3X78WDMqewyPAORiFHRAvTH2fQFTqvbQ7SZPyg3xkIdTU7Wy5FT8FoOXcQmNdteyOYMX/NbWhR0ZrC9XzlZwR1UcA6YXq+1sRfe7XuUQ96VQIqi+PmBcNAx3Rnsmg4X3egdHCTfk96+UQKUM6xbdRzNKnCTGj51tKJjsKWFfK7Crv3Mzc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc186224-6283-4255-3373-08dd7383a9fe
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 14:19:08.9770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3w7IAMsTHQ227R7MUaGzx0aXw/ejnydTfK1lO/ByxPasU9YqvB0cD3iWS3yVMncRtY1A4syWcso7OJDFvo4OxZWsEimkUK1lt9VqwvTUgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504040099
X-Proofpoint-GUID: ms6GWbUG8J3ZkwDqg6dpTc0lFqUoXe_i
X-Proofpoint-ORIG-GUID: ms6GWbUG8J3ZkwDqg6dpTc0lFqUoXe_i

On Fri, Apr 04, 2025 at 02:49:31PM +0200, David Hildenbrand wrote:
> We got a late smatch warning and some additional review feedback.
>
> 	smatch warnings:
> 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
>
> We actually use the pfn only when it is properly initialized; however,
> we may pass an uninitialized value to a function -- although it will not
> use it that likely still is UB in C.
>
> Fix it by always initializing pfn when track_pfn_copy() returns 0 --
> just as we document ("On success, stores the pfn to be passed to
> untrack_pfn_copy()"). In addition, to avoid further wrong smatch
> warnings, just initialize pfn = 0 in the caller as well.
>
> While at it, clarify the doc of untrack_pfn_copy(), that internal checks
> make sure if we actually have to untrack anything.
>
> Fixes: dc84bc2aba85 ("x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

LGTM,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 4 +++-
>  include/linux/pgtable.h   | 5 ++++-
>  mm/memory.c               | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index 72d8cbc611583..9ad3e5b055d8a 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -992,8 +992,10 @@ int track_pfn_copy(struct vm_area_struct *dst_vma,
>  	pgprot_t pgprot;
>  	int rc;
>
> -	if (!(src_vma->vm_flags & VM_PAT))
> +	if (!(src_vma->vm_flags & VM_PAT)) {
> +		*pfn = 0;
>  		return 0;
> +	}
>
>  	/*
>  	 * Duplicate the PAT information for the dst VMA based on the src
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e2b705c149454..9457064292141 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1517,12 +1517,15 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>  static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>  		struct vm_area_struct *src_vma, unsigned long *pfn)
>  {
> +	*pfn = 0;
>  	return 0;
>  }
>
>  /*
>   * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
> - * copy_page_range(), but after track_pfn_copy() was already called.
> + * copy_page_range(), but after track_pfn_copy() was already called. Can
> + * be called even if track_pfn_copy() did not actually track anything:
> + * handled internally.
>   */
>  static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>  		unsigned long pfn)
> diff --git a/mm/memory.c b/mm/memory.c
> index 2d8c265fc7d60..1a35165622e1c 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1361,7 +1361,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  	struct mm_struct *dst_mm = dst_vma->vm_mm;
>  	struct mm_struct *src_mm = src_vma->vm_mm;
>  	struct mmu_notifier_range range;
> -	unsigned long next, pfn;
> +	unsigned long next, pfn = 0;
>  	bool is_cow;
>  	int ret;
>
> --
> 2.48.1
>
