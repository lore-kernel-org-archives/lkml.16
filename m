Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D2E1B415F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 11:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745666603; cv=none; b=ZNGOjQUO3po3dCADPsvBkaAvY075AHXJIcpAJ43FRbaUkBSNUAIGXU24YqT3a8KauVxEgZXkFX0msJLSzj1uwjl0sFoiGKs2aaWWdDvQEyqepJbUoGIe+xlwYglJfTeT7+Z4zqCyy6DMbbesyAjI9sJ1Vq9wi1F38JRF4WxTm40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745666603; c=relaxed/simple;
	bh=x3i4HzMbO44Q7jrUgJieySTzyi/c10pYmwrR/Byr1x0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cONTUsh97anoLf1eytLAn39keorhPTPuoVKBdoMdCQEeqmG1/tyfVkYdZG3zaWUGBSwbGTU5uW+T+cBLol2IsD3X/uiQqHuC0fheEmqJ4DXWRvlMdygIQPv0Sq4tISNwXjblTzPpp/Ste6X9Lw/FNL9VpRDlUjdl/sF9sEFtVXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PNaohYDP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PNaohYDP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0FBD840E01F6;
	Sat, 26 Apr 2025 11:23:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fYF9eBlUI2mf; Sat, 26 Apr 2025 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745666593; bh=c9+KCKVlASN7E8rHyCzG90/PK49s8DdZ0OkQYLXM8+4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PNaohYDPHUfbFSWlDW0oYInYN2Q3osJn7hIJMSJLybZx3aL18Fp23TD1QjxNzCPBV
	 4zVIofRBMEooIMJF8fgPcMt0ttaeqGexqpSMRSwya5WTUsXwU2uPIUxCc+4Sf9xYv1
	 YubgbPQxGb50NyPaG7fuLdpHd1FcjApRtlcJVwADPXgeY/GFzTEK0JwFteXuQP0nzF
	 ly8uWcuNBy+cku4ILmGmVDyNYKZNBpkH0N1f7Hpexx2g5vqrCp5bMYeGxrDZbKj70L
	 50nonXscPVJTDvQP+yRfiscbHAR1crloQ+e638b+gXGG/ddnw89tw6Yp6jAz7Urn3z
	 Y7oJXhl/Nq+TWl0weVzn1BoXo8DVPr293LONEttR78OMCkPozt8E8BtrcNIlPl72+R
	 rR6GGjZNMx1hw6Nu/w6fmkT5OzjFdXTcUSNDGYVN7ggsbeeUgW4dph9bbYjWEtTFu+
	 701PJlYu7qxzFx0hksnC39zwddLgDiVjYRdrCmpy/biAx31yI7MRf3X8b0oIvLVX8v
	 gzAEYz3CbNQaqtT0ihqBZkaVCa914kSfowD+ddZJ7C+J+mHMGxooNcVeni6rW8euIs
	 8O1zMwqqwoB180smVo4N6e0sHIrr4lefLs8JHQCkbHR12Kvqdqd7UA+qA3iuSiiqt7
	 O5riyXCM3WykYNC/gjQomyhA=
Received: from [IPv6:::1] (unknown [IPv6:2a02:3037:20b:53e8:6ccf:ad1c:d318:e478])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6445840E0192;
	Sat, 26 Apr 2025 11:23:03 +0000 (UTC)
Date: Sat, 26 Apr 2025 14:22:56 +0300
From: Borislav Petkov <bp@alien8.de>
To: "Kaplan, David" <David.Kaplan@amd.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 03/16] x86/bugs: Restructure MMIO mitigation
User-Agent: K-9 Mail for Android
In-Reply-To: <LV3PR12MB9265EA487C377CA33F2731F594842@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com> <20250418161721.1855190-4-david.kaplan@amd.com> <20250424201918.GAaAqcxqFV0raTOOKP@renoirsky.local> <LV3PR12MB9265795E7CF35195B7FE02A594852@LV3PR12MB9265.namprd12.prod.outlook.com> <20250425080946.GBaAtDShGzNQqi30vr@renoirsky.local> <LV3PR12MB9265EA487C377CA33F2731F594842@LV3PR12MB9265.namprd12.prod.outlook.com>
Message-ID: <320802FA-6BD0-4E3E-8812-0B8D5FB5F464@alien8.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 4:28:14 PM GMT+03:00, "Kaplan, David" <David=2EKaplan@amd=
=2Ecom> wrote:
>It was the intent to imply that=2E  If you look at patch 1, 2, and 4 then=
 if verw_mitigation_selected is ever set to true, it means that some mitiga=
tion is going to force X86_FEATURE_CLEAR_CPU_BUF=2E

Aaaand the other shoe dropped=2E=2E=2E

>Maybe the solution here is to clarify the comment above verw_mitigation_s=
elected that it is set if any of those 4 bugs are going to enable X86_FEATU=
RE_CLEAR_CPU_BUF=2E  So it implies that specific VERW-based mitigation=2E
>
>Or perhaps I could even rename the variable to be 'clear_cpu_buf_selected=
'?

Right, I think both should be the optimal thing as it would make it crysta=
l clear=2E

>I think clarifying what verw_mitigation_selected means is better=2E  When=
 that becomes clear, I think that the existing comments make sense=2E
>

Ok, all clear=2E

But you don't have to resend an updated set - I'll fix that up while apply=
ing=2E

Thx=2E


--=20
Sent from a small device: formatting sucks and brevity is inevitable=2E 
