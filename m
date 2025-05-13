Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4DA2BF3FB;
	Tue, 13 May 2025 17:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158547; cv=none; b=E1noe4H6apS0M+RZjuTM0HB7YEnu6FruNtrsFxzBibPd7GAkDWrUXecbjxJondusYOriE+jv178mVFqrwKrIWauvEtH0t+arCmVEMLG69Iyho12hZ3FroMmRqXU9eOOfTw5h404L9NB3k4ScWNcFeHolP5vILfvxgXuFeKgF6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158547; c=relaxed/simple;
	bh=TKQK8GoEwy/8hJIA6ufdWICLhui0GNP8/o66zKn5hOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=picYUiPfHzHIB7q6E4GJRNWQc4n2LgXioz6BLXYBwiaq/tMw5KGsr9TAVByePcTGYduE5RSLyCWIEHymRrrktGoeKJVFyxHBoEnjD7COE3xyL4REKYBUnMQ4G+P1AsHry+4oQM4hZa50+oo8vnqDGtw1PY+YysTNCCXAzpRd1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMbdVoj/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMbdVoj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657ABC4CEE4;
	Tue, 13 May 2025 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158545;
	bh=TKQK8GoEwy/8hJIA6ufdWICLhui0GNP8/o66zKn5hOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dMbdVoj/pJnN9VNeHraBwPR3CRQj+bAyHyZ8zhL1ZoaI8EpKidJSi+bVZ2eD5xBRa
	 CeaGf3GITCxQ85rlJFqnLRBWr3xOTbykmh6pmeEqZGPyuE1D632YFd3Ye104Yduja1
	 Rr4pzzMN6ZNR95QYUjlb3NI/Z8EiPtnuXCbWmOpBTYVCbjoe2NPVJ1+OYZTRtqgOJ0
	 YcCzErTk3lp40LW4GhcUe3mzOkePeBJ05cwAw3SAkgmlnEnoH6hJ04yE9enyh/WEM6
	 Cwlgadr3GotQcuzAvnGKPWG35ngUBegQM14M6oH1nTC5o+4ncnFUDnNYRU6kcPH8pc
	 rQt7sfBXcesRQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:01 +0200
Subject: [PATCH v4 08/26] arm64/sysreg: Add ICC_PPI_{C/S}PENDR<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-8-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

Add ICC_PPI_{C/S}PENDR<n>_EL1 registers description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 88be22eb1d9feffba0ac28ad983f589ed80c905b..004c5b250faba742a0d5e195eeade822a8ad713f 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2557,6 +2557,89 @@ Sysreg	ICC_PPI_SACTIVER1_EL1	3	0	12	13	3
 Fields ICC_PPI_ACTIVERx_EL1
 EndSysreg
 
+SysregFields	ICC_PPI_PENDRx_EL1
+Field	63	Pend63
+Field	62	Pend62
+Field	61	Pend61
+Field	60	Pend60
+Field	59	Pend59
+Field	58	Pend58
+Field	57	Pend57
+Field	56	Pend56
+Field	55	Pend55
+Field	54	Pend54
+Field	53	Pend53
+Field	52	Pend52
+Field	51	Pend51
+Field	50	Pend50
+Field	49	Pend49
+Field	48	Pend48
+Field	47	Pend47
+Field	46	Pend46
+Field	45	Pend45
+Field	44	Pend44
+Field	43	Pend43
+Field	42	Pend42
+Field	41	Pend41
+Field	40	Pend40
+Field	39	Pend39
+Field	38	Pend38
+Field	37	Pend37
+Field	36	Pend36
+Field	35	Pend35
+Field	34	Pend34
+Field	33	Pend33
+Field	32	Pend32
+Field	31	Pend31
+Field	30	Pend30
+Field	29	Pend29
+Field	28	Pend28
+Field	27	Pend27
+Field	26	Pend26
+Field	25	Pend25
+Field	24	Pend24
+Field	23	Pend23
+Field	22	Pend22
+Field	21	Pend21
+Field	20	Pend20
+Field	19	Pend19
+Field	18	Pend18
+Field	17	Pend17
+Field	16	Pend16
+Field	15	Pend15
+Field	14	Pend14
+Field	13	Pend13
+Field	12	Pend12
+Field	11	Pend11
+Field	10	Pend10
+Field	9	Pend9
+Field	8	Pend8
+Field	7	Pend7
+Field	6	Pend6
+Field	5	Pend5
+Field	4	Pend4
+Field	3	Pend3
+Field	2	Pend2
+Field	1	Pend1
+Field	0	Pend0
+EndSysregFields
+
+Sysreg	ICC_PPI_CPENDR0_EL1	3	0	12	13	4
+Fields ICC_PPI_PENDRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_CPENDR1_EL1	3	0	12	13	5
+Fields ICC_PPI_PENDRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_SPENDR0_EL1	3	0	12	13	6
+Fields ICC_PPI_PENDRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_SPENDR1_EL1	3	0	12	13	7
+Fields ICC_PPI_PENDRx_EL1
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0

