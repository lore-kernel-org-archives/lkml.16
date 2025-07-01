Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E642AA9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357744; cv=fail; b=MtFQPgYJDKmhHLVAG/5R+qOLEuePEd+nDdeouWRpiHktgH3X4tnc2BbXb7ewhU6fL8jIFtS81m9OpjVBS8d0dKXgAYEcFpmnqW1BkElyJauYIAVKY+H/eNc20GpcXyyPLe97VvGxHbtj+cOw77VpruNuQHYNt8KnF20JVoRoXNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357744; c=relaxed/simple;
	bh=yqIcmdn0eHmqctg8v1YoAgxZ2CC4DoApahEjlCwuH54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JyCr7FERTSbxNpZUMKe8XD1YyHy8SE7fRtqM7lywwAzqRAgJWsMtiRMbh4OV7RkqVTzA23sS6gWqjdtqs04zqo3/9Lmaj9Ka0Kd9F/7OamTxY/1rBVzumJ42Zmew+AWTcKSjpFEbWn/65iHObvX5tbX33oGS3LHQCCQgCGePCEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OHepf6t5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SdMUH7fN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OHepf6t5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SdMUH7fN"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611Ms57005251;
	Tue, 1 Jul 2025 08:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QCFN4zFvG9W11XoYZQ
	4Ah1RtOovlJimCMAKy/L77FYI=; b=OHepf6t5iTvzfzN2wlvngtXTrngpufPFiJ
	11fLtZlebJ390eWB0swu4q3LdE7npCsPibwKg/5NCO/rtDShnJLtWEXhFLPi/tBK
	cJmY7GDTGKpZwQhZRmExBkmzhkOw0Z4nPPKhNdFsQDcHv/tB1J/jBQUWLmQIWN95
	2hM+qta7RL+1gpHBLbzDr9KQ3RwVTuarSHAM8X7rJz02wUWReNi70i87bp+juo72
	YpmwX66E0HXID9rGJmleBCfVcLy1bPxPYhfXbi/73ydy5hmxN+W77w9csVGEYkhW
	PjJVmDqpu0vT3RNuANHbWM5SRcQKZZKghBJOcIUrwE4WsUGjIASw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af465h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:15:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56177FnZ011517;
	Tue, 1 Jul 2025 08:15:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u96h3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:15:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGNtoAhxQ/1eJ8d/pkSYH8DhXMwmKqYHyMPphld4c+KzRXCM409e9o2F9y4UglurQb0ZPeKCe9S9a7qBIkrsuGTTVf3Wc6AHnUIF4zKulCKkULS+C+QTvwhESxt/Uhat7b9CWbueFc6ah10/w5Zn88g+M2W48izPrijeWLFzUFGUpMww2hcdf5zgUNIhZLugL7pf1XM8V9GjXeTxIqQudVod8nrT1kFyTODohO9OYdT9tAJ0j62+AnEJ+mNu2lFOGS06k7unf2aHgisMS6T7t/8TocLuYnxPtMC7/0KTgc+ydRUDzNgKHbsCyESVoGHe82kxq5UjplzBEtsM4rEfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCFN4zFvG9W11XoYZQ4Ah1RtOovlJimCMAKy/L77FYI=;
 b=qpkcqUg/EWkxjDIrCs+Y1aQ4xL/yk70kJYPDgGL2xBMST2jrx+Y17gWIuD6MOtZezb4d/3Q249ZkAbkIpAkssDW12qyx8Uar0UWOUedZCDmZV2M0U39Y+dv6eOo/cY3mdeHqe2BKLVHdy+fXiqWozP9uxuvidzOY2iOSI+5XfCmoF+57gIQj2gtjptXW3h88SATnCumLRuQ6fv+TaBSiWkaRV6VQ1iiiF6H0/1ZcUzNYv/vZm7oImg2RgvkKNwpvkQYZK5tDXEvdqPFUL8wCwRff4UIEBi7dPrtePtoZPAsq2JqsWEhoqkz+/6ghm1fyt1A4fUWfwjt6dbZ4mGtRiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCFN4zFvG9W11XoYZQ4Ah1RtOovlJimCMAKy/L77FYI=;
 b=SdMUH7fNgfqXwIBy/L5C5ukrhEvmKWwufVZLHcTizWm5ibG+h89te0Q/KzZpO2goHynEPST3sbdkk7gVLuXyo5e6YwZjXDXrNF1AHAKr3gDdhoSQH1FGnw4ov0NRf5wQwchvscaW6t0cc5clhm3T3H6N/HP5RXSASI6sMFaPOZA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB5992.namprd10.prod.outlook.com (2603:10b6:8:af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 08:15:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:15:05 +0000
Date: Tue, 1 Jul 2025 09:15:03 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Message-ID: <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
X-ClientProxiedBy: LO2P123CA0029.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::17)
 To DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e769d69-27e9-4a2b-923b-08ddb8776300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oF9to/mCamG4ELy2lLtGnt8USGoTeiF6pt+uLVz3RY0HhFsf7hz441vWqbnX?=
 =?us-ascii?Q?qoiY4NPmdnbDashJs1We+EXa4Yur67NkhgqkPAPX7+XJn4LUWBvKxmySBFCx?=
 =?us-ascii?Q?mPnXAi0/jBD887qSnwAxkASIFE+AWpk1H8/oWhZjQkZaEKV1L50KVFLqlxik?=
 =?us-ascii?Q?AeMp1Po5WkBWVJD91dq5HLi6g+WrQSqJkSefJdhmrkyvoh1WAwhpQwNR3lty?=
 =?us-ascii?Q?DW2qVOW+VfVTHgBsNVIEVL8f3eFVe2U+XrrjT+LKheWo2fTBGDZHE3NLKb3E?=
 =?us-ascii?Q?EEYAcxsLiFzJEY/CTJpu8czoe5g16gsjxYFQXAUjGhJa2ZPo4Lu9l7o57NM0?=
 =?us-ascii?Q?3txSUDzt43QJCewpOf7rhVJtsMtiqE7zSk/fCB9v3yj1EFnceUy/BS0sJ2Ta?=
 =?us-ascii?Q?YabJHtsVhv3UUGZs3uJeBFpj0xaVTo5bUFx+IS1Uwsl2XPRzygSsJ9pMjFKM?=
 =?us-ascii?Q?AhQOTaHVmLNb1FXAJSSPuh0pdyJeSArbeN1ISaRJ2rADIQO+d/PVkzZ3piTg?=
 =?us-ascii?Q?mXMb16CoZdRA2kAtTePQfQXt0xW7F0/1Ub2whBbfRwooku/sySPMkfeDTt/L?=
 =?us-ascii?Q?bIOTOK+/yRiG51sbFlF3OxR8GqB2JDEejlV8cNN/2NMH7+5fNJ09Wp8cFUt8?=
 =?us-ascii?Q?+lobze7plntL/+O7wMAZRyO5zHgzlxQgX8Ek6Tu09LH4DdcqBbw7u87HYkE2?=
 =?us-ascii?Q?SyVpD6FKM89btEsk1c2FRqJD9rSFqVruXhfurjKwN5FaTida2DvEObf7tgeC?=
 =?us-ascii?Q?tiKegA+TUYzk/IeLUizVjAM6zKKKIa6fgpL3Vi5dbYpWYdWjJeZXPXcU9ePu?=
 =?us-ascii?Q?yXHDbu33rT7aYJ408ibjRpZji2pykHlouXnfzo7vMTIIufBRkQAuv3vP4n3q?=
 =?us-ascii?Q?XsjtKSn8PE1NeTeJl4p97GXOoYPKVweMbe4u8067TOz+P6M468VVoYp9nxKG?=
 =?us-ascii?Q?FNCCRzhdGkyuMiC91LhjivQUSkSWn1p7EAKtTMrpYe4COAISdcnkLTt1zoGN?=
 =?us-ascii?Q?BDjz+I99kX1D6XKBrixbhCDeBn+3PsLetPDU1oUlOlffOuBZ8TUt5Gh4evpb?=
 =?us-ascii?Q?ma0r4ZTZUZyJtnj/6Iz9sGHAqxfu7xDsJ50tFi+7h+EHWHAGxCpLqC+h1Dyz?=
 =?us-ascii?Q?IHo3YPVzfmOfPCoyEK4NbMocD0TnrfQ6kPqhZ5S1rSH8vBPDXG+HxtLT3Zcb?=
 =?us-ascii?Q?xJHQxYJinhc+7FqmVnYEpoiRvlFXshc0F9uT0bVxQuk2YnkAo8bZYt7gzqTZ?=
 =?us-ascii?Q?unR7IQqR9ZMDfOI292whumTqbZu5KTPw4TziFAR1BuO4cPqNsl6QkZ2i5LhF?=
 =?us-ascii?Q?D+Cqq24QCrgn2zYMuzfRsz/dQiG0LmI0N8ClsI9tVTrQuBKTGzLBiAjPuziP?=
 =?us-ascii?Q?qP1OLmOEVOadNi2n+bL+PcNrJ1rRoMbByXewSOnFhXIU7CXlBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4qa07p7i48jqcrpMDrcdZgak3r71wLvJVfXnjQW7yKYj7rejdyRTCrDplmsd?=
 =?us-ascii?Q?R9GPPYfbpq7cmYxy5KhoepqsFEpaSclZ0D9Kkz97TlRljVJ/5GNRUQ9RAek2?=
 =?us-ascii?Q?TrkeotZDKsMMRR5rmDxzjLmdrMt6c04eAh679eiEktVQl6QmRteLZDnKvB2N?=
 =?us-ascii?Q?k6bpXcIvTJzjvN6JtxuGPAjMEg8JjcqyPXXAw4WFrnpHuTZj6v9/h/xndL8T?=
 =?us-ascii?Q?UC3he5N53cHjy2am1eJ9djrUHKanZsrOP6FsUF4bGTLHQbmg4CGvDws3px8f?=
 =?us-ascii?Q?INsJT52PPKfVNQVEzkdByYzUBrgWvo4RF9qPwUxlGEICTxYprSxwa+8P/b52?=
 =?us-ascii?Q?HtFbdaekRN2SJM02FhwILgnzbZ3O4gQ1Z63P9VXibkuKlyYK05xB7Ur77LpQ?=
 =?us-ascii?Q?s4JKbm2CbQIvQKDmuq53hCI4hRKV5G/mBHnOHZ0ocyR5wbjdyU8mF5Z15nKT?=
 =?us-ascii?Q?aPbly4cNvLgtHHIp2EJ1vJU+LWSnrqqnd5PdWF6i2Q5dkbd9oClKELGkqqD6?=
 =?us-ascii?Q?BpaJkkrkTCupUAWDIYI9i+16MUtG125K24bZAaqaHBogfG3Cdu6vDPqeWTUK?=
 =?us-ascii?Q?UkGBGR9hFphA+xp5lX6dLwkiyssEh8owJJtN8PQRdXdQ+1PsAxcbJDhr7PdQ?=
 =?us-ascii?Q?XXEKFNWyPtCJbAdO9OjurTwfDatOmHPJeRxLIzrGHEucA/wektzDhYJCoQdf?=
 =?us-ascii?Q?z2xpJaWAog+6muUv/nOqOUkxi1xMN3w7tHf/ufpqb6GUWrdw4FBS2xGyzSCn?=
 =?us-ascii?Q?a5quLMpFBlNcNySPUgCT5e57RFSEI7/+vBiGlMh2//mjeVYa8eZzkkHh74vy?=
 =?us-ascii?Q?MalVr2ZkBOrAlaP2Rfp+tYW2EaPC4MaGhQ0i7Vl0Lh9ATJ6QYaUdIkBcjfHf?=
 =?us-ascii?Q?W05qMaxJEfguOVaCd4ABcBi/L/UUw91dWmDWNUy9Q0G8nfQhBoQv+6Hpv++t?=
 =?us-ascii?Q?Oo1ydouYE3MKmLjaahCHPWeolR74v1Jo7/DXjTvl6x2r0mMOEIyvYloZqaGq?=
 =?us-ascii?Q?s17kS/dmEW7SA+jG3jeXBKDHdL561rmUl2zU2gG1nfIbca3GQUJJ35YOXsqd?=
 =?us-ascii?Q?HSnFFl2HVYrZC3ksP/tCkSFscEXtKDVoDFPVqT55DlAoXHLiqa/4lYVpULQp?=
 =?us-ascii?Q?3t/fuCWqBUCMv6iKJkFBG7xxuYEYgL6euya4ahCerKJsFUqC3AdJ4xyvrW2o?=
 =?us-ascii?Q?/SYbtCEgd51bCOQDwgGk33Gmuq3GaLp8uLgE81dyOFhfvwAynFenAE/2YR1s?=
 =?us-ascii?Q?iNCZp0heF/hem8tXHhSvSwofTYAGaTWkXukqtjfd2gJb9g7jbg+KVY4uP9bm?=
 =?us-ascii?Q?wFxJHnWynTND5TVULJAM4sTz+rsnhXxBt375tHseh19NqTJmWIGl2EdO6fu0?=
 =?us-ascii?Q?f+sE8ah+WlfvqbfXBAszYOV2DqkwLdoaVIL2pYheLfEVty9KGKka8jsMtpJJ?=
 =?us-ascii?Q?XDG2pC/l48DrtLMvJcK0kfy/Pm29ELQqukkl4jR8bwL9ItQGgSs5o8TSjWDw?=
 =?us-ascii?Q?sILieDftiPT1KPo6uhv6sF6UBhGroE8bLSnMvYHeXl9mcT/MiG6ls39IvP5S?=
 =?us-ascii?Q?Sz9NW9VY83Gjvf2wtPIMyxGQdJt+MjSNDOPpshCIid2cAgv/h5fbx9ecd7nU?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aBNX1u+wkU3AvJ3H0+p65QT+CjUMfIK4o2ptnWmJicv1fvrJrf/BEft3AGs3Nt70qUYrJT/J/qDuNuHb1SIEdeJEEFuRHlH0SXNJCTP8qTTKqGm1DvlldNkJcwiLqQcN0r9GeG+C5bWKE2OO96ac4DU1mdfLl6GcpH1CzX7vbPiJJlWReA4jzcR8WkfrWy9DtDNYoW9AwHKf8idxoKt+d+6dfxb4Y1HvktJXfabPTQhZH5opDUNR3+H3ijorNspFSN9s19ooPHNnduMvcOzguFw+04YmFmtaZAo+nS1z07HHXR5Vj+F3WNbGY9Mzu4beHVPDRSW/RoK5iOspRiTAYaBR/0Zg3mC4vl8PW/zo1X69d8DEOW5oAlB4iN6lxBUH8DlJOPi9bH9I4J0TimuUMNMG0CQoXZhW8qPJqfQx36V14X7EI8g3rI+iOR9ztDZbiTgS0SmFpwW+hu+DzN7fPRrrIZb400GnCsehekKLq0pZd2b6HGkFetpfUH7Tqc83rVAE0ZkoDfAhc8KqE9UEdRaYM1joyqsWrh8FoSeXQw0osYoAQ2sjDpmyfVBiTlg5ZcLGc/GdM4vMfbHqL0v4gIyUYcXKkoL+QXyf88LN5/Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e769d69-27e9-4a2b-923b-08ddb8776300
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:15:05.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGUlxb6tcY2iCkDbkbTlITp58CqVoXCSQpnCv7PnFZsVU+URJOOo0PwmiWg+X30d8ZpO4rmzS7VQKuu8iEtaX8cYky9AG5hB05yDui11o2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5992
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010047
X-Proofpoint-ORIG-GUID: odKaZ09Ekf09Uuj1Zx182GmMTRDnHhy7
X-Proofpoint-GUID: odKaZ09Ekf09Uuj1Zx182GmMTRDnHhy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0NiBTYWx0ZWRfX7I0y+qzW95yK /FIllqiKZrmhcjOP56vhXyMM2GGkF4+R5tNVn5RndcWN6yXEHP+4wsML+TGGlxl1XqCLo3Ec4n1 lBFqGxoGRKxW7D3ktwJZwX27xbrmwe7vk1vRdCR7hZNlyj6akCFtNGRlQZb3BYP5xOFrPb6EYGs
 BYeUuDweG7UHfVcUqwAAtVGHl2NwaG+WJ4kd81jRhmpWybDfdx1sIrRlVq+hNp9xFbIsfXHONus nereLNZpSyIWz4HxM3EPzZ5CEucjSicfnwmPPpYL/v21xtn8EllbnBtYWXzWnkMrrsOjRXLihYm XJJZf95i/s3fbaQ59sJnz91ST8LCvXHks0yNeOOtkGFAc3/V57jaigaVzUv0jOVpFovBEi3OmZ/
 Q0hVbCXdTNnqq+B7bd4iO+BkSqIOJMLncK0WkVOfm92WSk6hJLNwSROftdfbvLDJcLcQKBYz
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=6863990d b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=4_-yDP7q8rE6rE6kZ6gA:9 a=CjuIK1q_8ugA:10

On Tue, Jul 01, 2025 at 09:03:27AM +0100, Ryan Roberts wrote:
> >
> > ////// end of Lorenzo's suggestion //////
> >
> > You can obviously modify this to change other stuff like whether you feed back
> > the PAE or not in private case for use in your code.
>
> This sugestion for this part of the problem looks much cleaner!

Thanks :)

>
> Sorry; this whole struct tristate thing was my idea. I never really liked it but
> I was more focussed on trying to illustrate the big picture flow that I thought
> would work well with a batch and sub-batches (which it seems below that you
> hate... but let's talk about that down there).

Yeah, this is fiddly stuff so I get it as a sort of psuedocode, but as code
obviously I've made my feelings known haha.

It seems that we can apply the fundamental underlying idea without needing to do
it this way at any rate so we should be good.

> >>
> >>  static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
> >> -		pte_t *ptep, pte_t pte, int max_nr_ptes)
> >> +		pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
> >
> > This last parameter is pretty horrible. It's a negative mask so now you're
> > passing 'ignore soft dirty' to the function meaning 'don't ignore it'. This is
> > just planting land mines.
> >
> > Obviously David's flag changes will also alter all this.
> >
> > Just add a boolean re: soft dirty.
>
> Dev had a boolean for this in the last round. I've seen various functions expand
> over time with increasing numbers of bool flags. So I asked to convert to a
> flags parameter and just pass in the flags we need. Then it's a bit more future
> proof and self documenting. (For the record I dislike the "switch_off_flags"
> approach taken here).

Yeah, but we can change this when it needs to be changed. When it comes to
internal non-uAPI stuff I don't think we need to be too worried about
future-proofing like this at least just yet.

Do not fear the future churn... ;)

I mean I guess David's new flags will make this less egregious anyway.

> >>  			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
> >>  			ptent = pte_modify(oldpte, newprot);
> >>
> >> @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
> >>  			 * example, if a PTE is already dirty and no other
> >>  			 * COW or special handling is required.
> >>  			 */
> >> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> >> -			    !pte_write(ptent) &&
> >> -			    can_change_pte_writable(vma, addr, ptent))
> >> -				ptent = pte_mkwrite(ptent, vma);
> >> -
> >> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
> >> -			if (pte_needs_flush(oldpte, ptent))
> >> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
> >> -			pages++;
> >> +			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> >> +				    !pte_write(ptent);
> >> +			if (set_write)
> >> +				set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
> >> +
> >> +			while (nr_ptes) {
> >> +				if (set_write == TRI_MAYBE) {
> >> +					sub_nr_ptes = anon_exclusive_batch(folio,
> >> +						pgidx, nr_ptes, &sub_set_write);
> >> +				} else {
> >> +					sub_nr_ptes = nr_ptes;
> >> +					sub_set_write = (set_write == TRI_TRUE);
> >> +				}
> >> +
> >> +				if (sub_set_write)
> >> +					newpte = pte_mkwrite(ptent, vma);
> >> +				else
> >> +					newpte = ptent;
> >> +
> >> +				modify_prot_commit_ptes(vma, addr, pte, oldpte,
> >> +							newpte, sub_nr_ptes);
> >> +				if (pte_needs_flush(oldpte, newpte))
> >> +					tlb_flush_pte_range(tlb, addr,
> >> +						sub_nr_ptes * PAGE_SIZE);
> >> +
> >> +				addr += sub_nr_ptes * PAGE_SIZE;
> >> +				pte += sub_nr_ptes;
> >> +				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
> >> +				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
> >> +				nr_ptes -= sub_nr_ptes;
> >> +				pages += sub_nr_ptes;
> >> +				pgidx += sub_nr_ptes;
> >> +			}
> >
> > I hate hate hate having this loop here, let's abstract this please.
> >
> > I mean I think we can just use mprotect_folio_pte_batch() no? It's not
> > abstracting much here, and we can just do all this handling there. Maybe have to
> > pass in a bunch more params, but it saves us having to do all this.
>
> In an ideal world we would flatten and just have mprotect_folio_pte_batch()
> return the batch size considering all the relevant PTE bits AND the
> AnonExclusive bit on the pages. IIRC one of Dev's earlier versions modified the
> core folio_pte_batch() function to also look at the AnonExclusive bit, but I
> really disliked changing that core function (I think others did too?).

Yeah let's not change the core function.

My suggestion is to have mprotect_folio_pte_batch() do this.

>
> So barring that approach, we are really only left with the batch and sub-batch
> approach - although, yes, it could be abstracted more. We could maintain a
> context struct that persists across all calls to mprotect_folio_pte_batch() and
> it can use that to keep it's state to remember if we are in the middle of a
> sub-batch and decide either to call folio_pte_batch() to get a new batch, or
> call anon_exclusive_batch() to get the next sub-batch within the current batch.
> But that started to feel overly abstracted to me.

Having this nested batch/sub-batch loop really feels worse. You just get lost in
the complexity here very easily.

But i"m also not sure we need to maintain _that_ much state?

We're already looping over all of the PTEs here, so abstracting _the entire
loop_ and all the sub-batch stuff to another function, that is
mprotect_folio_pte_batch() I think sensibly, so it handles this for you makes a
ton of sense.

>
> This loop approach, as written, felt more straightforward for the reader to
> understand (i.e. the least-worst option). Is the context approach what you are
> suggesting or do you have something else in mind?
>

See above.

> >
> > Alternatively, we could add a new wrapper function, but yeah definitely not
> > this.
> >
> > Also the C programming language asks... etc etc. ;)
> >
> > Overall since you always end up processing folio_nr_pages(folio) you can just
> > have the batch function or a wrapper return this and do updates as necessary
> > here on that basis, and leave the 'sub' batching to that function.
>
> Sorry I don't understand this statement - could you clarify? Especially the bit
> about "always ... processing folio_nr_pages(folio)"; I don't think we do. In
> various corner cases the size of the folio has no relationship to the way the
> PTEs are mapped.

Right yeah I put this badly. Obviously you can have all sorts of fun with large
folios partially mapped and page-table split and etc. etc.

I should have said 'always process nr_ptes'.

The idea is to abstract this sub-batch stuff to another function, fundamentally.
