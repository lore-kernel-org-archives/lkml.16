Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115982550DC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309421; cv=fail; b=nhJPTK9r72daPmVhMMNZjgNmaEoA3ZnyqnPxcQVosxBR9Xwph+CJS/++JgONSCy6S/Plw+3xEgv1yYgHuIDfkOKTMK67MSWqixhm2KgPVS3o2b18+CIbkMDGHgjfZIWpLwWlIaYYRc2P1yTYCeesi5AHPD02EvcQnpTgCCMULc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309421; c=relaxed/simple;
	bh=Wa2teae9la0jj3Husfjg2vd/LdfhSYSQ0U+GUSWPDDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LdPZibOBi+MWD+XXzwsLms2LI0IWwUUyj2PkhPuhz2kgnaE5QbxfWgrWcWXYd/rFeI2r2udjsneaaruf8hyDPqMpHlkkTlWsLq9vVtrM3pEpmouX6LJrvYA08bsWELoneIQ/GlaQU8sWc1wyY6sz76k5BEJjRGeXM3RFqRPSiyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cb3F3Eeo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=o+Lx2IHb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cb3F3Eeo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o+Lx2IHb"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7NFmo007630;
	Tue, 22 Apr 2025 08:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=r1DKRf/xvB45NQsXWqQvdJTqvAOPSwcBvqRSoBzOBg0=; b=
	cb3F3EeopsL3jyuWjMlWBQPgZbYxLuFprc92z4JyvPmOQWTuUKbSu/3/hLyfBWV/
	hZnSOEMwYy87VS6Qzr6YK6sxY6P1/T3aU/INipww6EH4iXUhkz6dDHsXtat+mTpX
	a4YDLzwbHPQeH96sf2+wVL5t9cP/QJL9s00K9YpOniL+iXfWuXQdn19ZInAe7Sav
	j56FopWnrBOg4/DCnxJB0goOi0aBzL5EH5S8MfTQc2QsMKiWqUPeLcm6398RZ8nO
	eVMtC1ybRy5kuIHgJ4Ppw8Yls9FHGT8aQQxdAXQuIB/8FeOMLPwGXw0wmqGHBZZY
	XAvWokQYL/etcLFkhTJ+sg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643vc414k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6XkWu021143;
	Tue, 22 Apr 2025 08:10:02 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010003.outbound.protection.outlook.com [40.93.10.3])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429fhskd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2HyO/SKG3dIT8sTI70yQEuNI2X9crfZoy0eJBT/YLDbF2qq4FcraDKb2weXvlztwFy17BUY2Ka9SSGRQDz8EOOKqtHw0/o0c6tXPvu5az1LXoexej/IE1CSOumKjuu4dubwx3bkyTIWEf1BmiFhNpVaFwFSNASYOc7lKWjpw5coy+hlOKBdcWvep3KQlVkzWD4rtb+tAlXOWVOH5gWWk1IzC3aytcExiHSxT4KQffNVqKxrNb6DL91yIMTrjIud0vBOL+xYwmNKiBPZM68jpzC0SS88QleBMtYctjJwqxFI41t2RcZCJ7ENGj/+96sj5Uqdhm7rm8VgSUrdORLygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1DKRf/xvB45NQsXWqQvdJTqvAOPSwcBvqRSoBzOBg0=;
 b=BykyH4Dg9S+o5uh9J9K3fhV9fmTO1cCux3sLckKFStEicyuOXgF/GDiDdFHfbgcSMLa68K5Gl4IQq3/vAAZqOn8gtrHYVJxeA6J9JFtquKTi8AgUc1/Uw0vERjX3YF9jByMzzXu0fUeN783Pzc3ko0Iza15jwrcKgIGRUTP0I+rXQ6K9vLenIddqIHqJhc+KKVhpL2GbJAe0OhlTiFmuQG8b3sG6oASkrH9vjYqRc4xY13eZixN8Kmjwe8sNoPcPyHGNoQh2uvDHwQkZXBQAp+f2Ze+5EOAWa+RE1yYtEHx6Xc00yzAGbXcjIIjde1LQEWz/F35Q8cITFQUWB9pR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1DKRf/xvB45NQsXWqQvdJTqvAOPSwcBvqRSoBzOBg0=;
 b=o+Lx2IHbrPE5Q9tfbdBrallikjNFliCkvLhqKezRGA0NMdfOEJ9MWnt55QKu07MH6KGQydHQjWBP5JpHusbCcuucZ8HtUKpksJK/Jx639Yzb2YARQBod9gFHg/cOndtFB5eBFqmCE/pZjSCQ/wNTVf4ecLlRwA9z7C+Elyi71ws=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:10:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:10:00 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 07/10] tools/testing/selftests: add MREMAP_RELOCATE_ANON merge test cases
Date: Tue, 22 Apr 2025 09:09:26 +0100
Message-ID: <fe0c198c7380db183955abdafcb0105893e402ec.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0149.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 04af1d26-60b4-41a7-a915-08dd8175143a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?civrkv5wfw3vkPEp6tv4rXKLZYHZrTMhFHg+m+FEQnmiFaSDWaTGWe6UKUTc?=
 =?us-ascii?Q?TmiYWaLqVRABF5J4xj5RUhpY50dn9juz2XXeDcpTAjRqyT0PDL95GV4RsaxM?=
 =?us-ascii?Q?WcdlnLbgIZN53QVdUig0inKeWw4+1HKGdBmXIYWGEYBiYn5GNKFbJwbDsVuQ?=
 =?us-ascii?Q?m3PEYDIm8rDqm7xKG6EZu+pXamNH8/gGiR35g8lzm2/DQ14Tvp8pJutiCfZi?=
 =?us-ascii?Q?k3etdiXZ85dm72gFh4uad2LRk0vpAc3GIj2LKM4fIfFtbPAUU+ShjeFMR8wM?=
 =?us-ascii?Q?3sxZ6pQgZxoMY5Lu5S4MeSM/1pXYHilkHE1EXk4dqa+R3lFvKRkTsI/FOaKj?=
 =?us-ascii?Q?krJNcBjr1G1xWC1phP48SNWfZC9VDZYpXIWtCIWrzG0lWAPu9ds8L0HEy1aW?=
 =?us-ascii?Q?KPbybkiN50LWiGNdRiNRHNO+CKOAzIJol3emruxT2MTJ5yDRGuD/YzjE1jOM?=
 =?us-ascii?Q?QMBzfO1WyyYMV5ovts+WkmanhbxPcW+Q1laQhKr+LOOE4KpA3Mnawg5ZJwD0?=
 =?us-ascii?Q?n+CCI99UMqRxwFXArPF0ZLe6RmGn6HiPRSORqKpkOhSLqx2diCTYSxM2aVNQ?=
 =?us-ascii?Q?C+dl/XS9voLogW20nyH8vBVG1mEjp76zrKl3/3EMLcKjmWoIO7XxwAELeHse?=
 =?us-ascii?Q?rm4YkVgx/6/+2ScRO75l1d4ja/uVjrQt+zxpCRWcN6Hl7I6I6nfCgHcoi6Qo?=
 =?us-ascii?Q?4xKF+mi0zmRF9QPg+GAhAX4OvKLMNa2rbdlrKVuEEEtscxoWx5kyeUyjLt86?=
 =?us-ascii?Q?pa1fYnIN2/ImsHhMWOuDgir/dnTJ6S5fDq82ebeaSD0LOA/S2w2i6v7kg2qt?=
 =?us-ascii?Q?KT38zWTeFQQID6YltHyCI+ArgUdsi0J1CNmZC21ctDqJ2ipDgvYu9k2w6x6a?=
 =?us-ascii?Q?uCXox/zR5t9Mh6KDnQiG/iFUmt7gZG6s6EfQ2W+thqztWEQ56HFX5G3HfFaB?=
 =?us-ascii?Q?FbzgAQnKT0hd9Mdea/KXYVptKMR0W8BUudlE35V1+fa+lsb4USc/9RwL665w?=
 =?us-ascii?Q?dZ8fs+rMLts4g9eV2fOUrkMmbC9VIAf5SoJpVUf1Rymi23XqYXPY7lLdtcnX?=
 =?us-ascii?Q?r+9J7vAEnVSnwVvalQaXUMU82PnnhYyh+/oMUb4fENL1lVTX51MUvHUt48LR?=
 =?us-ascii?Q?XfSa3a2iLUE/zETqwKyxHBaAYGI0nEi9LTu1x+nFEy32KJwymKPMbLxdtjJX?=
 =?us-ascii?Q?1GXyQMNsBUXCPkboVK5dBo7gQgWxXuDdOgwXGhcf7wroFwSj5J9mDYzNB1uq?=
 =?us-ascii?Q?oPm7tbhbLiGHYypauVPkMOLzoTvrfGryvovSL2yJeIJGZTuXIz2hRGxOnufk?=
 =?us-ascii?Q?kEP/TDt9hfdnP9LBFZUk4oKo3JkEUsBX6Fjye450nyV4s6tcusJhC4UDikJG?=
 =?us-ascii?Q?YQl3IMxTnrM1B5n/TzjuMQ1iwezSZExCNM/ljhrLRkplszS2utTHDQODpz3a?=
 =?us-ascii?Q?1t3Qm+nDrV0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oub2tRdoDXDKqTzS33pKQ815QiCnapib0ytxZpRQ552QM2TrCc7XYlJB+xod?=
 =?us-ascii?Q?cpY47+PM1QW8/rhXAMKL9/3gpDLBsaIe5Y/bXS3OI2gRK6WvTeKQa9+mLqYW?=
 =?us-ascii?Q?Q6fiCAhJFC9USrZK5VvY7YKJjYJUp8/cTGz9e7jAMzApl78V8TMEELVJjepM?=
 =?us-ascii?Q?YoaFOFe2ZBY+3ExT5xXLqgbMCNg96omkRRXdKkrvKd4y1J88AKFCGNctE2qe?=
 =?us-ascii?Q?/4W69oDgEE8Z75icHzV3rtEGRNzIrlPoh0BeC8uElCDylNVd9s9wQ8oD3zhW?=
 =?us-ascii?Q?PMjx5j1Df6u3MNDFFVMVm+JBn/1QzOqpi6vhbN6k+Y5WwUnFLlpb8UG54UIT?=
 =?us-ascii?Q?oMbeXCpmdVhwqKR5YGJuO5YeuiN1egvcofAJwgtMyPWXxMgf6m3ypzEx3Col?=
 =?us-ascii?Q?6n1gLAuY83Bab3lS3/AAYgClI5Ru34hdQfnS9cjzBxoFDK9Nq11BJYvsfHUz?=
 =?us-ascii?Q?fgMTl7v2654jvfmUNcGY4NTDrja1yhEmcKCw6DKDtsx/mvQ41Uaio7bWrxit?=
 =?us-ascii?Q?0ZbqRdowDwhZYfJyN0mBivvEPmF5Y36Ib+YyE9mMnnHu3V2ySXKiymXMPfo6?=
 =?us-ascii?Q?sBEBWOQ4BtAToit1vIkoJyGAAdVJSokInlkPaYthfJaqwWReBaoFh494Qn2L?=
 =?us-ascii?Q?TWEaQjGzDU6vRXebS0a2gxa30e9Z7M1cvNr5Hr+9fiHYS7/7sSl8Gb5JTQWW?=
 =?us-ascii?Q?Q7L/hRWnQeLUa1JwNU73631V+ayunOwZZQj2FXlEtlllBwHZwtHn/ssCY5GK?=
 =?us-ascii?Q?lD1dsqBd1fGfLUxIlfp93snTlR7oB721mCvgQTlwWCeFy24CVoR6rw+8TyDz?=
 =?us-ascii?Q?u8ZfuaGQgAKxMnb2O7jNvYrmCTifQXy64jUvbHYJF/SYlzlbME7KmDOKDd08?=
 =?us-ascii?Q?QWEkCIf3jywuIb5PE4+2mBTkAIJ6HkiJKd/tTgtKsF3hBQHG7Z3jawdSyQmN?=
 =?us-ascii?Q?iHKBUwef1uQXzyspLMvrDIZvHDLkranEETOfi2UmuYABeJK3tgkqMWuSbmMh?=
 =?us-ascii?Q?m4sYAR+5OBlKq+KP32HYolStyTMyBszC/k7pyF8WUF8uajhLaFljMhUHqjbj?=
 =?us-ascii?Q?Ng6ApAVlZAB861JwA0aHf4vqnXiV9rYxoHzCc+DPSUEC5qKX7bG3as2kXCY2?=
 =?us-ascii?Q?laCl1krlbG/RibN2TnLp622BLfnkggJsc9Tjz6OFWWxY4Rffyyc00ccHfqbR?=
 =?us-ascii?Q?13ZhPimnbFArze2Y2RyN+5g0P4iSapeoke1NktCxytTSeM/yCppGcBbQW/og?=
 =?us-ascii?Q?6DsQV3mIKqFsnnXDM4ln4EDRjUKVIC6HpYml4zUNKD2LSQqOXvE0A4QMqqDS?=
 =?us-ascii?Q?ZqAjc60gBsZQmCW7v+lVhMJEjVEyvIDE3Xn4E5wiHOusVRCZuJK5vKQZh296?=
 =?us-ascii?Q?7mOlrL90aK7sQ+RcGovkL52tqUq4Nq/wDM/Ue9Kaai+GFJQxAPQ/C6MEZiAF?=
 =?us-ascii?Q?Bed6GQk/E8Lbl823e9N6T1WW/cLunWpdmFZlIpEblQFkfVi3P913LdGp7KAs?=
 =?us-ascii?Q?51tdSc7vtKWLgEPZxjrX7jPfFWqQ/dvchIhyMQdA2YYCzXqLai0/Ry9VfRdX?=
 =?us-ascii?Q?+xmHv5GjkluIs3kGvv9TzPLZQ2FvscXDy/upX4G77qk3GkwwL0fFBgb9O0dT?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bk033KJmJRZ8sZ1vbCKUrZmWTlUrbmtIIILX5jY0zrOZF9yVWGicVAKfh1LZFVIjtuGbO3qaICXbziDNgjr45dsS/mxJyinaxATUm8I5eX14xXF1PAuuYv23qk0iCsUCdxxWyQzWP3Xb4NDyD7sXzeuod54VZx+w6RqV2K7LO1of+aXnKDvmxBtlYZUy+sk3nE3GXXkJ4VcyASNoB3SM63LxLzagRcGp+b+o2phOJqTFC6WTQbINVWzYVvhBkilz4vNygsY/bX74wmufnJgkuQx2fylhZPtZOoyhhM4xfbLdBjvrMTueGJuk3edBRsAFjuhiD5WTihSWYolk4etfgXM0+Ju7oSt17lzBqg3aDkOe6jGphkV09YmbBlugCnS1yBUzlm6lTNDg8yj5vgZJX0PpX2iF7osADq29eqL1KbvEyGkrFjjpOj2OImuIOF2gz5NjnNTKvPBgAfx/2nQ+Zqo0i98pDhgGNyXiDC3brbZ+x71iK1cFhbXABO1oXn24vasZ3FGWQtSll9QunFuLIgeXjzOqXhF6mhros0FyA+LmnSOvLyqG3r3op5q4BYCL8xEhCI8FdRJkDVsQCve5xgCnGpON34W2Mx8lyK6K2Zo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04af1d26-60b4-41a7-a915-08dd8175143a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:10:00.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oQEPzggU/v5H5QJ4N+LdDBaCVPlKkF+ivu96YgVuIFP/GEx1yz6Kfe+uPfuP28t9rCCrmUqTZwfpaRTBR3XOQhLyO90wfZrBuhez5X75Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-GUID: LhnpZN3W42X0vbKSpkvfq-_AXyPs4aVv
X-Proofpoint-ORIG-GUID: LhnpZN3W42X0vbKSpkvfq-_AXyPs4aVv

Add test cases to the mm self test asserting that the merge cases which the
newly introduced MREMAP[_MUST]_RELOCATE_ANON results in merges occurring as
expected, which otherwise without it would not succeed.

This extends the newly introduced VMA merge self tests for these cases and
exhaustively attempts each merge case, asserting expected behaviour.

We use the MREMAP_MUST_RELOCATE_ANON variant to ensure that, should the
anon relocate fail, we observe an error, as quietly demoting the move to
non-relocate anon would cause unusual test failures.

We carefully document each case to make clear what we are testing.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/merge.c | 730 +++++++++++++++++++++++++++++
 1 file changed, 730 insertions(+)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 746eacd0fe70..8d70c24b4303 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -1047,4 +1047,734 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
 }
 
+TEST_F(merge, mremap_relocate_anon_faulted_after_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 after ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * | unfaulted |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_before_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 before ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * | unfaulted |  faulted  | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_after_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr and ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 after ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_before_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr, ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 before ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_faulted_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           | unfaulted |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_unfaulted_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr2, ptr3:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * | unfaulted |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2, ptr3:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge, but only the latter two VMAs:
+	 *
+	 * |-----------|-----------------------|
+	 * |  faulted  |        faulted        |
+	 * |-----------|-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_correctly_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Unmap middle:
+	 *
+	 * |-----------|           |-----------|
+	 * |  faulted  |           |  faulted  |
+	 * |-----------|           |-----------|
+	 *
+	 * Now the faulted areas are compatible with each other (anon_vma the
+	 * same, vma->vm_pgoff equal to virtual page offset).
+	 */
+	ASSERT_EQ(munmap(&ptr[5 * page_size], 5 * page_size), 0);
+
+	/*
+	 * Map a new area, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2 = mmap(&carveout[20 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault it in:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Finally, move ptr2 into place, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_mprotect_faulted_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2, mprotect() ptr2 read-only:
+	 *
+	 *      RW              RO
+	 * |-----------|  |-----------|
+	 * |  faulted  |  |  faulted  |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+	ASSERT_EQ(mprotect(ptr2, 5 * page_size, PROT_READ), 0);
+
+	/*
+	 * Move ptr2 next to ptr:
+	 *
+	 *      RW          RO
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr        ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* No merge should happen. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 5 * page_size);
+
+	/*
+	 * Now mremap ptr2 RW:
+	 *
+	 *      RW          RW
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr        ptr2
+	 *
+	 * This should result in a merge:
+	 *
+	 *            RW
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 *            ptr
+	 */
+	ASSERT_EQ(mprotect(ptr2, 5 * page_size, PROT_READ | PROT_WRITE), 0);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0

