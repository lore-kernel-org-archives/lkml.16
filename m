Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0E1F463E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212521; cv=none; b=L0NblOf/RewP2nRD0VCWFuUD8ZQbGgjTmSHaglxaDa0Sw6P6TvDcMlFLv1j0bsuo3auzCkkGoLqQdgqM4zivWyhH2XQSpNPiXs7zvoedumE4dKGfs92bUoqiKiI/IxKJ2WBpSed0AgzaFfWFEnqxM2ncC6w9631K86Pvp7rpvOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212521; c=relaxed/simple;
	bh=avqQSRJSEroG0tqAaJw09CSQdVwaSimS+bsqxI0CeJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbI+oRoEu7G96tpE61SJolR/oYVx/G9SzQADFDBFqpUXrwVLR/9p/+1rqJsFHqgzeVZFjfO4QONAhi4BSFtoyCSMt/sVV01+UEpQhMmZMfGkWYPXbZF6WpM/jWofvPw/ydvy8jL1pM+wHXe6iWAweGZjhDWGXftAFDB/h8BKxkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NfnXgj4Z; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NfnXgj4Z"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47190a013d4so13091cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739212518; x=1739817318; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn3fvDD0KxaOtVhv2mPaCVEYyhy/9mxAXhWbYqpsYPA=;
        b=NfnXgj4Z4J5SwH3TEatRrYWo+HHf/cnU/KEok8yI0VIWM7DDY3jI8yyP6oxQrt0C5k
         4PV2sdFz6MtfUicJ/Uj/eQsX6rk0In3W+giJO6rZzcr0I1O+yFnnlyDfIt9y38NXIxSr
         iJD/A2rfRIJxSpl5VBZI9mjpW9HmsCDOP91w9J8g+mDLMPz+rOvDnZG5FNVhyA1+Wu9c
         5s7Gc+fTgaJJlrYlCRHV18+Te7+6cwbHG0MR9kLXdVbonrvTeYBwPGyAzyo7O8PnqKVf
         F/KVWpJ2jIY+HDiEfkRu8dqz88ws51U7ul+IQt3Rvgt3d1LQwb+A8THme/CAa6PTjVCb
         4saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212518; x=1739817318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bn3fvDD0KxaOtVhv2mPaCVEYyhy/9mxAXhWbYqpsYPA=;
        b=N4PsxqRhIATnAValgdL6HxpzJhK9J2aCbYEG0k0rqpOrHsXKZBBlv+tH8oE2kB2rc2
         u5azPM1Pt3TVF1mefcHzn5bD8/qgyOcQDJXUTSIPYmKXMzuPTXIos6fzdNSOLDWJUgNU
         NeUhpo9/ly5nnVe86fvUhv7uEjWV5mGC6QGCet5wCxJGv8b/vbHXKks5sj/N+zPoPsrA
         7/GOsilEnWeoAuFF4hMDCVGEF9fsxl9eAOHM0im9hlxyeC890u+hDna/xOHTsJKyVrMJ
         1YwFvW1AjPju3k2oxcLQLlToWpABtIokBq/f1xcSs+XDMOZTu30YTZqeKgfKW8goocFJ
         +EZg==
X-Forwarded-Encrypted: i=1; AJvYcCWIzYbgQGZldBeVQTZTyjfowTxkVAX9kh54RU/WlUsDrQ01JIyO3G+3MdLUeojr24WqZa2t6Ii+ki3ADSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSzvCtLYDt2tQaH5tImrzX4oVJ5VSBilx7/DRcIi0EwHWFEbzt
	o5ufcATJiYEbaoySmPgRxyVRSWWvbfMWk5aLlFOXcKBevnnVowfpQ+hb4/B8pp0MZWNxxsvl8bf
	86RpuOJg/s0XVOlb7FI2+o0tc/aKLZ/eOqh9b
X-Gm-Gg: ASbGncu8IcopA00SWllpWMLSd+770NAblm0HrhF87/3MXt+DBium19lVNZ1E724AT7L
	CrLvz+5T6xBlBN+mAOFr7GUMgYDMXSg4dt9a6HW4jj+WvEsvedPEJ8BKg5ZSX/2WvEzxdRvAIWH
	PIfMgbYEYH7EEZc3VTfNmMFcljaRI=
X-Google-Smtp-Source: AGHT+IFYTuZ5gMDfSRRThaiRe7sPk5kdq+JcDi/uR9332gTpXmzRLnViELOvZFwoksS3SXFrxEuYT4kFVNR4ugMVjMY=
X-Received: by 2002:a05:622a:5792:b0:467:7c30:3446 with SMTP id
 d75a77b69052e-47177eec877mr7497321cf.25.1739212518441; Mon, 10 Feb 2025
 10:35:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108202515.385902-1-david.kaplan@amd.com> <20250108202515.385902-13-david.kaplan@amd.com>
In-Reply-To: <20250108202515.385902-13-david.kaplan@amd.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 19:35:06 +0100
X-Gm-Features: AWEUYZnA_ITQ8lH_DVafuiHdA7IzJ0QqiprWf0gvBbQbWm0TW3f_WIU58Mvi7L4
Message-ID: <CA+i-1C0KpYA3BaPQb--AjRcZU5mi-Mk=kxpG3jy_TKufn+rk7A@mail.gmail.com>
Subject: Re: [PATCH v3 12/35] x86/bugs: Restructure retbleed mitigation
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 21:29, David Kaplan <david.kaplan@amd.com> wrote:
> @@ -1827,16 +1821,6 @@ static void __init spectre_v2_select_mitigation(void)
>                         break;
>                 }
>
> -               if (IS_ENABLED(CONFIG_MITIGATION_IBRS_ENTRY) &&
> -                   boot_cpu_has_bug(X86_BUG_RETBLEED) &&
> -                   retbleed_cmd != RETBLEED_CMD_OFF &&
> -                   retbleed_cmd != RETBLEED_CMD_STUFF &&
> -                   boot_cpu_has(X86_FEATURE_IBRS) &&
> -                   boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
> -                       mode = SPECTRE_V2_IBRS;
> -                       break;
> -               }
> -
>                 mode = spectre_v2_select_retpoline();
>                 break;

It isn't quite clear why this gets removed here. Doesn't
retbleed_update_mitigation() still depend on this?

It gets added back in 15/35 so this would be at most a problem of git history.
