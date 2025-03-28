Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B641DE2D4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151878; cv=none; b=nV7jD/4/4OUPFmaPxQg+y1D9U4CRxKU9CaH5HzS2v0ASExNFAqwQl7qN+zBs+A5kANA4OtvHW63NNhtp0issFxPeACjFG8jTX+I1FcsLqOeg+8UzN3Ia76kvia4Qbr4kRdC8QbvazgZiEY9bjIa/UXMiJ4IbpALjd54Cw4HhYd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151878; c=relaxed/simple;
	bh=sZzgycLuIGtKJNzYcJv6MkL3PlMb/QFD05P+eGjKSAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWu9Uqw+sKTz4WJ6s7mlRsg2C+DxeyXtb7KxBzIj7YyhNA6xh1g9Z1nT0zzFgT02mgDwa/NMFJ7Ivo5OycuamGd0+6WjzuPf7oUy0b9FticngjrNJoLEQuqnk/gRVTZVB+l0AKggjM6ZBU2/lA2rs1Fuw5+H60Yj23THH2q9Xp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UO/uSyMy; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UO/uSyMy"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so22715036d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743151876; x=1743756676; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sZzgycLuIGtKJNzYcJv6MkL3PlMb/QFD05P+eGjKSAs=;
        b=UO/uSyMyJgFcGY50oyqU1GMb2qAn8z0IcucjoUQTgclkIqmeyvNlD+g0mv+iJNvSgt
         x+4BlrCyW02VPLqvO/fcwc0FXALm0MZxpmbrDI2478lFpv4BHU7FZKl0/5ogUb7cSYVF
         osAmZRenlOsfu9iyEv0eFJ7Cbd7jJIxEFsjb6XhZ65BtdPpKAyB+dw/RhiOA3zjHEdea
         chsabcRxbjFFJ1ft9MAmjxs0lbaMN+iutn59IqKZ7fJQNrzQFDPimDTYBP1QN3w+W5zQ
         pzgzsnyW0a9/QqlIoR0u9cbNtAy/HgiGvaTDgPPlJAN2PVxaH+m+hHD9m3vy3iQIHXsn
         yBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743151876; x=1743756676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZzgycLuIGtKJNzYcJv6MkL3PlMb/QFD05P+eGjKSAs=;
        b=a/Z1YazFtcJ/DKspqj4go7CE8IVFEtx+mABv1z8R4ptPc8K7/YrYcq5GaRw/6Iaiw4
         j+eC/ew8SX45mv7Ig49k97tQo7N92OcyDrUJY4f8GhQI0/56Av8suoLwOYDQ850MQoDp
         NkLxOoIlis0WAamNXzrdLrtvvHPHIC+M9BNde/ptOxdzJmp9v9c+lnO2GZcDTjCuWenI
         sZMuXJK51apir11xHxs6zjEfF04ft+L56iC/wYNa15sMAe/eFsTGcRENLEpaE0UPwbI9
         eJt8lMopiqgO/mA9N3xCZwNN+6cdf92vefPNqeYJBXZkWnCmC9Qi6fy83cWFhKi38OxH
         z0aw==
X-Forwarded-Encrypted: i=1; AJvYcCVS75eDjXeZ80zAmW2aTA7Xi2nXfiL70WPC88qEqfx92JFBG8nOWpsh3msMn5uQvPrJ3jrYZ8Mp9FAqn0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56ID2wXljNtFylq2xV1m9iKv+Gp5PsvDRjfzVpowPUXTEV+yg
	1qiGZJPZO9L6OoP2/Jb89u0MAQY0LVH6nopTqf2t2wpKhBngMfjzlwHk/8t1H/DlUNjDJi7CsfO
	WZXCSfioZgAPd7W+89MFmQwf84V3m4TWf62r8
X-Gm-Gg: ASbGncsUbQHSpZScDqsqGSogaa4czBxUaq5ZzvcU33fIh53KWBcGEtNXWadX0bz31lx
	LD3TCqTaSLxnYnPUKI4hZLsBFcCYNRQCaQfyXQQbzNI1jnlVTRAwUbTjUwosHjgxvReryBJiWoc
	CnaQRK7IDzYnaaJ2hOU3Ig3jjtzHkdQwQdfY7iLA==
X-Google-Smtp-Source: AGHT+IF1tllvCrEBtXzAEgoheajyUXuqGtFDk/S8EJqMSgs5UJ+i+2caS9QLLbPIZPaWJorcW321M+bhWHda7DJky8M=
X-Received: by 2002:ad4:5ae9:0:b0:6eb:1eef:c2ed with SMTP id
 6a1803df08f44-6ed238437e5mr90669286d6.9.1743151875232; Fri, 28 Mar 2025
 01:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com> <20250321111535.3740332-4-bqe@google.com>
 <Z92N8dyIE42ROW2t@thinkpad> <CANiq72kYzx7JTVqrJuP0Wo9=1qtaN7s7fqkD5DDcjA59SgMizQ@mail.gmail.com>
In-Reply-To: <CANiq72kYzx7JTVqrJuP0Wo9=1qtaN7s7fqkD5DDcjA59SgMizQ@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Fri, 28 Mar 2025 16:51:00 +0800
X-Gm-Features: AQ5f1JqV9ppdjN6FUn8YgFb3BujKbc2AWlrQmwViExipxu9UwujYSOvhAUiipTs
Message-ID: <CABVgOSkjYFwHhQfbmY83iK7crq9ZN9+93Xe514ndhAm6Me3UwQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] rust: add bitmap API.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005bde6a0631632cb3"

--0000000000005bde6a0631632cb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Mar 2025 at 02:50, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Yury,
>
> A couple comments in case it helps regarding the docs/comments discussion=
...
>
> On Fri, Mar 21, 2025 at 5:04=E2=80=AFPM Yury Norov <yury.norov@gmail.com>=
 wrote:
> >
> > In C we separate declarations from function body with an empty line.
> > Can you do that in rust? Can you point to a rust coding style? Do you
> > guys really use 2-whitespace tabs?
>
> Please see https://docs.kernel.org/rust/coding-guidelines.html.
>
> You are right that the example block you quoted should have the
> formatting fixed.
>
> I am not sure what you mean by separating declarations from body here.
> I guess you mean variable declarations in C vs. the rest of the body
> -- in Rust it is not done, i.e. declaring new bindings in the middle
> as they are needed is expected (and sometimes needed).
>
> > I think I already asked to make the test a separate unit. It's amazing
> > that rust understands scattered commented blocks of code and can turn
> > them into unit tests. Unfortunately, I'm not.
> >
> > Please create a separate unit and test everything there, just like we
> > do with normal C code.
>
> APIs should have examples, ideally good ones etc. The above looks like
> an standard example, but maybe I am missing something.
>
> The examples are meant to be documentation first and foremost, that
> happens to double as a test (so that it does not get out of sync
> etc.). It is how we document everything else in Rust, and in fact we
> are becoming stricter in requesting more examples when people add more
> APIs (otherwise they never get added :)
>
> If actual tests are needed (i.e. on top of what examples provide),
> then we just finally landed in -next `#[test]`-like support, i.e. unit
> tests that can be written separately. We try to have tests as close as
> possible to the code they exercise, too, but in some cases it may be
> best to separate them (e.g. if there are way too many).
>
> > For find_bit functions we have a lib/find_bit_benchmark.c Can you add
> > a similar rust test, so we'll make sure you're not introducing
> > performance regressions with your wrappers?
> >
> > Please don't use KUNITs. It's not ready for benchmarks, and tests built
> > against it don't run on major distros.
>
> Cc'ing David here in case he has more context around this...
>
> I agree having a good "integrated benchmark" system would be nice, and
> being able to mark particular "tests" as benchmarks etc.
>
> Regarding distributions, it sounds an orthogonal issue to me, but I
> may be lacking context...
>

Yeah: nothing has particularly changed here. KUnit is not aimed at
benchmarks specifically, and while it isn't impossible to get
something "benchmark-like" to work with it, it's definitely
suboptimal. And there aren't any immediate plans to add any more
benchmarking functionality to KUnit, though I'd be happy to hear any
proposals. :-)

If requiring CONFIG_KUNIT to be set (which, as mentioned in previous
discussions, is not the default on many distros) is a dealbreaker for
running tests, then of course that limits any tests to not using
KUnit. That being said, I suspect that supporting the "just build this
one test module against your existing kernel" case is going to be a
bit more of a pain here anyway, as it might end up depending on having
exactly the same toolchain/config/etc due to Rust's ABI not being
stable. (Am I missing anything here, Miguel?) And, of course, Rust's
built-in tests here would get automatically compiled down to KUnit
tests if enabled.

So, what I suspect you're looking for here is a separate module /
crate which benchmarks the bitmap type. With the way Rust crates are
laid out, I suspect this would need to live in a separate directory
and look something like samples/rust/rust_minimal.rs?

-- David

--0000000000005bde6a0631632cb3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
YE9NAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHgsCGkO2Hex
N6ybc+GeQEb6790qMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQAs
exV05yVDmPhHRqOq9lAbfWOUvEf8zydxabZUHna6bayb83jD2eb9nMGGEprfuNBRmFg35sgF1TyN
+ieuQakvQYmY8tzK49hhHa2Y3qhGCTqYTHO3ypHvhHsZiGbL0gmdgB9P8ssVIws//34ae99GUOxo
XKTxPwwsQ5Arq42besv3/HXAW+4nRAT8d3ht5ZWCHc5rjL/vdGzu7PaYo3u0da69AZ8Sh4Gf5yoc
QANr2ZkMrxXbLmSmnRvbkQrzlZp2YbTFnczx46429D6q75/FNFOL1vAjxtRAPzkyACvW0eKvchza
TMvvD3IWERLlcBL5yXpENc3rI8/wVjqgAWYxlFg1b/4b/TCgYe2MZC0rx4Uh3zTIbmPNiHdN6QZ9
oDiYzWUcqWZ5jCO4bMKNlVJXeCvdANLHuhcC8FONj5VzNgYXs6gWkp9/Wt6XnQPX4dF4JBa8JdL/
cT46RJIzoiJHEx/8syO5FparZHIKbkunoq6niPsRaQUGeqWc56H4Z1sQXuBJN9fhqkIkG0Ywfrwt
uFrCoYIRlx4rSVHpBIKgnsgdm0SFQK72MPmIkfhfq9Fh0h8AjhF73sLO7K5BfwWkx1gwMySyNY0e
PCRYr6WEVOkUJS0a0fui693ymMPFLQAimmz8EpyFok4Ju066StkYO1dIgUIla4x61auxkWHwnzGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgcSMngo+PkLujf0dl6QNMnWe0ldUq
Yfl3uaMv9Z9HLO4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
MzI4MDg1MTE2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAOfqDtZmBlN/vY4e/ja0zwjSRLvBBqQ2HUkgkzVf1H3/KPJpNW4Ir+sJ14f5iBGNC
GieVZsAOpbyDpSFV5AhlJP4PZzhM5J0Eau+I/hnJ/mxbj4Hf+Gt33kE8YVFAomxM3kM9Ar8rf3ry
H9nvy/M9VEOpdeO+3nk0AvnTYV2MB9+6Mivh/V5FG83jJ0q5sCCD+YWmgdVOZE7eGbJall3Q0Zo7
XVJ5sb8cWqhruHp/IRwVGMkFk0P1srj9j0/sD/hNZYRDtVmmdJtbSW4si4XbWYqPpabOMH1crx6a
OKxdKCU/0w86voSIaEwunKw/KMAx41DzPankswZS9Oy5RM5b2A==
--0000000000005bde6a0631632cb3--
