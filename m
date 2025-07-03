Received: from SJ2PR03CU002.outbound.protection.outlook.com (mail-westusazon11023143.outbound.protection.outlook.com [52.101.44.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA95F2DE701;
	Thu,  3 Jul 2025 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.44.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579235; cv=fail; b=YMmeJYnur9llunXFbZ51zw1qB3YyAq88Wa/7MiFaquovZdTpgSXU9Qj8ZgjGn8xBqXZ1ZegLZCNWBA7xCM/JF2TcWcTovdCh/t43Gnzykt9BWdq1asbFEztFGdF37pj5LHeCsS47OjJ6bgpIROc1DrsAv1dJ7vYjbFBctP8BtfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579235; c=relaxed/simple;
	bh=4nVE5ScPfzi7mogqEw9hmUZOdLQoboFH88SfNXAXdIw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cZgIsy0VkJ+ZpRf+480J5rxURpkEj75Sqy279bDHBCvVmiYrh2kx7Bu/SPvXHI0n43RF8Xr3mSve/lsc336wyRumA9il01jIZObbBHXyvsyTkqccNZw1SEhndGXfPlFPyKtB/LtrliO6p+a3APgyGdLzGm2V3Y/CdSQ7hQ70fGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=CxyABTEV; arc=fail smtp.client-ip=52.101.44.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="CxyABTEV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXZ1SYlvhPDaDCgWRNQ6v19+9I080Ca+oaoWcloIFi/pLXrTBZ7n7jO7vg+BDj6ons38vC/aId/CjyKZQYfvdd79q+PxFnyq5/3sLIs3t13HcYTErVgdXdd3pg/0J9DzIh8oHLrnoF0RSBjBTcJAlj31D3AKl2X278Fp8IarwwG/36sFlaEolYjphGILcX+3Lp9IzyX5yLVZSjU/90y9ItH+iI8g1TsZL7j/6wpQaB9ePJhtTwBsFT3xtFVTEhEcC1yqTpyBAz8ppl84ny9WojibI0h57nemGxNncN35J2CRTNsHxM26A6NyJOKiT7oE/+OMeklYZq/Q/wH9+G4Oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et3jDziGTHItsiOHnfgyzSIPIOrpwuXISZ7ArohijnY=;
 b=m6grDuMonlAJ92VBNt6N/wOofv/7M6TC2EyLsxdfNXGcTivc2QR7Mxht08r0EUL9pQufdq9ZgIttyqKhb4d3VpVyAVNaMYg1Jrec7c/snHJLyIPn5fkD0Au7lrVXI8fFDeg0FYHuJIAnmrAiUaHpzzD7PaLeAbPRFsi2mmbvSBYgAFlTzv5QdpJbF600O9JS4fS97ztS6D4QUhAgheh1PhBN323OrkB34YAzeCDh34Cv5sutaRluFXU3D/7BfdlijDG2ZUreaxdKSmXk9D/YsMgwkWiMP779FUkK9ucpjTmPRRyN42g7GBPj1BWNjgxmQGd/S+eXVDcTIwGgN01a2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et3jDziGTHItsiOHnfgyzSIPIOrpwuXISZ7ArohijnY=;
 b=CxyABTEVqEqGUGGAYkuXLf5iMtsj0zVEku+B3go+gMxxEEBePKFuHVgs691ZF/51mkFXdx5hl05RccujuWYjRz2hsGspGMsjqC5lNOvATInxGG4QzIwEEwqkz2K51ZUOco+7O/s/D8zcVieXeTg1EFjeNBhZmJcCZCW509rkTuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN7PR01MB7903.prod.exchangelabs.com (2603:10b6:806:34f::17) by
 SJ2PR01MB8636.prod.exchangelabs.com (2603:10b6:a03:56f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.22; Thu, 3 Jul 2025 21:47:09 +0000
Received: from SN7PR01MB7903.prod.exchangelabs.com
 ([fe80::cf45:9855:a64e:382f]) by SN7PR01MB7903.prod.exchangelabs.com
 ([fe80::cf45:9855:a64e:382f%7]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 21:47:08 +0000
From: Zaid Alali <zaidal@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	mbenes@suse.cz,
	puranjay@kernel.org,
	broonie@kernel.org,
	mark.rutland@arm.com,
	zaidal@os.amperecomputing.com,
	oliver.upton@linux.dev,
	andre.przywara@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	james.clark@linaro.org,
	james.morse@arm.com,
	anshuman.khandual@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	joey.gouly@arm.com,
	gshan@redhat.com,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: errata: Add Ampere erratum AC03_CPU_50 workaround alternative
Date: Thu,  3 Jul 2025 14:46:57 -0700
Message-ID: <20250703214657.786288-1-zaidal@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:303:8e::25) To SN7PR01MB7903.prod.exchangelabs.com
 (2603:10b6:806:34f::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR01MB7903:EE_|SJ2PR01MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 65051858-337b-4e9c-9de4-08ddba7b28a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IG7Gqs3Tw7MKzqtaZPN31mv+8VWZpIXRbYRDHWXG7qTNCnK5iDZzIJfjj4hN?=
 =?us-ascii?Q?+b4BT9fWPil8+6TUlnjlIgO7nCHlf4A5hCr0wvk2e7nhTPPf8bTZg5J3KM41?=
 =?us-ascii?Q?q89+FRJ6+ei0fm9zzDU0eV6nSU4WlVRTbZwlbLlxTEn/SzaiRVl/p5hsEmcz?=
 =?us-ascii?Q?ypIXdEiVVvyEoGmDjEbSJ9i0/cUuGWqLYgIFoJgMXhYbb2rnFzGq7pomMgi0?=
 =?us-ascii?Q?brvIdMbpH07quzT0f1eJQcC1U/k/5RrD5ebLJkSEVMxX/riUnqH6yxSVbDJ9?=
 =?us-ascii?Q?0YhtVdNN7O24c+M2WVXWpzmHCoqYJ8sfPge5bXpO7UZj8s+3Pvtnk+w6g+jc?=
 =?us-ascii?Q?vr9Snbgox3zIE02a4M4GLV6pX64gOouxm2oH6STbLWBTmCOWHL9e9jy2uGXx?=
 =?us-ascii?Q?CqGiAgdjx4cuYxpG1e74dWrVl78KuqpFDBhCJ87zu+FegYOtFyJLsGEyQZwP?=
 =?us-ascii?Q?1MCMyQYadsfAo342NtSPi07cO7o83oYYLOw0Y1E3tmtbLb+uDyK0rviHm7uj?=
 =?us-ascii?Q?LnO7dqTHNTIu1lqsGowq5SKJl0iO9+wLG+kPZq2TY2raQTQOrq8pMeY9bBxd?=
 =?us-ascii?Q?js8n2vUW4Lll8/MVOnC8754R2GNiod0HVjZvmiesq14GzKBdZD/zqAcs4mKJ?=
 =?us-ascii?Q?H0vuZok//bfkb6IJDkpYle0qa6M00xzWtceGmXOeZz9SA2wfL/YtKQi2ZNP9?=
 =?us-ascii?Q?Hb5JNz2LOaSqdx7a62B3qnRICWYD68gy8SvSg0r6J2LMnbvml2zvU/vAmwTJ?=
 =?us-ascii?Q?GVfSKsw7W/SkiPlf5mdK4dZTGiPF0pB6RX73x/t1lIm7SEKbycSyD0aXjwQz?=
 =?us-ascii?Q?Q9eKpa1QqraZKPX5kiBpmVTj/hJ0H7Ied3Nxv4kiZM1rB5I3h6SDvsW09jt+?=
 =?us-ascii?Q?3AQJOBKKxAOTsgUIv0BMFWjF7c1XNbq9BW6t4t5S2JetvvO2RZVE4yfOo+NU?=
 =?us-ascii?Q?66C+LUTAH6YRfEVDuG7EMxREGj4+t7O4VLBN5CxdvrrWs8PTPnc4DovtVyzu?=
 =?us-ascii?Q?/kQtTtgeATh3Jmd1aOhEcH4fVIpERjdFdMsBFkzGmjY3E2/TMDQjFo/3S3cY?=
 =?us-ascii?Q?HimFYudIfSdKMpfAvNggWI+uNsZnED2n9kccLHVwzL0VFRxs+8k6M2uTW1u8?=
 =?us-ascii?Q?7oM17sG2TNa9RbmBUXP7FgMLjtbI8d+RI8q78+tvjwgxb4VdDPf9UV/hSRx4?=
 =?us-ascii?Q?ztBghuu65NtI6x9SglAI/1GKQqhcQYU56vs5qI0QexVvOzn5UuMIXA06Rzql?=
 =?us-ascii?Q?VW5k/G1TmdigdVF+pRJRROTV/icOT4FYCvTOzGOf34UZynV4U2Ff9Q+wpOOu?=
 =?us-ascii?Q?AImYgljmm09j0XernU4p6xGeVADNZcZxeWXhDgpaljKYKeup5JHie6h+ZM2/?=
 =?us-ascii?Q?CQZ5/1wpKclM0XQWuc4u9Sw51EvUzSKgziOrYr1hZoKVh59kurpWPRfRxbHb?=
 =?us-ascii?Q?BMgQFsNR/25Nw4PV8QTclOLX5lnhCoxbf3j+7Uodm9b35Js4+OaDd0ui1PDz?=
 =?us-ascii?Q?dPhiHbwyZT6DFwA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR01MB7903.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kYtYUoLPGx9s1tWxfb3u2rhkyvoUVtJGXz+uFmRJOWc58s4+REq4bc/59+T6?=
 =?us-ascii?Q?yhYOnxIYIlTM3eT+sTGWjB4He5fBcSRhBxoBIxKCaXOMFjIJwnnjLUIj6IKo?=
 =?us-ascii?Q?COiTfpDHZMDSreZ/48xwfj/Q+vhvztDOMEBToorwaSboZ+34gK94yLQhKeZm?=
 =?us-ascii?Q?+pqbInRdjZqyI/nVo6yUFpU3mlY+uLLoXfsXPGQlb7SYxTkYq8pX8Xwf2kQQ?=
 =?us-ascii?Q?dq1Z2BZZcLBWaLu02DX7v8k1dfKIbU+3IovT/D2+c9VuYGDpgULX3unC04gr?=
 =?us-ascii?Q?+RGyJwp5NjxowW2OdQT8JH8LOSFJmw07mlx38hcnf3FmTHhslMyWBm5/CAEw?=
 =?us-ascii?Q?PKqw/6laPTmJy7ztzRA385j76TxGq9PyKjNOJOUNibTqwb+B96dBVwT7k2F5?=
 =?us-ascii?Q?WzsyPz1rZnMby9MdIXOiwhg91AEwppNRddYYuySmPq5M2EskEKuPLAm4ogwQ?=
 =?us-ascii?Q?zOtyO2rn22KgfgEIJk0nXp8hjqp5itqF9RYpny7llCN1WFeI77AKv7IjQBIY?=
 =?us-ascii?Q?F8CZdK44+7WRofT5vlOgVzop+0nMcXhRlZHRYR1ZS8VpwTngWXpYBvXW+PGE?=
 =?us-ascii?Q?LBELDSiH7A3Qpqhkj1mcSBqbE4T/fdXSaEN3TrgjfOyxU+yoH8Q+iYHCtVXP?=
 =?us-ascii?Q?/45Wfz0NmyWx7StDaxNXjoLCNwlWRbrDOWybEUy8lOiJEstq0HX72MjQ6Bbq?=
 =?us-ascii?Q?aELXRFlbVR2XHOqoIvg07M8Dnojg7tlrr+5zJKnXUs252EBadb5V56qJfBIt?=
 =?us-ascii?Q?ScV5vk4rhiNpyS7ngNzAg9eI6pdfcbZZG+3RssM7g8TwsvvysrnRcWw3V7bA?=
 =?us-ascii?Q?EdG5/wDXoeeD3EdDOJ5jW5IA7o0rQv/LqH9Q9/9SVatFRUn5q3JyqNWSzSKo?=
 =?us-ascii?Q?r8hOY9kYpbta5tM169kmI37lWBxnQHflPAyMQOSo0QjH74KJyaLgUWCcKfg5?=
 =?us-ascii?Q?GUljhNo+jJSME+q9l7ZYjZFE67vnsxqy5cnRcIGixcOcSogx329xrz5pPSlO?=
 =?us-ascii?Q?D4D+6nSwW0G3jwvy0ZkIZDeRbflWyYI/AWocG3MO4jrmxbK6bVrpxn4D4Mb4?=
 =?us-ascii?Q?XMkQN9DmFBsq73ubdRIOoXuU7HllWviMz+gwLgPBxW21Qgn3AqLa/v+WV0T5?=
 =?us-ascii?Q?S87YKMLvShQkjKR3QOVVwtnxtAFiVv1ZYq/x9sbGObzsP8yA5L/yBUeY4oVM?=
 =?us-ascii?Q?Qnn2Oc2q6zLxT4XGkAmghDYqw5Hm2u+PjmXk/9+Agpw+rjnr50Wt9C5zT5K9?=
 =?us-ascii?Q?DhBvd8XJk6RoaBx33Z7Y5ojnwgJUgBEUFjuUNpgohV3rzOgnKbFpBJTLgoVw?=
 =?us-ascii?Q?t48KrrH3l7F/lfaLrf3QrFzA206EZdKNE4JHsdRUrwv/4rv0bjOWPRJIk6l8?=
 =?us-ascii?Q?OSdUsJOKLeFX10FhFnK3Hle7cLKeWpLS5IR9Dxj+vhFhnqZ+/GVrSJFrIbgA?=
 =?us-ascii?Q?U0GvbNxYbuqn5+rsOeBiN0GU4bmpKqCzsfmbQXL+U8Vg3/zSElYARNMtNQF8?=
 =?us-ascii?Q?8ys2YSb6gEkG4JOgNztrHpX8JXO8g++63hTGyiCnTs+0fxd/+asyZQRpv3Yu?=
 =?us-ascii?Q?ESA2BxUVMMshfxlB1MyfSjBe1zrOFouajBJk6aMqnft38g02dADlYLyrQIVF?=
 =?us-ascii?Q?hAup0rm5Advpa/szLCM7bUY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65051858-337b-4e9c-9de4-08ddba7b28a7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR01MB7903.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:47:08.7342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVPjZilMcw+zfRmbulQPWTewPugN0LhlZTi1dN+zlnMjR+wfPz0U9OFX+K3FpALEgP1vprzG6f08wgoO1BgBpdyvPSpb10iIzRha1ecmxO/aRdkdhuYQvJbT0TFqMZZL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8636

Add an alternative code sequence to work around Ampere erratum
AC03_CPU_50 on AmpereOne and AC04_CPU_19 on AmpereOne AC04.

Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
direct read of the register will return a value of 0xf8. An incorrect
value from a direct read can only happen with the value 0xf0.

This only occurs when the following conditions are met:
SCR_EL3.FIQ=1 and,
PE is NOT in EL3/Secure state and,
ICC_PMR_EL1.Priority=0xf8 (Non-Secure Group 1)

The returned interrupt filter priority is affected by this, and
returns 0xf8 but should be 0xf0, as per ARM. This workaround fixes
the issue here.

Based on this Defect (AArch-21735), this does not apply to virtual
interrupts. It also does not apply when SCR_EL3.FIQ=0, as no
modification of ICC_PMR_EL1 is required.

Note: Currently there are no checks against a value of 0xf0, and that
save restore of 0xf8 -> 0xf0 is fine, so this is all future proofing.

V2:
  - Update commit message to clarify the conditions when the issue
    occurs.
  - Add entry in silicon errata documentation.

Signed-off-by: Zaid Alali <zaidal@os.amperecomputing.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  4 ++++
 arch/arm64/Kconfig                          | 14 ++++++++++++++
 arch/arm64/include/asm/arch_gicv3.h         |  2 +-
 arch/arm64/include/asm/daifflags.h          |  5 ++---
 arch/arm64/include/asm/irqflags.h           |  6 +++---
 arch/arm64/include/asm/sysreg.h             |  9 +++++++++
 arch/arm64/kernel/cpu_errata.c              | 15 +++++++++++++++
 arch/arm64/kernel/entry.S                   |  3 +++
 arch/arm64/tools/cpucaps                    |  1 +
 9 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index b18ef4064bc0..29e0bd8b07cd 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -59,6 +59,10 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Ampere         | AmpereOne AC04  | AC04_CPU_23     | AMPERE_ERRATUM_AC04_CPU_23  |
 +----------------+-----------------+-----------------+-----------------------------+
+| Ampere         | AmpereOne       | AC03_CPU_50     | AMPERE_ERRATUM_AC03_CPU_50  |
++----------------+-----------------+-----------------+-----------------------------+
+| Ampere         | AmpereOne AC04  | AC04_CPU_19     | AMPERE_ERRATUM_AC03_CPU_50  |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A510     | #2457168        | ARM64_ERRATUM_2457168       |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..1ca4c296deaa 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -479,6 +479,20 @@ config AMPERE_ERRATUM_AC04_CPU_23
 	  for corruption, and an ISB after is sufficient to prevent younger
 	  instructions from hitting the window for corruption.
 
+config AMPERE_ERRATUM_AC03_CPU_50
+	bool "AmpereOne: AC03_CPU_50: Certain checks for ICC_PMR_EL1 that expects the value 0xf0 may read 0xf8 instead"
+	default y
+	help
+	  This option adds an alternative code sequence to work around Ampere
+	  erratum AC03_CPU_50 on AmperOne and AC04_CPU_19 on AmpereOne AC04.
+
+	  Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
+	  direct read of the register will return a value of 0xf8. An incorrect
+	  value from a direct read can only happen with the value 0xf0.
+
+	  The workaround for the erratum will do logical AND 0xf0 to the
+	  value read from ICC_PMR_EL1 register before returning the value.
+
 	  If unsure, say Y.
 
 config ARM64_WORKAROUND_CLEAN_CACHE
diff --git a/arch/arm64/include/asm/arch_gicv3.h b/arch/arm64/include/asm/arch_gicv3.h
index 9e96f024b2f1..299d7e17abdf 100644
--- a/arch/arm64/include/asm/arch_gicv3.h
+++ b/arch/arm64/include/asm/arch_gicv3.h
@@ -127,7 +127,7 @@ static inline void gic_write_bpr1(u32 val)
 
 static inline u32 gic_read_pmr(void)
 {
-	return read_sysreg_s(SYS_ICC_PMR_EL1);
+	return read_sysreg_pmr();
 }
 
 static __always_inline void gic_write_pmr(u32 val)
diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index fbb5c99eb2f9..022a3640d584 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -22,8 +22,7 @@
 static inline void local_daif_mask(void)
 {
 	WARN_ON(system_has_prio_mask_debugging() &&
-		(read_sysreg_s(SYS_ICC_PMR_EL1) == (GIC_PRIO_IRQOFF |
-						    GIC_PRIO_PSR_I_SET)));
+		(read_sysreg_pmr() == (GIC_PRIO_IRQOFF | GIC_PRIO_PSR_I_SET)));
 
 	asm volatile(
 		"msr	daifset, #0xf		// local_daif_mask\n"
@@ -46,7 +45,7 @@ static inline unsigned long local_daif_save_flags(void)
 
 	if (system_uses_irq_prio_masking()) {
 		/* If IRQs are masked with PMR, reflect it in the flags */
-		if (read_sysreg_s(SYS_ICC_PMR_EL1) != GIC_PRIO_IRQON)
+		if (read_sysreg_pmr() != GIC_PRIO_IRQON)
 			flags |= PSR_I_BIT | PSR_F_BIT;
 	}
 
diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index d4d7451c2c12..757e7e837992 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -30,7 +30,7 @@ static __always_inline void __daif_local_irq_enable(void)
 static __always_inline void __pmr_local_irq_enable(void)
 {
 	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
-		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
+		u32 pmr = read_sysreg_pmr();
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
 
@@ -59,7 +59,7 @@ static __always_inline void __daif_local_irq_disable(void)
 static __always_inline void __pmr_local_irq_disable(void)
 {
 	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
-		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
+		u32 pmr = read_sysreg_pmr();
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
 
@@ -84,7 +84,7 @@ static __always_inline unsigned long __daif_local_save_flags(void)
 
 static __always_inline unsigned long __pmr_local_save_flags(void)
 {
-	return read_sysreg_s(SYS_ICC_PMR_EL1);
+	return read_sysreg_pmr();
 }
 
 /*
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f1bb0d10c39a..9033110a4589 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1223,6 +1223,15 @@
 	par;								\
 })
 
+#define read_sysreg_pmr() ({						\
+	u64 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);			\
+	asm(ALTERNATIVE("nop", "and %0, %0, #0xf0",			\
+			ARM64_WORKAROUND_AMPERE_AC03_CPU_50)		\
+			: "+r" (pmr)					\
+			);						\
+	pmr;								\
+})
+
 #define SYS_FIELD_VALUE(reg, field, val)	reg##_##field##_##val
 
 #define SYS_FIELD_GET(reg, field, val)		\
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 59d723c9ab8f..9eec9977ee21 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -564,6 +564,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
 };
 #endif
 
+#ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_50
+static const struct midr_range erratum_ac03_cpu_50_list[] = {
+	MIDR_ALL_VERSIONS(MIDR_AMPERE1),
+	MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+	{},
+};
+#endif
+
 const struct arm64_cpu_capabilities arm64_errata[] = {
 #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
 	{
@@ -905,6 +913,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = has_impdef_pmuv3,
 		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
 	},
+#ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_50
+	{
+		.desc = "AmpereOne erratum AC03_CPU_50",
+		.capability = ARM64_WORKAROUND_AMPERE_AC03_CPU_50,
+		ERRATA_MIDR_RANGE_LIST(erratum_ac03_cpu_50_list),
+	},
+#endif
 	{
 	}
 };
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 5ae2a34b50bd..6d76f79335a0 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -317,6 +317,9 @@ alternative_if_not ARM64_HAS_GIC_PRIO_MASKING
 alternative_else_nop_endif
 
 	mrs_s	x20, SYS_ICC_PMR_EL1
+alternative_if ARM64_WORKAROUND_AMPERE_AC03_CPU_50
+	and	x20, x20, #0xf0
+alternative_else_nop_endif
 	str	w20, [sp, #S_PMR]
 	mov	x20, #GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET
 	msr_s	SYS_ICC_PMR_EL1, x20
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 10effd4cff6b..de34e36c79ee 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -96,6 +96,7 @@ WORKAROUND_2645198
 WORKAROUND_2658417
 WORKAROUND_AMPERE_AC03_CPU_38
 WORKAROUND_AMPERE_AC04_CPU_23
+WORKAROUND_AMPERE_AC03_CPU_50
 WORKAROUND_TRBE_OVERWRITE_FILL_MODE
 WORKAROUND_TSB_FLUSH_FAILURE
 WORKAROUND_TRBE_WRITE_OUT_OF_RANGE
-- 
2.43.0

