Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD7288539
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623405; cv=none; b=odb61rxKIxd1gl6+zXuL0bRNXmCRUSApG34yEhk82gUXhBV6h7eGCbBVvPwN/pfR5WTG4I2M2WkFwaFGiupVS++5w8LVUMDN42unrjVLddzbeTYQ6gSHOIsMk2vnXFrf3XdPdwfyIB3AdchOTIewprlERJyuCh90ElBzVX/1WRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623405; c=relaxed/simple;
	bh=KuFq/zeYni8KgGdHJD2LlQeGitZ5AOvXBhl3se89MLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfLsEwCJNakSeUFJDQ85T2dlVMnIvJR/9Ti/g5AsEZCEXz1p+x1gzp1bU651qL/9DtaYz3UupO9zbQSSaddIUFp76uemWhdWFBZyI9xJahRbEBqkb+0oRt4cWWjiWp+GCf+WCAUxKXBaPxcdlT6scEFQBPTyhJ5aXlCkSpHFoyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V4G4vKaz; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V4G4vKaz"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-601a99977faso437366eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623402; x=1747228202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuFq/zeYni8KgGdHJD2LlQeGitZ5AOvXBhl3se89MLw=;
        b=V4G4vKazuN6HeSTCPzxtc6q8INx9Kg8WgiFT1J0bOb54fIMeaV+JUr2bAEpDzNMzAV
         zYqWlKUwdemdD20nnkXJf8fVc+KtwRp1ITt1dTh6zJ5I1GubdGnfBuIv0IzGWl+0rl7O
         NSpJhH6gWg6qMR/NJwim6rJ+ZWDT9+uY1qj6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623402; x=1747228202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuFq/zeYni8KgGdHJD2LlQeGitZ5AOvXBhl3se89MLw=;
        b=HpewvwuIPGJvFsS5CU/eIAydU2t8ihVqOpoUH1QalxsH8RLQ3Bcxd2jt+85OKHmriY
         oLeUXMK1SeC9JuQNrAjzkIxugMIpgKUlGBEBjBHoI9pVJrdQDkJpneNTuFuUnpsnck/t
         Z9x+4bWa8/ZQ8l/fdCICNsZu+cgvPxpUraKuVQ9GylQhmNmHbhe03yJgi6RP71I8jA+0
         vcT/RzswbGXG2wUxWBZij6wVS8XOPycEWoysZF/iaEESM1qhxshhGgN4DlnlGFmoVNuB
         drtF97k+76heG/bhUSsp+ZUtt0lCxyK6CoPx3vdz7ucEYGlVeXPV/K3K3MEozqP0rFgv
         C7tw==
X-Forwarded-Encrypted: i=1; AJvYcCXTZMcrcBiwanUdC5A4JkEUXidfOMEUA2V/I9osFCXBwjTEUjuHW1+UKdVyqLDlIZTF8Xa0WKstlAOKWUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwszwpEILiLmjQCdBwwjeARGPcw1TnYBjzTEKWVjKs9fd7WzD1C
	llgzIutPsDgC0yP1B7KwhtGCFnzSLEH3sz9hiCodkxOigneFyLOZm3tuJqaOIX8sB/8pDOuQkgN
	Y6IVhGhYva9SL9filNEjK4MMwahSG6m4KTMQ+
X-Gm-Gg: ASbGncunHvZPI/YWGCoWtaHw00LphT5CDJZylOFzlVmqU+lP93DO1MlRJQvDSRRbQhp
	n4vgFIvYwjQf6NXI6jN8ChUt1j8XrIZcQ9eRjGDAGi2j9o6ALiXiwSG/JnHY5/wWmA5QgC5Dusa
	QCTZQ6nHojxNyHQxN1vl9SF6Gmwf1ZCQ1udBotRxtBnttTpleV4w==
X-Google-Smtp-Source: AGHT+IFMCSz+DMkX+SXzsy6oBemggwRgx2rch6Bt53f4enSvSdPuMeC4mItCR5WNmCzwmoMolNdmuYo2j8u88K68g3A=
X-Received: by 2002:a4a:e203:0:b0:607:de7b:aa0b with SMTP id
 006d021491bc7-60828d094camr495455eaf.1.1746623402327; Wed, 07 May 2025
 06:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506095224.176085-1-revest@chromium.org> <aBoP9ILEv-z4bRAQ@finisterre.sirena.org.uk>
In-Reply-To: <aBoP9ILEv-z4bRAQ@finisterre.sirena.org.uk>
From: Florent Revest <revest@chromium.org>
Date: Wed, 7 May 2025 15:09:50 +0200
X-Gm-Features: ATxdqUGqHGfM-ERnuNPXYXI2S2k9wJ40t1n7VxMcXPLGzQ6yF7PJYBq-4YriJMo
Message-ID: <CABRcYmKqCVn7NbrXocyzmYif_ihkeOCvPHZ+jxMi3OPWs6EiTg@mail.gmail.com>
Subject: Re: [PATCH 0/4] mm: Avoid sharing high VMA flag bits
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	akpm@linux-foundation.org, thiago.bauermann@linaro.org, jackmanb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 3:34=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, May 06, 2025 at 11:52:20AM +0200, Florent Revest wrote:
>
> > While staring at include/linux/mm.h, I was wondering why VM_UFFD_MINOR =
and
> > VM_SHADOW_STACK share the same bit on arm64. I think I gained enough co=
nfidence
> > now to call it a bug.
>
> Yes, it's a bug - it'll be an add/add conflict with those coming in via
> different trees.

Thanks for the review Mark! :)

I just want to make sure I fully understand the point you're making
here, it seems that you are suggesting that 7677f7fd8be7
("userfaultfd: add minor fault registration mode") and ae80e1629aea
("mm: Define VM_SHADOW_STACK for arm64 when we support GCS") came in
from two different trees and independently chose to use the same bit
around the ~same time, is that right ? And that a conflict would have
appeared when they'd eventually get merged into a shared tree ?

I don't think that's what happened in this specific case though. As
far as I can tell, the former was merged in 2021 and the latter was
merged in late 2024. Also, since the hunks got added in very different
parts of include/linux/mm.h, I don't think they caused a noticeable
merge conflict. But I agree it would probably be preferable if these
cases would cause some sort of noticeable merge conflict in the future
...

I'll quickly respin this series to address my typos on patch 4 (sigh)
and add your Reviewed-by tag but just to be clear, my refactorings in
patches 2/3/4 currently focus on using VM_HIGH_ARCH macros
consistently, to make it a bit more obvious to a reader if two
features choose the same bit. But maybe what we would really need
instead is a more obvious way for these bits to be mutually exclusive
and to cause merge conflicts if they get added through independent
trees ? For example, my colleague Brendan Jackman suggested using an
enum for VMA flags bit offsets but I'm not sure what the sentiment is
around that.
