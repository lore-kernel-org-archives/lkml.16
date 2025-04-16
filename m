Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE951AB6C8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786682; cv=none; b=bGbOcgbzqd/q04JzEc4Jw/E0k7ObGInHIP3BZu8MIbILCBx/UjPn+R9d4uL30jEyPMmSIukLUWUusM3/bdOo8GFqPGUj/aZ83QZdU4r1wysMbt7m/4CQq0bSRewMSHLFLtAbg7SoNRozI8Fff3JPW69T9DIcwkhpe1gowwsYK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786682; c=relaxed/simple;
	bh=P8T2qeKO3f7ebu/srqrztLdowWqoaHPHvUqe06WId0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKobDPoTp0ujicAbKnwiYEXBaE+QF2B3Q8L6qxrY9mOBGmw5z3aPbMycT9KtUVk+eaS6ryuH54bfsjVfEbza+OietdX+2tfp7+cy1rJo+mv20ilxiBN67ahb6Nvxegzeh5IPDBF85Bu+fvRjUb8o0GKl47bqlc0TzQm9S3edrHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH561frL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH561frL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54954fa61c9so7789572e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744786677; x=1745391477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3eFYkiEenzg/4pej5bcdOHyZ5zn5C2EU9yY/WMDy+oU=;
        b=eH561frL8QLyY6kT6vMrSMqwxRXWislw7L5JzwEE/hDMFj0kpfetLSP4Dj/M/sa1ee
         CrNq7+xNabZxOoggNRWF3uSva5B4fdeLMM0ucHKupRUJ1VdkxoXliCCZQDkv/e6HXGMV
         lswhoCGsnHvmJWLZE6qxF6p/byjbD4PjdU9jgr4hOHwRxU/cu0sQEpsEmoNEfXEGihAb
         iRmtAOGeqTQlxiyMjQ6hPx+SfQjNgzn1Ws8PTGs8GxTJoc+dLkjgbmbkMHAgAUWBn+Vp
         2pBu1YjkArNkepTfRrySSdqi2dlKU4l93fjr5HRQH8xplRMFofqbnJIfcyrlB6YTivei
         yN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744786677; x=1745391477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eFYkiEenzg/4pej5bcdOHyZ5zn5C2EU9yY/WMDy+oU=;
        b=G6VXX9VRXWgpvMs43L/S9D7udSyjruwGqLA2x8ans7HNYKcgpuYwGPp4oZRObzJvfa
         /FFexz2tQimkWdRVUodrzH6KjVOLbt9sTjEFfqabZw9bJaMQa2zm2EyB5QFwB9g90b1O
         Ub3pT3RVC2AvvbHKkvAfaeKl2xhZFMeTgmz2MmwbLiAWtRt1QFseeaq76HJtBBXfJO+F
         fWgyrKEJO9zWq2JAcYDydq2wygGoa13tdaAbkyp912JPsXiC2L222BjJ64i2EkJ/ZtGu
         xyjO7BWUZKsvUhHb0JwBC+EAYtCRn318XygPG9QQVFMgXNrC0H8D17C5KAcXM/eX1Iwd
         xCgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCerG0KZY9K1pWUiOnnMBhXNK/Rxbk4LxF/5XrU7FGmUpkKfsoUVIy6SXZ318iLucWexGp6qlUMLVEx/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTt+gOVVtyvPfuojzfZ7yiUZwYinTjyOtpZh8CLajYrUdtm5qi
	hrx4jbq4XVOK/saNt06Oyf6QDRyAyoX7g672NZi53YM9XPrI9tnNLeHSUY2dcU6s3wCiuW9OvNA
	DnJ9Y/8NiCvXktIR0WarolzehwIA=
X-Gm-Gg: ASbGncuNThWZkMXdn8a96jb7pYlfeob8sxK7vA4IkoH4BTZNLtcwnQYhzLVDMQpZlHw
	+5q3q5CccGqCvz7aZ3L519vozlj/GtILGVhKtf+T6mA6DNNyWs+dvnQcN9cW6d9V10/V7hfokd5
	qxdUNsUGRxR924hADEa/3I+Q==
X-Google-Smtp-Source: AGHT+IGDG8EQyu2e91PlMcGHXOQUUS2M/UX2zORD22uy6GUwCCzWVy4INZkGFxhlM4V0q+NcTSO0+g+TDefdHJold44=
X-Received: by 2002:a05:6512:ac8:b0:54a:f7fb:ff82 with SMTP id
 2adb3069b0e04-54d64aa9f8amr176461e87.26.1744786677184; Tue, 15 Apr 2025
 23:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414145650.10776-1-ubizjak@gmail.com> <20250415185558.112621df@pumpkin>
 <CAFULd4YV0yKTULPM-+Y0b72EJ48tqfW_ni8RjHsQTULT8TGaTQ@mail.gmail.com>
In-Reply-To: <CAFULd4YV0yKTULPM-+Y0b72EJ48tqfW_ni8RjHsQTULT8TGaTQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 16 Apr 2025 08:57:45 +0200
X-Gm-Features: ATxdqUExvVnEnRY0cmxDSz2Qf3qDtQT8dPVM3sFFqvWDSsanRiYI8WlkpkYb-0w
Message-ID: <CAFULd4ZtMrj+5Le0GArm5eTLw1AYiWLXPb_nXKaMDHy8TW60wA@mail.gmail.com>
Subject: Re: [PATCH] um/asm: Replace "REP; NOP" with PAUSE mnemonic
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-um@lists.infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: multipart/mixed; boundary="0000000000001a60c40632dfce69"

--0000000000001a60c40632dfce69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 7:53=E2=80=AFAM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Tue, Apr 15, 2025 at 7:56=E2=80=AFPM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Mon, 14 Apr 2025 16:55:57 +0200
> > Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > > Current minimum required version of binutils is 2.25,
> > > which supports PAUSE instruction mnemonic.
> > >
> > > Replace "REP; NOP" with this proper mnemonic.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > > Cc: Richard Weinberger <richard@nod.at>
> > > Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> > > Cc: Johannes Berg <johannes@sipsolutions.net>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Ingo Molnar <mingo@kernel.org>
> > > Cc: Borislav Petkov <bp@alien8.de>
> > > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > > ---
> > >  arch/x86/um/asm/processor.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/x86/um/asm/processor.h b/arch/x86/um/asm/processor.=
h
> > > index 478710384b34..233a7a0d29c9 100644
> > > --- a/arch/x86/um/asm/processor.h
> > > +++ b/arch/x86/um/asm/processor.h
> > > @@ -24,7 +24,7 @@
> > >  /* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. *=
/
> > >  static __always_inline void rep_nop(void)
> > >  {
> > > -     __asm__ __volatile__("rep;nop": : :"memory");
> > > +     __asm__ __volatile__("pause": : :"memory");
> > >  }
> > >
> >
> > That only makes sense if you also change the function name.
>
> This function is used in several places, and is also defined for x86
> in arch/x86/include/asm/vdso/processor.h. The renaming should be
> coordinated with x86 and should definitely be a separate patch.

Something like the attached patch that also moves (duplicated)
function definition to a shared place.

Uros.

--0000000000001a60c40632dfce69
Content-Type: text/plain; charset="US-ASCII"; name="pause.diff.txt"
Content-Disposition: attachment; filename="pause.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m9jkxe900>
X-Attachment-Id: f_m9jkxe900

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NwZWNpYWxfaW5zbnMuaCBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3NwZWNpYWxfaW5zbnMuaAppbmRleCA2MjY2ZDZiOWUwYjguLjU5YmQy
NWFjNzI5MiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vc3BlY2lhbF9pbnNucy5o
CisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NwZWNpYWxfaW5zbnMuaApAQCAtMTE1LDYgKzEx
NSwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd3Jwa3J1KHUzMiBwa3J1KQogfQogI2VuZGlmCiAK
Ky8qIFBBVVNFIGlzIGEgZ29vZCB0aGluZyB0byBpbnNlcnQgaW50byBidXN5LXdhaXQgbG9vcHMu
ICovCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgbmF0aXZlX3BhdXNlKHZvaWQpCit7CisJ
YXNtIHZvbGF0aWxlKCJwYXVzZSI6IDogOiJtZW1vcnkiKTsKK30KKwogc3RhdGljIF9fYWx3YXlz
X2lubGluZSB2b2lkIHdiaW52ZCh2b2lkKQogewogCWFzbSB2b2xhdGlsZSgid2JpbnZkIjogOiA6
Im1lbW9yeSIpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNz
b3IuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKaW5kZXggYzliMmJh
N2E5ZWM0Li4xNjkyMTk4NjRkNjEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zk
c28vcHJvY2Vzc29yLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3Iu
aApAQCAtNywxNSArNywxMSBAQAogCiAjaWZuZGVmIF9fQVNTRU1CTEVSX18KIAotLyogUkVQIE5P
UCAoUEFVU0UpIGlzIGEgZ29vZCB0aGluZyB0byBpbnNlcnQgaW50byBidXN5LXdhaXQgbG9vcHMu
ICovCi1zdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgcmVwX25vcCh2b2lkKQotewotCWFzbSB2
b2xhdGlsZSgicmVwOyBub3AiIDo6OiAibWVtb3J5Iik7Ci19CisjaW5jbHVkZSA8YXNtL3NwZWNp
YWxfaW5zbnMuaD4KIAogc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGNwdV9yZWxheCh2b2lk
KQogewotCXJlcF9ub3AoKTsKKwluYXRpdmVfcGF1c2UoKTsKIH0KIAogc3RydWN0IGdldGNwdV9j
YWNoZTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9hcGljL2lvX2FwaWMuYyBiL2FyY2gv
eDg2L2tlcm5lbC9hcGljL2lvX2FwaWMuYwppbmRleCBlZWJjMzYwZWQxYmIuLmJhNWE0Y2NkYTM3
YSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2FwaWMvaW9fYXBpYy5jCisrKyBiL2FyY2gv
eDg2L2tlcm5lbC9hcGljL2lvX2FwaWMuYwpAQCAtMTQ4Niw3ICsxNDg2LDcgQEAgc3RhdGljIHZv
aWQgX19pbml0IGRlbGF5X3dpdGhfdHNjKHZvaWQpCiAJICogMSBHSHogPT0gNDAgamlmZmllcwog
CSAqLwogCWRvIHsKLQkJcmVwX25vcCgpOworCQluYXRpdmVfcGF1c2UoKTsKIAkJbm93ID0gcmR0
c2MoKTsKIAl9IHdoaWxlICgobm93IC0gc3RhcnQpIDwgNDAwMDAwMDAwMDBVTEwgLyBIWiAmJgl0
aW1lX2JlZm9yZV9lcShqaWZmaWVzLCBlbmQpKTsKIH0KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2xp
Yi9kZWxheS5jIGIvYXJjaC94ODYvbGliL2RlbGF5LmMKaW5kZXggZTg2ZWRhMmMwYjA0Li5lYjJk
MmUxY2JkZGQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2xpYi9kZWxheS5jCisrKyBiL2FyY2gveDg2
L2xpYi9kZWxheS5jCkBAIC03NSw3ICs3NSw3IEBAIHN0YXRpYyB2b2lkIGRlbGF5X3RzYyh1NjQg
Y3ljbGVzKQogCiAJCS8qIEFsbG93IFJUIHRhc2tzIHRvIHJ1biAqLwogCQlwcmVlbXB0X2VuYWJs
ZSgpOwotCQlyZXBfbm9wKCk7CisJCW5hdGl2ZV9wYXVzZSgpOwogCQlwcmVlbXB0X2Rpc2FibGUo
KTsKIAogCQkvKgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvdW0vYXNtL3Byb2Nlc3Nvci5oIGIvYXJj
aC94ODYvdW0vYXNtL3Byb2Nlc3Nvci5oCmluZGV4IDQ3ODcxMDM4NGIzNC4uMzFkNzExOTg3Nzhl
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni91bS9hc20vcHJvY2Vzc29yLmgKKysrIGIvYXJjaC94ODYv
dW0vYXNtL3Byb2Nlc3Nvci5oCkBAIC0xOSwyMSArMTksMTYgQEAKICNkZWZpbmUgQVJDSF9JU19T
VEFDS0dST1coYWRkcmVzcykgXAogICAgICAgIChhZGRyZXNzICsgNjU1MzYgKyAzMiAqIHNpemVv
Zih1bnNpZ25lZCBsb25nKSA+PSBVUFRfU1AoJmN1cnJlbnQtPnRocmVhZC5yZWdzLnJlZ3MpKQog
CisjaW5jbHVkZSA8YXNtL3NwZWNpYWxfaW5zbnMuaD4KICNpbmNsdWRlIDxhc20vdXNlci5oPgog
Ci0vKiBSRVAgTk9QIChQQVVTRSkgaXMgYSBnb29kIHRoaW5nIHRvIGluc2VydCBpbnRvIGJ1c3kt
d2FpdCBsb29wcy4gKi8KLXN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCByZXBfbm9wKHZvaWQp
Ci17Ci0JX19hc21fXyBfX3ZvbGF0aWxlX18oInJlcDtub3AiOiA6IDoibWVtb3J5Iik7Ci19Ci0K
IHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBjcHVfcmVsYXgodm9pZCkKIHsKIAlpZiAodGlt
ZV90cmF2ZWxfbW9kZSA9PSBUVF9NT0RFX0lORkNQVSB8fAogCSAgICB0aW1lX3RyYXZlbF9tb2Rl
ID09IFRUX01PREVfRVhURVJOQUwpCiAJCXRpbWVfdHJhdmVsX25kZWxheSgxKTsKIAllbHNlCi0J
CXJlcF9ub3AoKTsKKwkJbmF0aXZlX3BhdXNlKCk7CiB9CiAKICNkZWZpbmUgdGFza19wdF9yZWdz
KHQpICgmKHQpLT50aHJlYWQucmVncykK
--0000000000001a60c40632dfce69--
