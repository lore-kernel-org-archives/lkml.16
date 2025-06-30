Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2096.outbound.protection.outlook.com [40.107.96.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FB2154BF5;
	Mon, 30 Jun 2025 03:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252641; cv=fail; b=kn68rwuhgUrzGazl7cJ7e6MMjY/4eAPbP7FbZuB8Cs53O+vemQOjkXBtqRBAS/4p1206/9nUFNxXSnW1bTtmZzacq1iHgFNVXAX1mCqa93iF5/S4K2djPQAdIjNm42vrFEDps4/xfxE7Q2oRkrrMhLKGiHaReF+9TYllyRgydyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252641; c=relaxed/simple;
	bh=emUjKEDON07Mr+3LwzHuH4snutPcp7YmPK8bcZXc6hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m3iYj6Vp0iYAPfhYHsJu+uQmU6Z8KcV3kdYebbFeFmPXt3bmhaR2NicbxqdGsyegbTbyPESJY/mTBs0YAUYz9YGgRk2yfJ6InC3K9V0G2Ce4+VgYDLudkwM18OPMfPEFAu4aHjRXmHv4cIctw1JM4H0hk/bikZZ7brK8/wddrbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=jIOqUqKp; arc=fail smtp.client-ip=40.107.96.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="jIOqUqKp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbuZBY9ckehwi0IJcblM6tMxPMqrw5KcKgO+n8Aa80WtKPsu3Yrbw2UzTmJ3LgJYqRvjvUPu8CqbZFEEOMMW3ILSlh83o9BZ1fPdqupq6OeeGn1BMmkxuuqB9Y3Q7zIXyqq582x+5GEmFjN05vOEXNpc/C95OvsmLUyVi+hI48cJgOlOuaT0wmD+PR0DQPjMBEveEdO3ujLw3Jzt3akx7DQWw1kMrFp2gAbtX2+2bPFK/Wrebwu/pGgwPqnE6nNU4aeto2nvrbRn8Fm5zCNCa3HwrjjIlaEMw7z0ghGBEB6ZwiCxmzeO5RlT9Rw5ycF2vfcblG9vUosgjI2gYPzGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcTpVtIwq2dft3Py30i32PHxXWt4zy7IH+o3jjwVysg=;
 b=LOAe3EvihFt0MdeGHZNq7oFSqkNW98stuOM+8Fqjqk6kmvZPl2vxKvGYcHpgQ60XWrailfIsbdkKJWAtAkOjpkN9anM8IbrumCyNS08O0aZqliP13EG4W0bdzL4NN063+TJDzmWVxyCXYpFBHpp49grfo3J7fnrdSlLT9IRSIcAFi+Mmbvn3hLqbONH1Z4ba/WFdN78fSbSzV/xCyr3q7hm2/Q8POXS+acBGRDYLLzEtU5krc6ryWTZWyFD6G089F5DS4We4iNV2gIAJpzhUNuvK7c0+BadMrfDsBsdP7LtJbiR9m1pPmrQFZKBfrps5rGizIV6plopwkaodDveEtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcTpVtIwq2dft3Py30i32PHxXWt4zy7IH+o3jjwVysg=;
 b=jIOqUqKpI1Gla19ztjJlVd4qfS0cVXsmxRm4eqaQdzqiNfPZhleS7SBY77Mp6Ef7RLU2hdiWLJupPdOLhbldjBHLWG6aH08eiqcnu1Con+DrvwMLsmN4mwy26+uPMzDuX09v74wgisrWry9sBj9XmVylXLrOx6+yOY1/RjFbrWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 LV3PR01MB8511.prod.exchangelabs.com (2603:10b6:408:1a0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.28; Mon, 30 Jun 2025 03:03:57 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 03:03:57 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net
Cc: patches@amperecomputing.com,
	cl@linux.com,
	yang@os.amperecomputing.com,
	akpm@linux-foundation.org,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	Neeraj.Upadhyay@amd.com,
	bp@alien8.de,
	ardb@kernel.org,
	anshuman.khandual@arm.com,
	suzuki.poulose@arm.com,
	gshan@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH V5 2/2] arm64/Kconfig: Remove CONFIG_RODATA_FULL_DEFAULT_ENABLED
Date: Mon, 30 Jun 2025 11:02:28 +0800
Message-Id: <20250630030228.4221-3-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250630030228.4221-1-shijie@os.amperecomputing.com>
References: <20250630030228.4221-1-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0009.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::8)
 To PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|LV3PR01MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f41711-2854-457f-132e-08ddb782c10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p9JHQZLJhZBpv9d8xY6RSMS02Z46Vt1fusQ7dxqUVyuHcSJtM9mvjCXUmtbh?=
 =?us-ascii?Q?k38foF2cIPeiFBkVXH690t9rdIivxlBCHqhCIriS0grz2I4NEnESA9bZ7JKS?=
 =?us-ascii?Q?e9Smw/UXutO3N5+n0SNmBRfoBd2Q1XmrQvWjX3dyYQ1NK1qW3l+adws59Bin?=
 =?us-ascii?Q?mV4wMHESQwBN9dCxfIiY4f19DG5HfcxNmF4sQ0RvZ53pHh2l8p2fSACqJQaG?=
 =?us-ascii?Q?1nmt4BNO+8LA1PmnZXr3yQmxflGD2zrvmOT1qfqxbl/XlmPyifPCHvPOxbZy?=
 =?us-ascii?Q?Zw/ZpRSy99xJNIhfrfHSnMPbK7gZ6XYcqSBGBhplEeBqPCXpCUrbWzyb+0uG?=
 =?us-ascii?Q?zngnt//7iQl5Ja12/yJ+kr2wavY1XCz0DHSIqBX01Zg6572rxRb72pdol2W1?=
 =?us-ascii?Q?TQu1d96BxvGOtfRR6UR3guR/dTk703Egw2L1PcKVkBpDMiG41ruPJhYwd1EV?=
 =?us-ascii?Q?5vOQH9tPv/TWpsTTHYre39cR6L5JJsAYdL3U18sNak6gSSCT8+jd3pl0LJJT?=
 =?us-ascii?Q?/o3wtP6hoE0giW4sve6z54B/qqYCVOcdWROvNrn1r0tyCv8oD0cOqzQVsUC5?=
 =?us-ascii?Q?EWau2QU7SZgy692omc8w4Wu9FUApVqZFQapzq3p7eld+Q0zVRjSb5wpM1sn4?=
 =?us-ascii?Q?DqOTHaqWoYS8obdGqPL+bzmdPL1mSROm2b2CMv1cj7XEelMqk0jScUQeF+xr?=
 =?us-ascii?Q?+XakWC9scsmfnTB4g37knMduKKDu6C1+avlG0RY1ihFeCVnhvDL9lYXg2MON?=
 =?us-ascii?Q?NDHAc1pMQ4Dlmj7mEMJYkGs15oC0V92Ip/SgYD+jgqAJIRvu7pJvOI3tqiwX?=
 =?us-ascii?Q?rmR336pcHSpOOP+314q7ss/ZTr/+6Ps0oc1yhBAiKQTZWUkUik0LCbv08XGd?=
 =?us-ascii?Q?8ud+cLHE+2+tcHS7YxH6a7juYkb8ol97NjAGTHWT0X1TeA+mK0uUfDbntKzi?=
 =?us-ascii?Q?wKoGAXK2UiCzch7vRGcYw6RTRCvIAdL2+I9kr4A1PDentqKPRs8RB54ZFcUz?=
 =?us-ascii?Q?T3riotPYCw2GJbPVAWy+i3D8lLxFZF5XXVCLLSuDHtc3pEZlVe0McXOCf/67?=
 =?us-ascii?Q?RqAFjRRENBnHuNrSDHu3bgasaXXG4MupdL3ofnUc7YjJBqSER9FjFCcD2RRf?=
 =?us-ascii?Q?AkzEbYICOJ0zOYTVmopvHAszMMWNFxOP6zi0MIgRgvwF+Og6TNqBezJ5423w?=
 =?us-ascii?Q?N/Viak2ibIWzjLjoqjK44O8UkKuiwPLt30zZmCpuu/Q7e0MEnGNQKI7wyzUo?=
 =?us-ascii?Q?z5RLl5IKSA5st3lRH+v1pjksgRorN15dgIPU46G3kNF0wf59EFJm0Cyvr1LB?=
 =?us-ascii?Q?/8hzKTYHNYNRvSD0F+HJwX/t7fwm3EXGgYNON2h9P+HSXi04opTyDP8A+oUA?=
 =?us-ascii?Q?+Al9qIO295Ob2AsT67tV1l6xB1UUR/fLLo/IhZWlRiaOJDhz+u0oA0sJ84NW?=
 =?us-ascii?Q?kJ22ODXXwRNhIzHwcuIdB/HPx3rgK4UJdBqV8sB/8ntVCqEtprJ8sg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mtvRv+ne5Nt7B+02JU/8dI160t6bFy+URRK9iJ8Ue3FTdXPELjz9uioaRlO/?=
 =?us-ascii?Q?E/AAXEiJJ3ZVN9DkY+rLjDhn1gPmOgjY8II4ZQqRV7V+SuplLH4iH4n0FtE3?=
 =?us-ascii?Q?olSBV8p8gYqd6vQN0jVus3lOy+WxVZQg3MKsbWhDuOjlM9SB9lIBJN8v5wyg?=
 =?us-ascii?Q?4J516FHdNitpDLKo5MHniFPtl+hdfc/JkM/QAAOdGzKVKvlvj3X6hKdetRC4?=
 =?us-ascii?Q?t4NYTFCyEyS8nlkTQeeGpd9+Kd8V01qW1dPx3UwYJMiDY2evB41q2ZnBGevi?=
 =?us-ascii?Q?A2w1CUDDW992YT15Kt6PwiLVBsIxne3w0OGexZIG8pd6HTUYlLwIVK2v4WlO?=
 =?us-ascii?Q?tbu6NsLpf8qnVBd3J6KsYjNWp5HwHRAoSFHt9ietAT9CVHMSIz5gb+Z8yUf6?=
 =?us-ascii?Q?wcziXGo3DqubirfcJpei9hFB8GG1uc3aCaf123Att8O7u0cqUlMCQgJ/htqY?=
 =?us-ascii?Q?ASCZ4TXllS4Ye+o3obTK96JuBhd0ls+b3fRybBRXHbsGmWSXr1a7G0YnDnrn?=
 =?us-ascii?Q?ZqSZKJ69sZ86xG6mttHL214fa7XXFCEBARrucKzf+Qj3dIpl1uqHhrUTFUYh?=
 =?us-ascii?Q?Tpu/0uQ4+x9SdTn5pW244NHhc3+fV0lWTi4Q2sEaecRy8r0+sdg9PRwKpSTV?=
 =?us-ascii?Q?3v8Va40IZqAJD9GUKeBFNzFyIM10TgXDXdwnBYtFt1qw0+jazxEBnZ1/DqL4?=
 =?us-ascii?Q?K6T4Vn5AlnlaKuZTMqYLSFe2BN9h27o94UiC+koxVqHrmae2Urgv6pNsXoUH?=
 =?us-ascii?Q?2tm/5dPjVjFlWxzbuqHxalxb1c1Z5Ry4IWF502onw7bfxMKTWznW0rvrzIbP?=
 =?us-ascii?Q?PzKa5zyE97oxUVWdkqCrPOPzzeO/Wlo1Hu8+LHsIqBgMJsMlmkcsCvv+0hRN?=
 =?us-ascii?Q?+FpHe5SHizav0YVzrrAzXR3FYoL5fLdMhwspZe/Hj/z3nS8cJaiwJMI2UCci?=
 =?us-ascii?Q?7kSaiEbYosciOYsv12aJc0Bn6U/moev49xxIOQrNLkRf4zleb81HV73bWTrN?=
 =?us-ascii?Q?jMlD8dSHtnBPcFv0N50z1MIDIjSB0UjBSZUMIMw6NUBSXVsTBRO6k4eSpBu5?=
 =?us-ascii?Q?F2Gdn6bq9+Ajl2C9a9tWZyeWI91jmcxcUNtAtn/oi2sim88eP3AGvplSE3el?=
 =?us-ascii?Q?NJAIgeOuhTF3lbdY0Uwk0WYtafmVwZNPMpp9wONiuD+wKY6XaaCMp+8Q4rHR?=
 =?us-ascii?Q?XB92npHlJ4shdk8E9NeEYJcKwijaNMLL5ihJtMv9A6/FOYtBameW2FscKBJV?=
 =?us-ascii?Q?xZ528hGZe0Y6olxeIjcYwHXv497cwMZh85XGBIe9zCvjW2ALpskS81fgzmq2?=
 =?us-ascii?Q?Lp4wr60HvDeW4X/BRIEdtd072aRieKNTnTBtEmdDo2Q/lbNBrTW1coH7JDvA?=
 =?us-ascii?Q?3Y3S91jkFFzILhzrERQ8Q/AVkk1xe5xpQYNK7gL3q5qtyYumPZmlRCSoyrUM?=
 =?us-ascii?Q?Vs138+apAg97Hd11F666uT0BAt9QQa21bXzHJi0LkCPd3zCnRq7fTD2B95vm?=
 =?us-ascii?Q?a8N3SgyIaYsk9q3izSX1XNzBsMTpF8xD6hVCpMUys5TrqkGajkJqSHP/5RIl?=
 =?us-ascii?Q?hLLFefA3T2coptcQCtajRQUAUzGxEH5d0jrEglq3NeKsoniqheul6B2g9FLP?=
 =?us-ascii?Q?cHVqa86VLsla9PITRH2CqKg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f41711-2854-457f-132e-08ddb782c10c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 03:03:57.1917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HOiC4/M9qwywUY1nkmytXPKXxgML5T1CQRmRy4AmrWmwm5Qc551+QFiYDFLoMWMv3a3TJFIB/0J3x20nXsRL+C4O5oHfpbmLV1FqE7GdAsWGFaIyHYNADo7SThQ04ux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR01MB8511

After patch "arm64: refacotr the rodata=xxx",
the "rodata=on" becomes the default.

     ......................................
	if (!strcmp(arg, "on")) {
		rodata_enabled = rodata_full = true;
		return true;
	}
     ......................................

The rodata_full is always "true" via "rodata=on" and does not
depend on the config RODATA_FULL_DEFAULT_ENABLED anymore,
so it can be dropped.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 arch/arm64/Kconfig       | 14 --------------
 arch/arm64/mm/pageattr.c |  2 +-
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f9f988c2cab7..12a70f10f7bb 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1694,20 +1694,6 @@ config MITIGATE_SPECTRE_BRANCH_HISTORY
 	  When taking an exception from user-space, a sequence of branches
 	  or a firmware call overwrites the branch history.
 
-config RODATA_FULL_DEFAULT_ENABLED
-	bool "Apply r/o permissions of VM areas also to their linear aliases"
-	default y
-	help
-	  Apply read-only attributes of VM areas to the linear alias of
-	  the backing pages as well. This prevents code or read-only data
-	  from being modified (inadvertently or intentionally) via another
-	  mapping of the same memory page. This additional enhancement can
-	  be turned off at runtime by passing rodata=[off|on] (and turned on
-	  with rodata=full if this option is set to 'n')
-
-	  This requires the linear region to be mapped down to pages,
-	  which may adversely affect performance in some cases.
-
 config ARM64_SW_TTBR0_PAN
 	bool "Emulate Privileged Access Never using TTBR0_EL1 switching"
 	depends on !KCSAN
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..667aff1efe49 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -20,7 +20,7 @@ struct page_change_data {
 	pgprot_t clear_mask;
 };
 
-bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
+bool rodata_full __ro_after_init = true;
 
 bool can_set_direct_map(void)
 {
-- 
2.40.1

