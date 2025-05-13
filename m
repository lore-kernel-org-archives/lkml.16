Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6F419F111
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148276; cv=fail; b=RXPdElbp+OgM/L4AhQbq3VIkoEyKGvoZSeFkrIdB8r+nm8f5LRoQclkTflsTSOV2LCwnPQ0PzWZBoLnB9tn09pKzAv1ww9cbAqBUJlL1qMrM0ZnOwrSuLtZMmp+eLRRxoYJM4T8GDF8ja2l4MG7ewI6Lh6tA+JwKYnhtDSdk7ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148276; c=relaxed/simple;
	bh=nZGCHAdLTWtWNSrW9lLVm5McCtQLq2vjhlFlnA5rS5I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EXQCfW1+evy2kVBTRXSyvxg+mmikSvVAj6L2a+RIwpSBJZomo3tRJbAgZYyjN8rJQ9625CLYarWA9yW95DxBP8F91WtmFmsM15h3g0ruJBcmmR0aKksu16YkqdTLBY9mBB/qwui6ttjcHpvtvADQ+HPZIjySSS8Jv372/RfEzgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rF7KsB8G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lVuWnp4J; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rF7KsB8G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lVuWnp4J"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHMxD004892;
	Tue, 13 May 2025 14:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=TMs89jfrg1z5zO4i
	jxYfW9il/B2shp8ngJfrEdhMQl4=; b=rF7KsB8GXeYdpt2l/Lpm6Y9gXqQiayoz
	igUlXRNvdyhJBrRLKUBkFgfKerByDcoU8VCNSpkfNfcxUeRJaJzo7xVeli4xcYAt
	4hhv3u0IQ7gzfAVLHCAKcZuhqQpDlLFkhaVQS9oZaXDFjYSHI2b3UKGmkL/f/+g5
	LL/kL5y3+M1uCKlRaZVfZ07DKjGXCjYeJl6/GPZ9fyyFIJh0PyDXY9WI4RQQbU8K
	8sP/ItntJpt1UDcRixz7JOZ5IIBYTT3XxkHvk0cXcEN4LVg9QRMwqVozXoBzxmed
	sEzAfWpAajt1Undx7LFyhU4RU1mhgTQr1kl3jYrryX4bZFWdORUe5g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j059w2uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 14:57:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DEkE1I022418;
	Tue, 13 May 2025 14:57:28 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010006.outbound.protection.outlook.com [40.93.20.6])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw89svn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 14:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/hUoTxw/usq3Qsy9+juQo3fKFhdm7ICLjNdgBWR0lbdb/QV04OoiFAC1wGE0NtHrEoWVkW8D2/lsZmwo6toD0q01ajcTbSHd1r3cXR4qTmoJay6PId67z6tHRTXKVfyn851kKWSfMipVHoQzikFsE5GiiAITNnm5Y/8f175MsBI70GmFN6Y7vYRNZkXV9PwVZ0Q24XupPMDiXvR0DhIcICcCWSZNfeNNo5J0y6MStG4Us1okN+XaNsa0cXmoAVcbfejwNw51tUXC2zHZhttgI2fnKFrW0FhfzmgPeCRpIeunxBBrcCow9r9yZrus0e+MIoYZ/+UW86ekXPTSb8j1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMs89jfrg1z5zO4ijxYfW9il/B2shp8ngJfrEdhMQl4=;
 b=x4j9aZr2kC5nQu45IWKZhgptDOfW1LPbbI7p7+3wihwbgEjU3s13xleWVPgpsR/v489ekNqnbh8rPKXGtpZBcQ6UCRXf99HL/tx9hasXquxGGz3DwjiJd92jZe9CexBqy/uN2ELmXDPzMgw0Xf+GBwJv/PNdwvGXViTOZEFtL2WBKxkqAZzUE3lIm/XV8FU7P4JZ9Hjfcy/wpGPmOc2m6flmSw4j0TPWfMsbJsZatuK+n0dlM14JYALYdtMJV2GG5KuiruWrEv37qRhdyeXudmy+mO/EAmHn+pPNXT9ERNUe3w1D51IubR+0lmvj3Bk5x4xN133QoL5F98/ZEUv3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMs89jfrg1z5zO4ijxYfW9il/B2shp8ngJfrEdhMQl4=;
 b=lVuWnp4JqMIIWPuTDGDatb8LtVkSWOnYfcOJqTnxB7eKT2rTBpXy7R5c6QT/yHm0UtJrqqAtWEY00jhqXL9pvlG44QoWFFgWTp2Ey02rQh/Ve0v95SkpxN6AoN56P45YWqJEkc9Yxost9by3u7UvZIt1dH9z5jE7CoDkAET1BcE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB7076.namprd10.prod.outlook.com (2603:10b6:806:329::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 14:57:25 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Tue, 13 May 2025
 14:57:25 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Date: Tue, 13 May 2025 15:57:06 +0100
Message-ID: <20250513145706.122101-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: cc6e2aed-b409-4292-c47d-08dd922e7939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iO+tzSIjTLINNPCR9/hxhmdrGj0RMbvbzLkct3bH728aumzra6iLJoQOybTd?=
 =?us-ascii?Q?ehUZcEaAD9ASxPwbH6bp7V+QWuusbAcL+PH6aspGr1Kw3XVtPEZtw2MIUSt9?=
 =?us-ascii?Q?ibrc585QOWbqHX9TzKb4Fw25uq6cDfDvwruxnlbkiQMzHijb8P+Tr8A0hyBA?=
 =?us-ascii?Q?jFcm2dJDypv+TaT39/g9XC+05nt5PLxRSTunBmO2T9TpQHbkpbjjbKLRdQ/3?=
 =?us-ascii?Q?grP61K1Cf2ahWRag3BzImWQUEnaBwXRymkyBWBOl+6usuppSh+764/2Y8tu/?=
 =?us-ascii?Q?wq/QCRXzmLG50OkG320KVFXETJO8z0vtyoaLsVEGidl8HFr/+kBo0RvCH871?=
 =?us-ascii?Q?GZ8Uz96knLEw8MwLJnwS2aYWMI6GVT/4LiDEsYfOWg5Zrw8kDoP62m5fHxxT?=
 =?us-ascii?Q?wkZtW4EQHNhkBkuorEAdwPQ4ds9GwlX3Tw5Jt+yX0Pc8HtcX6y9DMW+dCRgL?=
 =?us-ascii?Q?WsPUpKCFn/9wjCzIY6sCm+GjZMst312Ad5SxgxDNjRF4D15WBgoH+/fWBt3M?=
 =?us-ascii?Q?iQyg3il9dT1uuDAZES8NVcFMxWVi9V50ziAG67id2cpClCTtJLJo44oyCuSP?=
 =?us-ascii?Q?vIzEZgVqcjDzpH0hOgtIaIezjt/Gsv1MP+v8z1tWB/mr53mzIcId/P155GLl?=
 =?us-ascii?Q?p+UmrBP3Jvua+zRdZcK9qX9+ubB+q11dbgPFS31qOr7szShJ/FxhVrsVMXHQ?=
 =?us-ascii?Q?2RvotbQSWn0UYqQYhA19iy7fExDcFrk4g1w9TetzVzV9Cmx3KlUonFwOKJw/?=
 =?us-ascii?Q?KpUhmIu0LZL1Q3SgN3s+1L6HshR/UMTJL9oSxTRFtRBerSfUfu36Gg9lboE0?=
 =?us-ascii?Q?cfcwFGs6aHkE413tBaq1z/oMfrrW54oz2Z95GsAg7RMJmRu9PXtdE2N6bTHo?=
 =?us-ascii?Q?CaQxOPUk9FKOQ0jPqlPCO/dqCOzY1ugsh4ePMDbr8t3G4tUdnLGbkCyXuj2e?=
 =?us-ascii?Q?7uOLvAeuzOep6lxtDX5lkqb03aHW0rtilxXDd3kP1AepYhbnJn21/SlXMd7Z?=
 =?us-ascii?Q?gJhvVJLkOBkA2Lo/S+zaWmBXA4HgIAJurgfG/hYVKAcvN6LaGg3WYcvjfR17?=
 =?us-ascii?Q?c3hSdalprOPb2qF4M0hZKF64AYqeKh0cF5HL63Gw4kyQRBQNTts+IiJP2NU1?=
 =?us-ascii?Q?nXvcbMcizQeoafdTR39xO9jz/b6uY32UMHZem89kcZyjMUIxA6lD3n3aP+5U?=
 =?us-ascii?Q?CWP2MRckdeov5sWVW2seEhQABHVeEGP8Zc1sZjCr6c1NE4LlvVtfOd1tKUC7?=
 =?us-ascii?Q?IRCSR+sRNShqjJKnGfEzvNaRJsajUNRMlkM/Oe//O39zAjEOlkaWebVjpiUQ?=
 =?us-ascii?Q?UXYCLXXdSc5OH4Djk8A4ayPtz90FP1TZ7X3WaUo7iAgFMPAG0ENgCl+nk28X?=
 =?us-ascii?Q?kx8FNC8gL8hfcQEeuabK65/jBu/QflyG5sYFjqpn+4dRxEN4Y3C+A/YKLd3j?=
 =?us-ascii?Q?8wa4UbFIDtE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OiN302EFhPSCew25V237kaGdOC/cRFZaXJii5LBlxb0yFs5X4HK2QMsHetpv?=
 =?us-ascii?Q?DfgnLdAewj/SnTlBGIkP14TWToaon09+nUP8Ol84Aej9rc89v679CVrVREJC?=
 =?us-ascii?Q?SAsEM0sIpuQouc6kC98vH/JRJ+TrjTfDgOKlB3WmquwwDHIkFacBd4LZ7JlC?=
 =?us-ascii?Q?8xBiFgy6yiUg/EPI45HZqdWwTMBExquZy/B8PV659kKdn/1CodglRDHz1fF9?=
 =?us-ascii?Q?CdR/AH2eSEpTsChQ3WsfiRqDzaBnptspwcJBBlDl6Ap6iDrtIfp16cxnTFmA?=
 =?us-ascii?Q?WR1YLsjmitzifGPnY5HmUhFDMLe8lGjnzSkbyEDDLAMDrWJIFCMmgVY6pu8T?=
 =?us-ascii?Q?3F0+Kp+dY2levsdtxKPKcohni1YIi2lp1YLx0dv8P6U0jVi/OZZJcicRWxJL?=
 =?us-ascii?Q?uiCZ8fHLknJMmIUe7WA1KpK4kr7t8iGvt0mszRAoPO/6Da3aO3RgdQqKZozs?=
 =?us-ascii?Q?O/jYPKKnWm7d4r/YXPBJSqTMYypzjbZusWIrpaqx4vAy/K4+PJfg0DldqOgF?=
 =?us-ascii?Q?jA6Aftdg3P+K3VtaIIpggzwyoYPLw1THkc74bBLwfjthS///07M8mwDegHC9?=
 =?us-ascii?Q?wpGczlaDwFYVEjo1eq70Bbu6tVGCIUVaz9CkL/iDJugJRd+0m2Ni5WqrsMtn?=
 =?us-ascii?Q?/15iJvxjbHxymwtqh6gGymLUHX4Rbi8d4u8RZtJer+pTTgYRlFsrlTw4Phh2?=
 =?us-ascii?Q?5Z0tXMA6eL3ttFfm7SgCdDUJa6/+dvhaywQf86JmLYPE+atJTElaNPt8GDOD?=
 =?us-ascii?Q?cJl9K11H6pvNSdtXFr1Xe5K+BWXkzymUctgZnHR1EwsR0+NZyNoXB/FOjR6o?=
 =?us-ascii?Q?ich2t6qggR3Ld+iKE3SdXSo+wdzJoAoOhgG4C4H4KINHLpvUQD5XQZMuGeH8?=
 =?us-ascii?Q?Ao6+9ZKi6YY6HkQsYT3eKVOsUpu21V1P5XSq21fle29SKGZUQzaLLNYQaBqH?=
 =?us-ascii?Q?j8YRZWQC3uK1bhQ+vtSBu+1JRzqd39YzxI73WRCx22zfMLoDSSG8CbwWk3bt?=
 =?us-ascii?Q?5vGMfew2ALEZ++jEstyFGr2smpLPR+4RqrTnEJ5dLOEzkiqeyrbB3q2VC0Ia?=
 =?us-ascii?Q?JWULsvhYffrF62a8NB7GK/rIorGGKaJOtnh4NkMJeuoDqfSqCkVMdo0DyTmW?=
 =?us-ascii?Q?2Coy1n/ooIRugw63PN4Oz8hDNEGdcf38YtuTQX2cLQ0gJ/RCW7rej2t4Ions?=
 =?us-ascii?Q?/6DomxMjgohuMr4F+koU5meNsbOs94tuJQJZen9ZBkQDTTsst2Qhxn86fL3d?=
 =?us-ascii?Q?tYiB/RvErqfZBweyqhtOdW4iSJ+f9qdDZyWXYwEoInKOUq4FpQg8vPN0XVfF?=
 =?us-ascii?Q?5MSZK1lvODmrtfqQFuLCNWzCCmvAyvb5yp6z5vnMcuBY/063VWPFfwrvXL6R?=
 =?us-ascii?Q?dyRuJbpEqgJfHyquDf56SvNs7lDy86zweBbg6NtlRB9Igjw/5azUx6Ix60uL?=
 =?us-ascii?Q?cHLtRugT5hjIGmAvQFol6wVDTKpBXi4Camm+6jk0XhbhqZtUz4yZUOfc7zjR?=
 =?us-ascii?Q?Th4GLGwVsGhEEQXRVGLFerBdkYOWZrwncYsaRfN0dKQKHhLx2kL/cf2NteEg?=
 =?us-ascii?Q?iX+/huTma031esVLYDpI6qrR4V9kEECTnlbI712db1nXM5/kgV/FaXnriDLe?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7ZkMtNQkhBlojzKv76fI9K964toanaFOt8OjT6TZ08kQYEH6yb2dyIah/WC6i4Cjc3DId21jTaG4aHQ9izkkhxRuigWJ2HmQuym9VDrDsJiyvmPlEbhYPhY7NjS06FDt8FjktG+LVRf8JvfHRPFYmxAeQTfWRQPN3xtjZq7/ZuMReYCvv3RiNSx8HJzVPCdLhSFkPsd+1sjF75pTicb6zNLwkRK6b32IoqpwEK9HEdJ8CWCDYFVN+tSA3nKecm7hz2PrGefUEVbRIYojrrpVyJAnp8TY5/Vr5zjGBZPZMWTrS9k4URHs6a9Zl5TQ4DWpbUMmZAUtKU8rZhBonXah7Wxglc98rSCkjPiHucBbzRZuYmc5dqu/HazWCd2Lm6N5ngxgoSBd59/U1CG/LpqD42z69E4DgEZNVcDGsgNIdUZVYiTU81C99I3LI/994rHvET3IrIUlRC0AQUQGggWOlJcGulsNv7e70pFYebfPNsfib8iEvYWu0cl6lCKE+BuxZ3KK3W7vrXCxFAmTqNkl4bCm9aQkDU+XOqMDqOhCCsw+/VaLSe8xpEpOho8mxpOUd6bn97SxULbXjyn7d9HxFKObyCBQP+JHfCQrUVs2Uak=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6e2aed-b409-4292-c47d-08dd922e7939
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 14:57:25.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWBtgvuaaoO7dRg/VCbPvpzNsru8UZbounwfJmRT0CchystjVpHZxem3SdHCJJEY7b2fKuQ0U6MOcBup1R6GTp35vKW4EIS/YZp90vrOIkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7076
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130142
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE0MiBTYWx0ZWRfXzlUcRITfnonD tiHdGCnPGJuNjxnqp1lHnRdctYqL86bEfCyzCoA6SoZCcoSvS3XSkc8/i9Dj5klmPBGoPwLmm7+ NS6XEBAeXVwcAdujpDJdwC01zdftadwONSfS+BX3ZdUZGJgCWI35dxHB0BIATSPLM9/ObWYhfa5
 P3tXwYxrkkMWh/eidE1DDPwGnCuqsm/h30YUxYvKhZQKgcIKk7kPnxRngIU8TywHSMHmHKx9NHW FLruloL/dA8It42/nILF+dGUV7urf8bbSOQu7ntB1TOQwkOrVkkXOxmpReZqO0/lZ2h4lkC6RaN 4Gwwpk8fe/d3a/m/YLosmZovkuyCYkeEOMbTRXGdzQiQaDEnXZr4/yhIJQUzTwUXjm2y0Wwgv33
 r3PvJ26YutP64VD4mPwrEAmejBmD+XyLJl/uVyLXeFLsixAp0s3kLqT3GxlvwyhGKTluSvdl
X-Authority-Analysis: v=2.4 cv=RPmzH5i+ c=1 sm=1 tr=0 ts=68235dd9 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=j5PtLZGL1ZuHC3UwFroA:9 a=1CNFftbPRP8L7MoqJWF3:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: WnihZFasfByyIBK5ndah4CrRE_xlQs7z
X-Proofpoint-GUID: WnihZFasfByyIBK5ndah4CrRE_xlQs7z

Currently kernel/fork.c both contains absolutely key logic relating to a
number of kernel subsystems and also has absolutely no assignment in
MAINTAINERS.

Correct this by placing this file in relevant sections - mm core, exec and
the scheduler so people know who to contact when making changes here.

scripts/get_maintainers.pl can perfectly well handle a file being in
multiple sections, so this functions correctly.

Intent is that we keep putting changes to kernel/fork.c through Andrew's
tree.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Kees Cook <kees@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff5d3c40e749..d4092ebfbe03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8838,6 +8838,7 @@ F:	include/linux/elf.h
 F:	include/uapi/linux/auxvec.h
 F:	include/uapi/linux/binfmts.h
 F:	include/uapi/linux/elf.h
+F:	kernel/fork.c
 F:	mm/vma_exec.c
 F:	tools/testing/selftests/exec/
 N:	asm/elf.h
@@ -15539,6 +15540,7 @@ F:	include/linux/mm.h
 F:	include/linux/mm_*.h
 F:	include/linux/mmdebug.h
 F:	include/linux/pagewalk.h
+F:	kernel/fork.c
 F:	mm/Kconfig
 F:	mm/debug.c
 F:	mm/init-mm.c
@@ -21769,6 +21771,7 @@ F:	include/linux/preempt.h
 F:	include/linux/sched.h
 F:	include/linux/wait.h
 F:	include/uapi/linux/sched.h
+F:	kernel/fork.c
 F:	kernel/sched/
 
 SCHEDULER - SCHED_EXT
-- 
2.49.0

