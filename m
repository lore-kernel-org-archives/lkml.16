Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D562E718F;
	Tue, 17 Jun 2025 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168903; cv=none; b=l7BA3pWM32H6OTKDNMwGEz4EdOltkC3xfGNHMMiJVOraHcegTDoZ8aBpuIH6ioKrSf2Dj3DE+2aghDDsQJvI/jfAfhF/a5FrhEx+Y7H7eoVoGGZj004H7sqoXlkFMYRmuC8BVUHPt8LQ+Mqe1HQQ9xNpU+7DdwJdLnshOuLE6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168903; c=relaxed/simple;
	bh=RGbVJp+/TGi/D6SOJViZ02NYISG0weGjSafBad5SbjQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=p4I+9CeQ6sFbFVJFcE+YuPjUzYhNGtdWFafHA2y0c0DNLH3j38OV54IMxGW0wkbW06N1BGv5j6YaMKyqu0tcR79590h0Q5TUoebFK9bqU3RktSzT/4nNqehCGzVwy1xdRcUUIATbEBcKpqkoq/2sLp3UvkzePGKldPWHShWbuEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKPKK90a; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKPKK90a"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so45897685e9.0;
        Tue, 17 Jun 2025 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750168899; x=1750773699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJKLC7eKZke0IB5Sh6svb1KO3mG+1rKn4rQIRA5DHYo=;
        b=KKPKK90ac2vWUCthYQmhoI3eBVwZImmSW35ODQggV8+Qdsf2EIlzj/IwPfu4S/xmBg
         HErBk/tCGVlgG7kp9gUT2ITlZ9jb0errGNlnpa4DHO3FDMnFk7W+q9LlhS3oerZ1zD6U
         vkBuSnd5Ps1BFwc0j6L/SWhrWDngR+tSyIOVl5jTykH0XA1cWqiYTcd+i9O72DsTYN+v
         N3Q5d0elYryHS25H3frXmlzibruVSGyr3vbuHzaSvmCrKe4DM6Ps5mc3eYcFlt++Hc1k
         hrDOSTNZN+irximPS1+UCxiggZ9BXwkzCUqa49Z8wfuW9j258Hbgc711C90FOlL+Tqtg
         bBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168899; x=1750773699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJKLC7eKZke0IB5Sh6svb1KO3mG+1rKn4rQIRA5DHYo=;
        b=HEcmyTw/AEHVJqSWD/XVMYYDNkDgPFild2PmT/D1u0/CYqxCjxuMcNlgd1BIQPxJae
         h7OvOUPViHIiSMfPig5xPK0/CfqUnJ0tydi2yjU/LIiT6Kbs4qtwg3WwQ/A3+NVj5kCd
         P2BIr+T/aMfsjiCttT+KTZKWc51Gz3SyPcppMUTo2x9rUnuGu+ke+bh+h68rTm2wQXui
         kL12YoaG8Gm08H9wDbbUajVFdvZb6BasmJMuf5hFr7HOr15C8dIqpkvymf0w+WLvAMBv
         RxqqmPIZehyvl8Ntu+RqmvHvotzXj9f4GlLLRmYfC4H4oduXJJxVZRXENrT4CB7IweGJ
         LaGQ==
X-Forwarded-Encrypted: i=1; AJvYcCURthEeTrTH4a13dUudGFtyfoLpV30PBiDckKYegO100MiDZlhkwbIpyVyDAJW6ZZ5sKM/6GCS/O+N48P16Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4BWR1/VMKh8pRYAkyAlcYnQCkOw/9zl5ZL90NXzWgr815o4Ry
	13RFm+kevMLX4OZEs9HW40BV0nzjp8eAJWQu929219qmko/mkcW3mtsaw9tJHg==
X-Gm-Gg: ASbGncsFGNyoeaKFvO9sj0/OaaHRlAnV4W6ctRCHRG24pDWT23CtBCY+k3jv35bUOXG
	qxkxapFzYPLGS4bumuzt+vqSG1ZU51NzaZuUb8h4v4r80zQp3r/gPvLIMftVz5R5CS8aYsPDmYp
	rjbcwr9tI9tg2nHE9w/iPieZUiV6JPAxEYs/kDs+umoJMQ3dvco8O4htg2a7oQ/wwUFejT89H08
	YNKhIjyQUB3fQ5kG0BiKSSFenBFBn91ACv7apIXukr3IOab6NvtcyTpNNULRkK4RHYk0TEQoF1k
	9m5ETtVtnvtkbZZiju9H0IHaeBlC8oKdAKeQb7B6GrOucD7w6s0iKulUCrIUykWrCw==
X-Google-Smtp-Source: AGHT+IFfq6l9dd1y6JDi+g6JfI8/cIuMFXEf9HCnftPJY2xV0m8mbGjpFS5DgfgxE6DsCORr5nl1Yg==
X-Received: by 2002:a05:600c:1d25:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-4533be20f2cmr136747645e9.3.1750168898045;
        Tue, 17 Jun 2025 07:01:38 -0700 (PDT)
Received: from fedora.. ([82.67.147.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14fc98sm183451855e9.29.2025.06.17.07.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:01:37 -0700 (PDT)
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	ojeda@kernel.org,
	guillaume1.gomez@gmail.com
Subject: [PATCH 1/1] Use new `--output-format=doctest` rustdoc command line flag to improve doctest handling
Date: Tue, 17 Jun 2025 16:00:33 +0200
Message-ID: <20250617140032.1133337-2-guillaume1.gomez@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of this patch is to remove the use of 2 unstable
rustdoc features (`--no-run` and `--test-builder`) and replace it with a
stable feature: `--output-format=doctest`, which was added in
https://github.com/rust-lang/rust/pull/134531.

Before this patch, the code was using very hacky methods in order to retrieve
doctests, modify them as needed and then concatenate all of them in one file.

Now, with this new flag, it instead asks rustdoc to provide the doctests
code with their associated information such as file path and line number.

Signed-off-by: Guillaume Gomez <guillaume1.gomez@gmail.com>
---
 rust/Makefile                   |   7 +-
 scripts/json.rs                 | 235 ++++++++++++++++++++++++++++++++
 scripts/rustdoc_test_builder.rs | 128 +++++++++++------
 scripts/rustdoc_test_gen.rs     |  11 +-
 4 files changed, 329 insertions(+), 52 deletions(-)
 create mode 100644 scripts/json.rs

diff --git a/rust/Makefile b/rust/Makefile
index 27dec7904c3a..b643514221b3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -205,14 +205,15 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
 	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) --test $(filter-out --remap-path-prefix=%,$(rust_flags)) \
+	$(RUSTDOC) --output-format=doctest $(filter-out --remap-path-prefix=%,$(rust_flags)) \
 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
 		--extern kernel --extern build_error --extern macros \
 		--extern bindings --extern uapi \
-		--no-run --crate-name kernel -Zunstable-options \
+		--crate-name kernel -Zunstable-options \
 		--sysroot=/dev/null \
 		--test-builder $(objtree)/scripts/rustdoc_test_builder \
-		$< $(rustdoc_test_kernel_quiet); \
+		$< $(rustdoc_test_kernel_quiet) > rustdoc.json; \
+	cat rustdoc.json | $(objtree)/scripts/rustdoc_test_builder; \
 	$(objtree)/scripts/rustdoc_test_gen
 
 %/doctests_kernel_generated.rs %/doctests_kernel_generated_kunit.c: \
diff --git a/scripts/json.rs b/scripts/json.rs
new file mode 100644
index 000000000000..aff24bfd9213
--- /dev/null
+++ b/scripts/json.rs
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! JSON parser used to parse rustdoc output when retrieving doctests.
+
+use std::collections::HashMap;
+use std::iter::Peekable;
+use std::str::FromStr;
+
+#[derive(Debug, PartialEq, Eq)]
+pub(crate) enum JsonValue {
+    Object(HashMap<String, JsonValue>),
+    String(String),
+    Number(i32),
+    Bool(bool),
+    Array(Vec<JsonValue>),
+    Null,
+}
+
+fn parse_ident<I: Iterator<Item = char>>(
+    iter: &mut I,
+    output: JsonValue,
+    ident: &str,
+) -> Result<JsonValue, String> {
+    let mut ident_iter = ident.chars().skip(1);
+
+    loop {
+        let i = ident_iter.next();
+        if i.is_none() {
+            return Ok(output);
+        }
+        let c = iter.next();
+        if i != c {
+            if let Some(c) = c {
+                return Err(format!("Unexpected character `{c}` when parsing `{ident}`"));
+            }
+            return Err(format!("Missing character when parsing `{ident}`"));
+        }
+    }
+}
+
+fn parse_string<I: Iterator<Item = char>>(iter: &mut I) -> Result<JsonValue, String> {
+    let mut out = String::new();
+
+    while let Some(c) = iter.next() {
+        match c {
+            '\\' => {
+                let Some(c) = iter.next() else { break };
+                match c {
+                    '"' | '\\' | '/' => out.push(c),
+                    'b' => out.push(char::from(0x8u8)),
+                    'f' => out.push(char::from(0xCu8)),
+                    't' => out.push('\t'),
+                    'r' => out.push('\r'),
+                    'n' => out.push('\n'),
+                    _ => {
+                        // This code doesn't handle codepoints so we put the string content as is.
+                        out.push('\\');
+                        out.push(c);
+                    }
+                }
+            }
+            '"' => {
+                return Ok(JsonValue::String(out));
+            }
+            _ => out.push(c),
+        }
+    }
+    Err(format!("Unclosed JSON string `{out}`"))
+}
+
+fn parse_number<I: Iterator<Item = char>>(
+    iter: &mut Peekable<I>,
+    digit: char,
+) -> Result<JsonValue, String> {
+    let mut nb = String::new();
+
+    nb.push(digit);
+    loop {
+        // We peek next character to prevent taking it from the iterator in case it's a comma.
+        if matches!(iter.peek(), Some(',' | '}' | ']')) {
+            break;
+        }
+        let Some(c) = iter.next() else { break };
+        if c.is_whitespace() {
+            break;
+        } else if !c.is_ascii_digit() {
+            return Err(format!("Error when parsing number `{nb}`: found `{c}`"));
+        }
+        nb.push(c);
+    }
+    i32::from_str(&nb)
+        .map(|nb| JsonValue::Number(nb))
+        .map_err(|error| format!("Invalid number: `{error}`"))
+}
+
+fn parse_array<I: Iterator<Item = char>>(iter: &mut Peekable<I>) -> Result<JsonValue, String> {
+    let mut values = Vec::new();
+
+    'main: loop {
+        let Some(c) = iter.next() else {
+            return Err("Unclosed array".to_string());
+        };
+        if c.is_whitespace() {
+            continue;
+        } else if c == ']' {
+            break;
+        }
+        values.push(parse(iter, c)?);
+        while let Some(c) = iter.next() {
+            if c.is_whitespace() {
+                continue;
+            } else if c == ',' {
+                break;
+            } else if c == ']' {
+                break 'main;
+            } else {
+                return Err(format!("Unexpected `{c}` when parsing array"));
+            }
+        }
+    }
+    Ok(JsonValue::Array(values))
+}
+
+fn parse_object<I: Iterator<Item = char>>(iter: &mut Peekable<I>) -> Result<JsonValue, String> {
+    let mut values = HashMap::new();
+
+    'main: loop {
+        let Some(c) = iter.next() else {
+            return Err("Unclosed object".to_string());
+        };
+        let key;
+        if c.is_whitespace() {
+            continue;
+        } else if c == '"' {
+            let JsonValue::String(k) = parse_string(iter)? else {
+                unreachable!()
+            };
+            key = k;
+        } else if c == '}' {
+            break;
+        } else {
+            return Err(format!("Expected `\"` when parsing Object, found `{c}`"));
+        }
+
+        // We then get the `:` separator.
+        loop {
+            let Some(c) = iter.next() else {
+                return Err(format!("Missing value after key `{key}`"));
+            };
+            if c.is_whitespace() {
+                continue;
+            } else if c == ':' {
+                break;
+            } else {
+                return Err(format!(
+                    "Expected `:` after key, found `{c}` when parsing object"
+                ));
+            }
+        }
+        // Then the value.
+        let value = loop {
+            let Some(c) = iter.next() else {
+                return Err(format!("Missing value after key `{key}`"));
+            };
+            if c.is_whitespace() {
+                continue;
+            } else {
+                break parse(iter, c)?;
+            }
+        };
+
+        if values.contains_key(&key) {
+            return Err(format!("Duplicated key `{key}`"));
+        }
+        values.insert(key, value);
+
+        while let Some(c) = iter.next() {
+            if c.is_whitespace() {
+                continue;
+            } else if c == ',' {
+                break;
+            } else if c == '}' {
+                break 'main;
+            } else {
+                return Err(format!("Unexpected `{c}` when parsing array"));
+            }
+        }
+    }
+    Ok(JsonValue::Object(values))
+}
+
+fn parse<I: Iterator<Item = char>>(iter: &mut Peekable<I>, c: char) -> Result<JsonValue, String> {
+    match c {
+        '{' => parse_object(iter),
+        '"' => parse_string(iter),
+        '[' => parse_array(iter),
+        't' => parse_ident(iter, JsonValue::Bool(true), "true"),
+        'f' => parse_ident(iter, JsonValue::Bool(false), "false"),
+        'n' => parse_ident(iter, JsonValue::Null, "null"),
+        c => {
+            if c.is_ascii_digit() || c == '-' {
+                parse_number(iter, c)
+            } else {
+                Err(format!("Unexpected `{c}` character"))
+            }
+        }
+    }
+}
+
+impl JsonValue {
+    pub(crate) fn parse(input: &str) -> Result<Self, String> {
+        let mut iter = input.chars().peekable();
+        let mut value = None;
+
+        while let Some(c) = iter.next() {
+            if c.is_whitespace() {
+                continue;
+            }
+            value = Some(parse(&mut iter, c)?);
+            break;
+        }
+        while let Some(c) = iter.next() {
+            if c.is_whitespace() {
+                continue;
+            } else {
+                return Err(format!("Unexpected character `{c}` after content"));
+            }
+        }
+        if let Some(value) = value {
+            Ok(value)
+        } else {
+            Err("Empty content".to_string())
+        }
+    }
+}
diff --git a/scripts/rustdoc_test_builder.rs b/scripts/rustdoc_test_builder.rs
index f7540bcf595a..f4cb9457a705 100644
--- a/scripts/rustdoc_test_builder.rs
+++ b/scripts/rustdoc_test_builder.rs
@@ -15,60 +15,100 @@
 //! from that. For the moment, we generate ourselves a new name, `{file}_{number}` instead, in
 //! the `gen` script (done there since we need to be aware of all the tests in a given file).
 
+use std::collections::HashMap;
 use std::io::Read;
+use std::fs::create_dir_all;
 
-fn main() {
-    let mut stdin = std::io::stdin().lock();
-    let mut body = String::new();
-    stdin.read_to_string(&mut body).unwrap();
+use json::JsonValue;
 
-    // Find the generated function name looking for the inner function inside `main()`.
-    //
-    // The line we are looking for looks like one of the following:
-    //
-    // ```
-    // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_28_0() {
-    // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_37_0() -> Result<(), impl ::core::fmt::Debug> {
-    // ```
-    //
-    // It should be unlikely that doctest code matches such lines (when code is formatted properly).
-    let rustdoc_function_name = body
-        .lines()
-        .find_map(|line| {
-            Some(
-                line.split_once("fn main() {")?
-                    .1
-                    .split_once("fn ")?
-                    .1
-                    .split_once("()")?
-                    .0,
-            )
-            .filter(|x| x.chars().all(|c| c.is_alphanumeric() || c == '_'))
-        })
-        .expect("No test function found in `rustdoc`'s output.");
+mod json;
 
-    // Qualify `Result` to avoid the collision with our own `Result` coming from the prelude.
-    let body = body.replace(
-        &format!("{rustdoc_function_name}() -> Result<(), impl ::core::fmt::Debug> {{"),
-        &format!(
-            "{rustdoc_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"
-        ),
-    );
+fn generate_doctest(file: &str, line: i32, doctest_code: &HashMap<String, JsonValue>) -> bool {
+    // FIXME: Once let chain feature is stable, please use it instead.
+    let Some(JsonValue::Object(wrapper)) = doctest_code.get("wrapper") else { return false };
+    let Some(JsonValue::String(before)) = wrapper.get("before") else { return false };
+    let Some(JsonValue::String(after)) = wrapper.get("after") else { return false };
+    let Some(JsonValue::String(code)) = doctest_code.get("code") else { return false };
+    let Some(JsonValue::String(crate_level_code)) = doctest_code.get("crate_level") else { return false };
 
-    // For tests that get generated with `Result`, like above, `rustdoc` generates an `unwrap()` on
+    // For tests that get generated with `Result`, `rustdoc` generates an `unwrap()` on
     // the return value to check there were no returned errors. Instead, we use our assert macro
     // since we want to just fail the test, not panic the kernel.
     //
     // We save the result in a variable so that the failed assertion message looks nicer.
-    let body = body.replace(
-        &format!("}} {rustdoc_function_name}().unwrap() }}"),
-        &format!("}} let test_return_value = {rustdoc_function_name}(); assert!(test_return_value.is_ok()); }}"),
-    );
+    let after = if let Some(JsonValue::Bool(true)) = wrapper.get("returns_result") {
+        "\n} let test_return_value = _inner(); assert!(test_return_value.is_ok()); }"
+    } else {
+        after.as_str()
+    };
+    let code = format!("{crate_level_code}\n{before}\n{code}{after}\n");
+
+    let file = file
+        .strip_suffix(".rs")
+        .unwrap_or(file)
+        .strip_prefix("../rust/kernel/")
+        .unwrap_or(file)
+        .replace('/', "_");
+    let path = format!("rust/test/doctests/kernel/{file}-{line}.rs");
+
+    std::fs::write(path, code.as_bytes()).unwrap();
+    true
+}
+
+fn main() {
+    let mut stdin = std::io::stdin().lock();
+    let mut body = String::new();
+    stdin.read_to_string(&mut body).unwrap();
+
+    let JsonValue::Object(rustdoc) = JsonValue::parse(&body).unwrap() else {
+        panic!("Expected an object")
+    };
+    if let Some(JsonValue::Number(format_version)) = rustdoc.get("format_version") {
+        if *format_version != 2 {
+            panic!("unsupported rustdoc format version: {format_version}");
+        }
+    } else {
+        panic!("missing `format_version` field");
+    }
+    let Some(JsonValue::Array(doctests)) = rustdoc.get("doctests") else {
+        panic!("`doctests` field is missing or has the wrong type");
+    };
 
-    // Figure out a smaller test name based on the generated function name.
-    let name = rustdoc_function_name.split_once("_rust_kernel_").unwrap().1;
+    // We ignore the error since it will fail when generating doctests below if the folder doesn't
+    // exist.
+    let _ = create_dir_all("rust/test/doctests/kernel");
 
-    let path = format!("rust/test/doctests/kernel/{name}");
+    let mut nb_generated = 0;
+    for doctest in doctests {
+        let JsonValue::Object(doctest) = doctest else {
+            unreachable!()
+        };
+        // We check if we need to skip this test by checking it's a rust code and it's not ignored.
+        if let Some(JsonValue::Object(attributes)) = doctest.get("doctest_attributes") {
+            if attributes.get("rust") != Some(&JsonValue::Bool(true)) {
+                continue;
+            } else if let Some(JsonValue::String(ignore)) = attributes.get("ignore") {
+                if ignore != "None" {
+                    continue;
+                }
+            }
+        }
+        if let (
+            Some(JsonValue::String(file)),
+            Some(JsonValue::Number(line)),
+            Some(JsonValue::Object(doctest_code)),
+        ) = (
+            doctest.get("file"),
+            doctest.get("line"),
+            doctest.get("doctest_code"),
+        ) {
+            if generate_doctest(file, *line, doctest_code) {
+                nb_generated += 1;
+            }
+        }
+    }
 
-    std::fs::write(path, body.as_bytes()).unwrap();
+    if nb_generated == 0 {
+        panic!("No test function found in `rustdoc`'s output.");
+    }
 }
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index 1ca253594d38..b23fc7c91f54 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -48,7 +48,7 @@
 fn find_real_path<'a>(srctree: &Path, valid_paths: &'a mut Vec<PathBuf>, file: &str) -> &'a str {
     valid_paths.clear();
 
-    let potential_components: Vec<&str> = file.strip_suffix("_rs").unwrap().split('_').collect();
+    let potential_components: Vec<&str> = file.split('_').collect();
 
     find_candidates(srctree, valid_paths, Path::new(""), &potential_components);
     fn find_candidates(
@@ -88,7 +88,7 @@ fn find_candidates(
     assert!(
         valid_paths.len() > 0,
         "No path candidates found for `{file}`. This is likely a bug in the build system, or some \
-        files went away while compiling."
+        files went away while compiling.",
     );
 
     if valid_paths.len() > 1 {
@@ -126,12 +126,13 @@ fn main() {
     let mut valid_paths: Vec<PathBuf> = Vec::new();
     let mut real_path: &str = "";
     for path in paths {
-        // The `name` follows the `{file}_{line}_{number}` pattern (see description in
+        // The `name` follows the `{file}_{line}` pattern (see description in
         // `scripts/rustdoc_test_builder.rs`). Discard the `number`.
         let name = path.file_name().unwrap().to_str().unwrap().to_string();
 
-        // Extract the `file` and the `line`, discarding the `number`.
-        let (file, line) = name.rsplit_once('_').unwrap().0.rsplit_once('_').unwrap();
+        // Extract the `file` and the `line`, discarding the extension.
+        let (file, line) = name.rsplit_once('-').unwrap();
+        let line = line.split('.').next().unwrap();
 
         // Generate an ID sequence ("test number") for each one in the file.
         if file == last_file {
-- 
2.49.0

