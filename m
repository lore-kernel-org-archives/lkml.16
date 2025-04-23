Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749E20D4F8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419347; cv=fail; b=Wqhtuio3uyDUhr2ULlDb22cUb1nUbovBW0recONZV+n7HX89qYpt0q971knkeRXO/ocN9sG3BHAhdtPT8QaPyDf4IOY7Kra/IUK2DBymv9Sn6ebaUW8+6juzNhUw59/pLWntBb7ZicDBBrWxAuPFfr2uKnKfZy4a2L09Ewjb2qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419347; c=relaxed/simple;
	bh=xZmtnodpR2gP5EQDNUiQbhBZV/edd0XURtp4RibLKVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BRIIvtt6j1TAJ5OTG4fpzNsePSytD4xwjyZ2R+c+7HxedPBB9/+6FMUxULju+6uejXMxJV0OZLUqgskXAhYH2TBgzfZBEVCTezL5+yirWZHmnC+C+wlqzcI8A237fM9hX2pHd/6PfypJckOr5qln6Zr75HGtHlNdcV//o6hWpCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UgxAwuxU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ryjzMXsd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UgxAwuxU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ryjzMXsd"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N8flBe021623;
	Wed, 23 Apr 2025 14:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UpDUf0s2IshsRhC+pH
	TMfENN6vcElwdWW7PJFmjyBQY=; b=UgxAwuxUDS7K+8fMVZMYMGiERrVYg10sTs
	o6cUMrB4OPcCdnxgH++RpJLgsAWWGkDG0i6ASyQOD+4psZKKIm/pGVBmIW7o+21z
	fhPMnoq6QWI+L4/yAgGyzGGzGtio+adCtD0L+tNqgldIfvglE4X+n8Kna9HeVSm0
	My3nhsT4bSZm2ISX05yZJ6MqnS4y4+luPhi5xAqJdRxz3kJ6nLMIAuYpTVquqpAg
	UDv7xlEU52YWJKwu5t64+/EOh9BY2gws7yc8hG3rURudtJ2qciKrI8oxgjGcULnk
	t+vf5cURVACAOLw5IufvK4vkvcWoKFmZh5YmLZOGnLmOnaQ1oQWw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jhdhe6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 14:41:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53NDOqwx030936;
	Wed, 23 Apr 2025 14:41:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466k05xr9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 14:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVyjHoOiDZowQSk+ix9/OeFIfypp01vluug5gYdLDEG+MhHaVW9bRdkAPFH3A8/gcOagvKqTkFdt4c3CK9tBa3w4KiTX75FhNP+G0mH/IWmRm1xxJ4GP8w1atmCWwMyh1iEGIxBJQPcO8WUOjPzcsgWM+mGUZJaZVxogdax+AK6adht68r7AQIZZpRPBGpBAPvJDXQsvt3PON3pXCJVOxGCQoyTlm9GZ2xduYPXm9LqXNCYcZTRMSG+nTZr2rIyY/4aZyrOWNG/7uUVZj+JYCQ8T6OWpOp0iX9UiTJrD8DNtidvtFjIBn3a3ubQeBzb8D375z9ZJr/zoBN8BVJrnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpDUf0s2IshsRhC+pHTMfENN6vcElwdWW7PJFmjyBQY=;
 b=sA7iIMpLvg2I89pIL8y5vBXeqgOg9jgfHRhn56AMuSRxDMtl/PoHmxSG3L9cYQ7bvw7lzKjLuAd5nU0O8ITM02AJH3k1ZGVvpXviCaF7y5WE1GNKG70QJzV5XFLGXHmuDcY5Z28Ky2xVDjVskeKxFnvHBccGrypw8c19aMt9hvJW5ZL8eIu+WXx3NOP/EgyyZtscQEKP5AoIjrHXtWmQ19HKqUthyzea5LVLzdqLV9N4V5BCzO7iGHlV4qMZ2DMurxOQ9XWVzG0cmUzwYYcw3IGerSUdloqSvM9y+B+NDyHBK+ngL9COOG++C11suYTzmvlbcnalUBoM/2uG+j8vLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpDUf0s2IshsRhC+pHTMfENN6vcElwdWW7PJFmjyBQY=;
 b=ryjzMXsdxyp6izzRGjK9zeENprnE4hJJxJj+j3rPGUhoquyHjuS+PLkaIQ7aZzJSECiBp6CDTxU/c+bNasXn1l1DoR+5PoD9WOdFyuTQjJC5OqC7O+3UHmZzK5yf3ox/rSmbKnVM+bRav6XzQRlWNtVlzD2+bD4CEfArY5dpvoY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8066.namprd10.prod.outlook.com (2603:10b6:208:50b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 14:41:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 14:41:30 +0000
Date: Wed, 23 Apr 2025 15:41:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
Message-ID: <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
References: <20250422144942.2871395-1-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422144942.2871395-1-david@redhat.com>
X-ClientProxiedBy: LO2P265CA0313.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 525b5bcc-9907-47c5-5977-08dd8274ef48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kkykYqzgIip8gk8/GFUJcv1IppSrBYYXwhUjSTnLX/Kwqso+iv5ryb5DlM7G?=
 =?us-ascii?Q?EUFDSosDpUk3EmKt/u/uGMJSc7wd3RW3JgYar70NwLWTAs4mjn+/8BxkfEzn?=
 =?us-ascii?Q?pctf8PjYYyO92PFqn27Nn5TkuKZCpTNNgDZWvv/hsCtpxuuseo0QCKy0nKSq?=
 =?us-ascii?Q?/gLh8xZgi8nUF4nyPrncjL87lTpIoUbHuulKktyl3ajv2RXJLo3h9VT95qTV?=
 =?us-ascii?Q?sA9HuxEm5iWgx3tx4C8zsEZnv2fuwaJmCOZO46PZ9JW89oochs/uAL0Y3ucx?=
 =?us-ascii?Q?4PBNcVRxtBRiVFQBRU0UycOrf8/31ZVCYarNEDxg+5xwfFHTWjXolsC4N2MQ?=
 =?us-ascii?Q?kyk1Xr0ZK+veWoWdqk3jSl2ACg3gs7h5Sww62Tw1i1JTJuL/yUAb5QN9UqS1?=
 =?us-ascii?Q?p6RytBiMJoZ8tsYK9zo+c3mn3XvnT32hbLk7LcDMQI881CdRJkvXCO3UYfQI?=
 =?us-ascii?Q?2N6nFg7XP85xAkKf3GcZmSyVh3J334Qrw/7BOpiG6SJz9izYOKqICDQjJE9l?=
 =?us-ascii?Q?zf8dl5XRRRRIqjCVEctj45QPVDlkpPngt4oLvXauSuICw2mv3GTN7lCa70jG?=
 =?us-ascii?Q?AWU3+qPJAnVuP3iiUuYhTEh5LvvhaBfybItVSftJmN2lGxZ0XGJi8AClYUaH?=
 =?us-ascii?Q?hKwp0THr8sp2dXoopjvwwlti9TV1M8vNr18S57mapFt8+5NMgNWwPfvgqnGf?=
 =?us-ascii?Q?rQ1UZR4iaF7a/DVS8ILOZK1KCBnrJdznJKRUIZj45KckbY4ZbGjGOn60Gd82?=
 =?us-ascii?Q?m47t470ubUz6PfYoSkWafepp93hwLMWXOuLFE29UpDuH16NU/pk9mxFxaQul?=
 =?us-ascii?Q?C16AgNZYfdMeI1gXmj1PyqdXPUZpC9+AeBQz4GnqCQMRE0zY2fymY5NyM5/y?=
 =?us-ascii?Q?v2aSIFQekA60c7o1fk9VL0v15sQ1jVxZBqhsthHYGDJ6CU68baJBBhi8c5jJ?=
 =?us-ascii?Q?X7l/5XBOkiSyqWENH2zmSMEl3wG/6JoWrMk2fZqIHppSE+QB1rRaC6gsYPmb?=
 =?us-ascii?Q?3JWbyUlq0si89aQJ+bWbdFi8QfzpQGKqbwJbzucr10xxkdbIWqpM/wYqXLRI?=
 =?us-ascii?Q?3Eca2HswBGeoriZTsmMEmhn5eTP3FbZY+H65gTzyQwKjFt9zeOagj5gtkUZU?=
 =?us-ascii?Q?gbCdm1yZHxXbmxS3GzJYRJQ7r/kT2cYkdByOJ18Sb7lKSadozM4p7TcRvOsh?=
 =?us-ascii?Q?N6/buNagqlAs+YsQckZQxNs8GUktWtAyszCgqJvDkcCqNuNcyj6ErBvNoIPh?=
 =?us-ascii?Q?VY5zaH22hAat5MRfDqjFHyAnuISTAzpDgqV58wcCUmB0PKVRIPmNUv5G453M?=
 =?us-ascii?Q?ESPgMgDFS9rPVmgu3ZlvUZ/ZersHdZmybK4AIFIzirzQT5v8rIvLFqneGO2A?=
 =?us-ascii?Q?ScwyNcbSpX61XmMhQTtmBx/zF+/8zYyPgS4n7rnOyOKhrninKFCw+s/hLDKF?=
 =?us-ascii?Q?hyW/Roni57g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LAx0whkIX63CyDBISjYp0vBVNWZNYZXpzQ6X1kgN9h8mits1oXrkbr+5m/gU?=
 =?us-ascii?Q?Hd5DgHuhMeRFZ9UJuKjoQ7KYPePgGiyxwm7cgkaba+Snj4Zq4DRWJE/gQCto?=
 =?us-ascii?Q?yDaIjs1+6xLGTa1mG+3Pwfq0MRGCx5XOZAr1C4hwIswPhlOm2OTWJywU7lFC?=
 =?us-ascii?Q?kjhy4tK6Ep2WXp9JcjIGbxKSFcQRkV4L67nKBjqOpWFgU16yE6kQtQqFS6EK?=
 =?us-ascii?Q?jjXHIymYGqWn7ipV/ZClFm8ucpKNqF/ZHQmtENkxWy7WlelOCL23GVJgSZ4V?=
 =?us-ascii?Q?4pdiv+KG/+T6zJZjTpuDGGUv+di1IBhG1wCfk7whMPj1yOsFhjh69RYHmnRS?=
 =?us-ascii?Q?ZVTW8CmfOzBCwg1ntMRn5Ptt9fLrBiI+M8oDHMgM2rzIKFyskoh3FiNA4n4T?=
 =?us-ascii?Q?EI5FbIgZpj85k3PqvTXYFMqdojLu0mcMyCs1fDGg/U3NA6ECBQ54x46uCKGz?=
 =?us-ascii?Q?MRhyXH49pIOITYmwJkob1d4mgfwD6vRVlw/88wpl1OZakUK9HNlX8gSYUZYu?=
 =?us-ascii?Q?DNQGsbPVJ2qRI6MhmzOBcOIYLAoS7BhVtahIF9g2CpjdySQVvNDpkrfvDNHQ?=
 =?us-ascii?Q?ET0pB8y35Ns520PgcOVj5G3+llDPkGy/0PSzojud9dXtxDVTo+ZpUNxOMhVb?=
 =?us-ascii?Q?IwcSZvECyGgtEFu9MrQPPDYa1v9CpG/k6VCF84PnupSRsPtzfLA/ltT35Jr4?=
 =?us-ascii?Q?vk3BThbQUjcDPIWdqugeSeYEM3HmNNUEXAzIEZJlXJLkuVSgRwVAsYV5HaCA?=
 =?us-ascii?Q?ruIjSzcS8xzWOF2RGPb2b8vx7voy4gcAs9xxadFUSZPtAkiZeWtUsg+1CEpD?=
 =?us-ascii?Q?4t77RXegfo6fjOJUlwvbdezNSuHxSXU13MzKjNJ+bUVtGIWN9OqQbCrmKLmf?=
 =?us-ascii?Q?KQf1BOjeHIVJzx4J3wu6nGHYPr+/DYCKWqSGzXK7u4YSwSWEsLXXDM61tXBU?=
 =?us-ascii?Q?1z9zFaAk4D4F3sCXQhwtLOdQr+F/zyglve91nmyFZwDFK73YA5/3WciwF1ny?=
 =?us-ascii?Q?zOAr0jn3riYPxWO8CFQ0C5/eUhupJSeHX6yJiPpGk6/qg9Ctjuu4Kc9g446l?=
 =?us-ascii?Q?5eclOBiEYH2Nlm9NKDmwPw1rc1w+16sOFRl99ACpTKQQsfcGbV5YhCIwSTa9?=
 =?us-ascii?Q?AbjvQsUFmBuElGDs6c2EJNpYtrLb9NE/BM+X7SDepWY65yb5RbxY2K5ua0z/?=
 =?us-ascii?Q?vtc9hzeMVt3B2ZAiy0etufWg5HPrJsKUXOHI4WNuilt993CWNrokfJKCYMlg?=
 =?us-ascii?Q?M8JtDYUXIn9croRID3+puBhZ50A8hvClyMppfVTFlu+L4+YzgNpze/K9KgF3?=
 =?us-ascii?Q?5f07VObRJWBmI3NlcvH15A3eEJgdNVjqVS2nyTLLedPS38y+fnr4E7cEKgLl?=
 =?us-ascii?Q?OYaTz16JcmLj7n77D7S3YvqKouoZitmxdO5VycCK/7GNsAQ4YRctxZQU/W1H?=
 =?us-ascii?Q?SCD7wpLQNu3maxKIP3KKW02LRQVIV+0wKRAMbEjyOm7FiCWaT1nSfqsYH9Dy?=
 =?us-ascii?Q?jRdm9ovfIdpBzCHBC8RPht+iwAIR86S84HHhdjOOegAfrLO4dWiHmYMLCHex?=
 =?us-ascii?Q?oWlFKoY7ueI156H4ugqtt9qbuatYghyW9mqOXckfZSHglry2PTvoO25qwNNd?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IMGzHvbtm9KoNeFqw5Ne4Pi6jVG3GDLtVCUwcM7mbbWi0uxnKxICUwwvmwv1UfECXDKeXMklvqaLXaOJ5LOmbtwWN0ZMGt7v4OD/7lwHhOLfDX6aklhfT5BA0iJSuluxTA03wzI+XcZoDiiBPFl/BtWcp4O2yR72ApHkaiHYUw9tNO8rHC7dXkQrFdoTC3oK4YTFm8EtvHsc4irkRVeb6GDuaT8fRNfskjnwwSk0Mujdu1Vg7zKOGgovFOz3vUjNyoqV1JQCcC+QVbtxTbAgIt1H42djOVO56/8MKbffvSb4lkjHz+eXNnITJsJROzsz/1EQoijKb78o1VQQYlPnqEne8CaoCszv2AEm4JA4Q/f6VOUTobX0eGTZ+Kq63e+Dj0/WJpG6hK6aDV7rVlYGkaL4ZW4+6Xb7T/xavTDBexW3edKEwzRcwIEfasu6qBXpIbH5Ih/xLa9d6FuilVKxDUlg9Bibj7CJPOojD1xXhWTxmWNp6ERDwmrvgV3XbKILDzngCIMDjwOBQM2rU1r0NcPtHxhItaZgNIDjVgtL3ALBopE3gBL3VkSit0aqupQ+Uy+v7zWWobQwaQAq87FS+PcqiczzELxzEUFF6hnhvyc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525b5bcc-9907-47c5-5977-08dd8274ef48
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:41:29.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thoCVipoG9ju2Wb7UKIsYoysSLxqDvOZOf8kTB+jllByn4qA5B63yR+cBYKEtqQvWVms1FS6E0+otvNrut7gfzI9ALxd3fbHmQmra02o4pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8066
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504230103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwMyBTYWx0ZWRfX5CVPVZV759GS ojle0DZmlpJ122lBo8kUP4lD+VF+rVRGdcjgfmXvJB6jqflv0gab1eSJNKRTW9upzf6iCejkc4Z 12Nk/V5ddSKPZXmXI0JWcUTl7lruTBLaoGjVkAGeC+7uIaefvLdB2B+7G+6AKJCK4rNn5UCrDeK
 3jqe0Q2RCGPPP/O+O4vmYpxhfFKEF1A4F7KhYYq6a0s61sccUvoPDDDaqg3CWQ5ygZ90eLOhgsu 0T4jqfrPcBrXJkS8hxmrzed6ucI1s7kUlTQol3qeWdmTgvW/LtDnDx1PsTBQrLL+rtnQxy4ohR2 e42DeR1l+6+zr5nHt72M9FneBAVeT9ek4Ak/kuPPzCjTqaEyPErKJ+preJjae+8AwJ1gUh+YVRJ SnYV6geo
X-Proofpoint-ORIG-GUID: Xav4qONPywaSlE5haBA8qenhw2nNSfkS
X-Proofpoint-GUID: Xav4qONPywaSlE5haBA8qenhw2nNSfkS

+cc Liam for the vma things, and because he adores PAT stuff ;)

On Tue, Apr 22, 2025 at 04:49:42PM +0200, David Hildenbrand wrote:
> Not intuitive, but vm_area_dup() located in kernel/fork.c is not only
> used for duplicating VMAs during fork(), but also for duplicating VMAs
> when splitting VMAs or when mremap()'ing them.

Ugh this sucks, I really want to move a bunch of this stuff out of the fork
code. we have some really nasty overlap there.

This definitely needs to be separate out. Perhaps I can take a look at
that...

>
> VM_PFNMAP mappings can at least get ordinarily mremap()'ed (no change in
> size) and apparently also shrunk during mremap(), which implies
> duplicating the VMA in __split_vma() first.

Yes, it appears we only disallow VM_PFNMAP on a remap if it is MREMAP_FIXED
(implies MREMAP_MAYMOVE) to a new specific address _and_ we _increase_ the
size of the VMA.

(as determined by vrm_implies_new_addr(), with resize_is_valid() explicitly
disallowing MREMAP_DONTUNMAP).

Makes sense as VM_PFNMAP implies we map non-vm_normal_folio() stuff, which
can't be faulted in, and thus we can't have unfaulted backing for it, but
we can shrink safely.

>
> In case of ordinary mremap() (no change in size), we first duplicate the
> VMA in copy_vma_and_data()->copy_vma() to then call untrack_pfn_clear() on
> the old VMA: we effectively move the VM_PAT reservation. So the
> untrack_pfn_clear() call on the new VMA duplicating is wrong in that
> context.
>

OK so we do:

copy_vma_and_data()
-> copy_vma()
-> vm_area_dup()
-> untrack_pfn_clear(new vma)

And:

copy_vma_and_data()
-> untrack_pfn_clear(old vma)

So we end up with... neither tracked. Fun.

Agreed this is incorrect.

> Splitting of VMAs seems problematic, because we don't duplicate/adjust the
> reservation when splitting the VMA. Instead, in memtype_erase() -- called
> during zapping/munmap -- we shrink a reservation in case only the end
> address matches: Assume we split a VMA into A and B, both would share a
> reservation until B is unmapped.

Glorious. I really oppose us making radical changes to splitting logic to
suit this one x86-specific feature.

Seems to me the change should be within PAT...

>
> So when unmapping B, the reservation would be updated to cover only A. When
> unmapping A, we would properly remove the now-shrunk reservation. That
> scenario describes the mremap() shrinking (old_size > new_size), where
> we split + unmap B, and the untrack_pfn_clear() on the new VMA when
> is wrong.
>
> What if we manage to split a VM_PFNMAP VMA into A and B and unmap A
> first? It would be broken because we would never free the reservation.
> Likely, there are ways to trigger such a VMA split outside of mremap().

This must have been a problem that already existed, and this is really
quite plausible in reality, which makes me wonder, again, how much PAT is
actually used in the wild.

I may be mistaken of course (happy to be corrected) and it's used very
heavily and somehow this scenario doesn't occur.

We should definitely add a test for this anyway :) even if 'skip' for now
while we figure out how to fix it (_without egregiously impacting split
code_).

This can't happen in mremap() in any case as we are unmapping which happens
to split then always remove the latter VMA.

OK so to get back into the split logic, this is:

shrink_vma() (in mm/mremap.c)
-> do_vmi_munmap()
-> do_vmi_align_munmap()
-> vms_gather_munmap_vmas()
-> __split_vma()
(later called from do_vmi_align_munmap())
-> vms_complete_munmap_vmas()
-> vms_clear_ptes()
-> unmap_vmas()
-> unmap_single_vma()
-> untrack_pfn()
-> free_pfn_range()
-> memtype_free()
-> memtype_erase()

As simple as that! ;)

Makes sense.

>
> Affecting other VMA duplication was not intended, vm_area_dup() being
> used outside of kernel/fork.c was an oversight. So let's fix that for;
> how to handle VMA splits better should be investigated separately.

To reiterate, I think this should be handled within PAT itself, rather than
result in changes to VMA code, unless it results in us adding sensible
hooks there.

>
> This was found by code inspection only, while staring at yet another
> VM_PAT problem.

My sympathies...

>
> Fixes: dc84bc2aba85 ("x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()")
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Anyway, having gone through your excellent descriptions (albeit, feeling
the same pain as you did :P), and looking at the logic, I agree this patch
is correct, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>
> This VM_PAT code really wants me to scream at my computer. So far it didn't
> succeed, but I am close. Well, at least now I understand how it interacts
> with VMA splitting ...

Well, I'm also quite scared of it, and indeed also relate ;) How heavily
used is PAT? We do seem to constantly run into problems with getting it to
behave itself wrt VMA code.

We recently had to remove some quite egregious hooks in VMA code which was
a pain, is there a better way of doing this?

I really do hate this 'randomly call a function in various spots and do
something specific for feature X' pattern that we use for hugetlb, uffd,
this, and other stuff.

We need to use (carefully constrained!) generic hooks for this kind of
thing.

At least tell me the mremap() refactor I did made this less horrible? ;)

>
> ---
>  kernel/fork.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index c4b26cd8998b8..168681fc4b25a 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -498,10 +498,6 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	vma_numab_state_init(new);
>  	dup_anon_vma_name(orig, new);
>
> -	/* track_pfn_copy() will later take care of copying internal state. */
> -	if (unlikely(new->vm_flags & VM_PFNMAP))
> -		untrack_pfn_clear(new);
> -
>  	return new;
>  }
>
> @@ -672,6 +668,11 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
>  		tmp = vm_area_dup(mpnt);
>  		if (!tmp)
>  			goto fail_nomem;
> +
> +		/* track_pfn_copy() will later take care of copying internal state. */
> +		if (unlikely(tmp->vm_flags & VM_PFNMAP))
> +			untrack_pfn_clear(tmp);
> +
>  		retval = vma_dup_policy(mpnt, tmp);
>  		if (retval)
>  			goto fail_nomem_policy;
> --
> 2.49.0
>
